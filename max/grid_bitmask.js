// grid_bitmask.js — converts matrixctrl "col row state" to "usN bitmask" messages
// Lives inside [p grid_to_bitmask] subpatcher
// Input: list (col, row, state) from matrixctrl
// Output: message "usN value" where value is 6-bit bitmask for that step

inlets = 1;
outlets = 1;

// 16 steps, each stores a 6-bit bitmask (voices 1-6)
var masks = new Array(16);
for (var i = 0; i < 16; i++) masks[i] = 0;

function list(col, row, state) {
	if (col < 0 || col > 15 || row < 0 || row > 5) return;
	var bit = 1 << row;
	if (state > 0) {
		masks[col] = masks[col] | bit;
	} else {
		masks[col] = masks[col] & (~bit);
	}
	outlet(0, "us" + col, masks[col]);
}

// Clear all
function bang() {
	for (var i = 0; i < 16; i++) {
		masks[i] = 0;
		outlet(0, "us" + i, 0);
	}
}
