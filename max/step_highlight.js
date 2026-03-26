// step_highlight.js — per-voice step meters (one multislider per lane)
// Inlet 0: shared step position (int 0-15)
// Inlet 1: poly packed value (ps1 + ps2*16 + ps3*256 + ...)
// Inlet 2: poly_mode (0 or 1)
// Inlet 3: poly lengths as list (6 ints from pack object)
// Outlets 0-5: list for voice 1-6 step meter multislider (16 values each)

inlets = 4;
outlets = 6;

var NUM_STEPS = 16;
var NUM_VOICES = 6;
var poly_mode = 0;
var poly_steps = [0, 0, 0, 0, 0, 0];
var poly_lens = [16, 16, 16, 16, 16, 16];
var shared_step = 0;

function msg_int(v) {
	if (inlet === 0) {
		shared_step = Math.max(0, Math.min(15, Math.floor(v)));
		update_cursor();
	} else if (inlet === 1) {
		var val = Math.floor(v);
		for (var i = 0; i < NUM_VOICES; i++) {
			poly_steps[i] = val & 15;
			val = Math.floor(val / 16);
		}
		if (poly_mode) update_cursor();
	} else if (inlet === 2) {
		poly_mode = (v > 0.5) ? 1 : 0;
		update_cursor();
	} else if (inlet === 3) {
		poly_lens[0] = Math.max(1, Math.min(16, Math.floor(v)));
		update_cursor();
	}
}

function msg_float(v) {
	msg_int(Math.floor(v));
}

function list() {
	if (inlet === 3) {
		var args = arrayfromargs(arguments);
		for (var i = 0; i < Math.min(args.length, NUM_VOICES); i++) {
			poly_lens[i] = Math.max(1, Math.min(16, Math.floor(args[i])));
		}
		update_cursor();
	}
}

function update_cursor() {
	for (var r = 0; r < NUM_VOICES; r++) {
		var row = new Array(NUM_STEPS);
		var len = poly_lens[r];
		var pos = poly_mode ? poly_steps[r] : shared_step;

		for (var c = 0; c < NUM_STEPS; c++) {
			if (c >= len && poly_mode) {
				row[c] = 0.15;
			} else if (c === (pos % NUM_STEPS)) {
				row[c] = 1.0;
			} else {
				row[c] = 0.0;
			}
		}
		outlet(r, row);
	}
}

function bang() {
	update_cursor();
}

function loadbang() {
	update_cursor();
}
