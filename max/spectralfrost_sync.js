// Spectralfrost realtime sender for Node for Max
//
// Usage examples in Max:
//   node.script spectralfrost_sync.js
//   abstraction 0.35
//   z_deform 12.
//   z_deform_scale 8.
//   subdivision 1
//   line_scale 1.4
//   electric_strength 4.0
//   main_text Enter
//   sub_text Text
//   json {"Abstraction":0.3,"Electric Strength":5.0}
//
// Blender side:
//   Sxlera panel > Realtime Max Sync > Start Max Sync
//   Default UDP target: 127.0.0.1:7001

const Max = require("max-api");
const dgram = require("dgram");

const client = dgram.createSocket("udp4");

let HOST = "127.0.0.1";
let PORT = 7001;

const SOCKET_MAP = {
  main_text: "Main Text",
  sub_text: "Sub Text",
  main_size: "Main Size",
  sub_size: "Sub Size",
  character_spacing: "Character Spacing",
  word_spacing: "Word Spacing",
  thickness: "Thickness",
  line_scale: "Line Scale",
  extrude_amount: "Extrude Amount",
  noise: "Noise",
  smooth: "Smooth",
  subdivision: "Subdivision",
  variance: "Variance",
  asymmetry: "Asymmetry",
  abstraction: "Abstraction",
  z_deform: "Z Deform",
  z_deform_scale: "Z Deform Scale",
  abstraction_smoothness: "Abstraction Smoothness",
  main_x: "Main X",
  main_z: "Main Z",
  sub_x: "Sub X",
  sub_z: "Sub Z",
  hue_shift: "Hue Shift",
  marrow_glow: "Marrow Glow",
  skin_glow: "Skin Glow",
  skin_alpha: "Skin Alpha",
  skin_roughness: "Skin Roughness",
  flesh_sss: "Flesh SSS",
  electric_strength: "Electric Strength",
};

function sendPayload(payload) {
  const data = Buffer.from(JSON.stringify(payload), "utf8");
  client.send(data, PORT, HOST);
}

function sendSocket(alias, rawValue) {
  const socketName = SOCKET_MAP[alias];
  if (!socketName) {
    Max.post(`Unknown Spectralfrost alias: ${alias}`);
    return;
  }

  let value = rawValue;
  if (typeof rawValue === "string" && rawValue !== "" && !Number.isNaN(Number(rawValue))) {
    value = Number(rawValue);
  }

  sendPayload({ [socketName]: value });
}

function joinedArgs(args) {
  return args.map(String).join(" ");
}

Max.addHandler("host", (host) => {
  HOST = String(host || HOST);
  Max.post(`spectralfrost_sync host ${HOST}`);
});

Max.addHandler("port", (port) => {
  const parsed = parseInt(port, 10);
  if (!Number.isNaN(parsed) && parsed > 0 && parsed < 65536) {
    PORT = parsed;
    Max.post(`spectralfrost_sync port ${PORT}`);
  }
});

Max.addHandler("json", (...args) => {
  const raw = joinedArgs(args);
  try {
    const payload = JSON.parse(raw);
    sendPayload(payload);
  } catch (error) {
    Max.post(`Invalid JSON: ${error.message}`);
  }
});

Max.addHandler("batch", (...args) => {
  if (args.length < 2) {
    return;
  }

  const payload = {};
  for (let i = 0; i < args.length - 1; i += 2) {
    const alias = String(args[i]).toLowerCase();
    const socketName = SOCKET_MAP[alias];
    if (!socketName) {
      continue;
    }
    const rawValue = args[i + 1];
    payload[socketName] = Number.isNaN(Number(rawValue)) ? rawValue : Number(rawValue);
  }

  if (Object.keys(payload).length > 0) {
    sendPayload(payload);
  }
});

Object.keys(SOCKET_MAP).forEach((alias) => {
  Max.addHandler(alias, (...args) => {
    if (!args.length) {
      return;
    }
    const value = args.length === 1 ? args[0] : joinedArgs(args);
    sendSocket(alias, value);
  });
});

// Optional direct mappings from the existing Feedback patch vocabulary.
Max.addHandler("morph", (value) => {
  sendPayload({ "Abstraction": Number(value) || 0 });
});

Max.addHandler("kuramoto_r", (value) => {
  const amount = Number(value) || 0;
  sendPayload({
    "Z Deform": amount * 25,
    "Z Deform Scale": 4 + (amount * 14),
  });
});

Max.addHandler("amplitude", (value) => {
  const amount = Number(value) || 0;
  sendPayload({
    "Electric Strength": amount * 18,
    "Skin Glow": amount * 6,
  });
});

Max.addHandler("resonator_decay", (value) => {
  const amount = Number(value) || 0;
  sendPayload({
    "Abstraction Smoothness": Math.max(0.05, amount * 10),
  });
});

Max.post(`spectralfrost_sync.js ready -> ${HOST}:${PORT}`);
