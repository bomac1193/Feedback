// rate_select.js — note division + mode (straight/triplet/dotted)
// Inlet 0: note value index (0=1/1, 1=1/2, 2=1/4, 3=1/8, 4=1/16, 5=1/32, 6=1/64)
// Inlet 1: mode (0=straight, 1=triplet, 2=dotted)
// Outlet 0: arp_div float value

inlets = 2;
outlets = 1;

var base_divs = [0.25, 0.5, 1, 2, 4, 8, 16];
var mode_mults = [1.0, 1.5, 0.6667];
var cur_note = 3;
var cur_mode = 0;

function msg_int(v) {
	if (inlet === 0) {
		cur_note = Math.max(0, Math.min(6, v));
	} else {
		cur_mode = Math.max(0, Math.min(2, v));
	}
	outlet(0, base_divs[cur_note] * mode_mults[cur_mode]);
}

function bang() {
	outlet(0, base_divs[cur_note] * mode_mults[cur_mode]);
}

function loadbang() {
	outlet(0, base_divs[cur_note] * mode_mults[cur_mode]);
}
