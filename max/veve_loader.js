// ============================================
// VEVE PRESET LOADER
// ============================================
// Sends veve adjacency matrices as bitmask Param
// messages to gen~ kuramoto_veve engine.
//
// USAGE IN MAX PATCHER:
//   [js veve_loader.js]
//   |
//   Outlet 0: status messages
//   Outlet 1: preset index (int)
//   Outlet 2: row param messages → gen~ inlet 0
//
// MESSAGES:
//   load <index>    — load preset by index (0-5)
//   load <name>     — load preset by name
//   init            — initialize and load default (0)
//   dump            — print current adjacency matrix
//   info            — print all available presets
//   <integer>       — load preset by index
//
// ============================================

inlets = 1;
outlets = 3;  // 0: status, 1: preset index, 2: row param messages → gen~

var current_preset = -1;

// ============================================
// EMBEDDED PRESETS (no external JSON needed)
// ============================================
// Source: Milo Rigaud, Ve-Ve: Diagrammes Rituels
//         du Voudou (1974)
//
// adj = row-major flattened 6x6 adjacency matrix
// Row i, col j: does oscillator j pull on oscillator i?
// ============================================

var presets = [
	{
		index: 0,
		name: "All-to-all",
		source: "Default (standard Kuramoto)",
		description: "Every oscillator couples to every other. Maximum synchronization potential.",
		predicted_behavior: "Classic Kuramoto: smooth transition from free to locked as K increases.",
		adj: [
			0,1,1,1,1,1,
			1,0,1,1,1,1,
			1,1,0,1,1,1,
			1,1,1,0,1,1,
			1,1,1,1,0,1,
			1,1,1,1,1,0
		],
		node_labels: ["iya_ilu", "omele_1", "ogene", "gudugudu", "omele_2", "shekere"]
	},
	{
		index: 1,
		name: "Legba Carrefour",
		source: "Rigaud p.168 — Crossroads hub",
		description: "Center hub connects to all 5. Arms connect only to center. Star topology.",
		predicted_behavior: "Strong leader-follower. Center entrains all arms. Arms don't influence each other.",
		adj: [
			0,1,1,1,1,1,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0
		],
		node_labels: ["center_hub", "north_arm", "east_arm", "south_arm", "west_arm", "staff"]
	},
	{
		index: 2,
		name: "Carrefour Diamond",
		source: "Rigaud p.185 — Diamond mesh",
		description: "5 nodes fully connected in diamond. 6th node peripheral through node 4.",
		predicted_behavior: "Near-all-to-all lock for 5 core voices. One outsider drifts — rhythmic tension.",
		adj: [
			0,1,1,1,1,0,
			1,0,1,1,1,0,
			1,1,0,1,1,0,
			1,1,1,0,1,0,
			1,1,1,1,0,1,
			0,0,0,0,1,0
		],
		node_labels: ["center_cross", "north_star", "east_star", "south_star", "west_star", "spiral"]
	},
	{
		index: 3,
		name: "Ferraille",
		source: "Rigaud p.240 — V-shape sabre",
		description: "V-graph: junction connects to 2 tips. Oscillators 3-5 completely free.",
		predicted_behavior: "Two-against-one lock + 3 free voices. Fractured groove at high K.",
		adj: [
			0,1,1,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			0,0,0,0,0,0,
			0,0,0,0,0,0,
			0,0,0,0,0,0
		],
		node_labels: ["junction", "left_tip", "right_tip", "free_1", "free_2", "free_3"]
	},
	{
		index: 4,
		name: "Ogou Bhathalah",
		source: "Rigaud p.230 — W/M zigzag",
		description: "3 diamond centers in chain (L-M-R). Star endpoints at vertices. Zigzag topology.",
		predicted_behavior: "Wave propagation L-to-M-to-R. Sync cascades along the chain — rolling groove.",
		adj: [
			0,1,0,1,1,0,
			1,0,1,0,1,0,
			0,1,0,0,1,1,
			1,0,0,0,0,0,
			1,1,1,0,0,0,
			0,0,1,0,0,0
		],
		node_labels: ["L_diamond", "M_diamond", "R_diamond", "TL_star", "B_star", "TR_star"]
	},
	{
		index: 5,
		name: "Legba co-sou",
		source: "Rigaud p.170 — Circle with dots",
		description: "Nearest-neighbor ring. Each oscillator connects to its 2 immediate neighbors.",
		predicted_behavior: "Traveling wave. Phase patterns rotate — circular rhythm cascade.",
		adj: [
			0,1,0,0,0,1,
			1,0,1,0,0,0,
			0,1,0,1,0,0,
			0,0,1,0,1,0,
			0,0,0,1,0,1,
			1,0,0,0,1,0
		],
		node_labels: ["ring_0", "ring_1", "ring_2", "ring_3", "ring_4", "ring_5"]
	},
	{
		index: 6,
		name: "Marassa",
		source: "Rigaud p.118 — Divine Twins",
		description: "Two disconnected triangles. Group A (1-2-3) and Group B (4-5-6) sync internally but never connect.",
		predicted_behavior: "Two independent rhythmic worlds. Each triangle locks internally, groups drift against each other — polyrhythmic phasing.",
		adj: [
			0,1,1,0,0,0,
			1,0,1,0,0,0,
			1,1,0,0,0,0,
			0,0,0,0,1,1,
			0,0,0,1,0,1,
			0,0,0,1,1,0
		],
		node_labels: ["twin_A1", "twin_A2", "twin_A3", "twin_B1", "twin_B2", "twin_B3"]
	}
];


