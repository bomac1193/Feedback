// midi_learn.js — MIDI CC learn system for Chaos Resonator
// Inlet 0: list from [ctlin] (value, cc#, channel)
// Inlet 1: learn toggle (0/1)
// Inlet 2: param index from umenu
// Outlet 0: messages like "chaos_gain 0.05" to [s toGen]
inlets = 3;
outlets = 1;

var learn_mode = 0;
var selected_param = 0;
var mappings = {};

var params = [
    { name: "chaos_gain", min: 0., max: 0.1 },
    { name: "rho", min: 20., max: 200. },
    { name: "root_offset", min: -24., max: 24. },
    { name: "flex", min: 0., max: 1. },
    { name: "master_gain", min: 0., max: 1.5 },
    { name: "blend_mix", min: 0., max: 1. },
    { name: "mod_depth", min: 0., max: 2. },
    { name: "sub_amt", min: 0., max: 1.5 },
    { name: "arp_bpm", min: 20., max: 300. },
    { name: "arp_rate", min: 0.1, max: 50. },
    { name: "brightness", min: -1., max: 1. },
    { name: "sub_chaos", min: 0., max: 1. }
];

function list(val, cc, chan) {
    if (inlet == 0) {
        if (learn_mode && selected_param >= 0 && selected_param < params.length) {
            mappings[cc] = selected_param;
            post("MIDI Learn: CC" + cc + " -> " + params[selected_param].name + "\n");
            learn_mode = 0;  // auto-disable learn after mapping
        }
        if (mappings[cc] !== undefined) {
            var p = params[mappings[cc]];
            var scaled = p.min + (val / 127.0) * (p.max - p.min);
            outlet(0, p.name, scaled);
        }
    }
}

function msg_int(v) {
    if (inlet == 1) {
        learn_mode = v;
    } else if (inlet == 2) {
        selected_param = v;
    }
}

function bang() {
    if (inlet == 1) {
        // Clear all mappings
        mappings = {};
        post("MIDI Learn: all mappings cleared\n");
    }
}