// ============================================
// INIT — just load default preset (0)
// ============================================

function init() {
	post("veve_loader: " + presets.length + " presets ready (embedded)\n");
	for (var i = 0; i < presets.length; i++) {
		post("  [" + i + "] " + presets[i].name + "\n");
	}
	load(0);
}


// ============================================
// LOAD — compute bitmasks, send to gen~
// ============================================

function load(arg) {
	var preset = null;

	// Find by index or name
	if (typeof arg === "number") {
		var idx = Math.floor(arg);
		if (idx >= 0 && idx < presets.length) {
			preset = presets[idx];
		}
	} else if (typeof arg === "string") {
		for (var i = 0; i < presets.length; i++) {
			if (presets[i].name.toLowerCase() === arg.toLowerCase()) {
				preset = presets[i];
				break;
			}
		}
	}

	if (preset === null) {
		error("veve_loader: Preset not found: " + arg + "\n");
		return;
	}

	// Send adjacency matrix rows as bitmask Param messages to gen~
	// bitmask = col0*1 + col1*2 + col2*4 + col3*8 + col4*16 + col5*32
	for (var row = 0; row < 6; row++) {
		var bitmask = 0;
		for (var col = 0; col < 6; col++) {
			if (preset.adj[row * 6 + col] > 0) {
				bitmask += (1 << col);
			}
		}
		outlet(2, "row" + row, bitmask);
	}

	// Also send veve_preset index so gen~ can pass it to TD
	outlet(2, "veve_preset", preset.index);

	current_preset = preset.index;

	// Output status
	outlet(0, "loaded", preset.index, preset.name);
	outlet(1, preset.index);

	post("veve_loader: Loaded [" + preset.index + "] " + preset.name + "\n");
	post("  " + preset.description + "\n");
	post("  " + preset.predicted_behavior + "\n");
}


// ============================================
// DUMP — print current adjacency matrix
// ============================================

function dump() {
	if (current_preset < 0) {
		post("veve_loader: No preset loaded\n");
		return;
	}

	var p = presets[current_preset];
	post("veve_loader: Current preset [" + p.index + "] " + p.name + "\n");
	post("  Adjacency matrix (row = pulled, col = puller):\n");

	for (var row = 0; row < 6; row++) {
		var line = "  [";
		for (var col = 0; col < 6; col++) {
			line += p.adj[row * 6 + col];
			if (col < 5) line += ", ";
		}
		line += "]  <- osc " + (row + 1) + " (" + p.node_labels[row] + ")";
		post(line + "\n");
	}
}


// ============================================
// INFO — list all presets
// ============================================

function info() {
	post("veve_loader: " + presets.length + " presets available\n");
	for (var i = 0; i < presets.length; i++) {
		var p = presets[i];
		var marker = (i === current_preset) ? " <- ACTIVE" : "";
		post("  [" + i + "] " + p.name + " -- " + p.source + marker + "\n");
	}
}


// ============================================
// MSG_INT — load by index when receiving integer
// ============================================

function msg_int(v) {
	load(v);
}


// ============================================
// ANYTHING — catch named messages
// ============================================

function anything() {
	var msg = messagename;
	if (msg === "load" && arguments.length > 0) {
		load(arguments[0]);
	} else if (msg === "init") {
		init();
	} else if (msg === "dump") {
		dump();
	} else if (msg === "info") {
		info();
	} else {
		// Try as preset name
		load(msg);
	}
}
