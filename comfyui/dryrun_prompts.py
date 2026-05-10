"""Dry-run the prompt engine: no API calls, no spending. Mocks BridgeState
under five different audio/coherence conditions and prints which pool fired,
which medium was selected, and the final prompt the bridge would send to
Replicate. Use this to gut-check the alabo + geomancy wiring before letting
the live bridge spend money."""

import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import comfyui_bridge as br

scenarios = [
    {
        "name": "Quiet drift (low audio, low sync, mid x)",
        "chaos_x": 1.5, "chaos_y": 0.0, "chaos_z": 0.0,
        "loudness": 0.05, "kuramoto_r": 0.3,
        "expect": "TRANSITION pool (saddle, default fall-through)",
    },
    {
        "name": "Warm peak (x in warm lobe, mid loudness, low sync)",
        "chaos_x": 8.0, "chaos_y": 0.0, "chaos_z": 0.0,
        "loudness": 0.4, "kuramoto_r": 0.5,
        "expect": "WARM pool (x > 5, sync below 0.7, loudness below 0.6)",
    },
    {
        "name": "Cool peak (x in cool lobe, mid loudness, low sync)",
        "chaos_x": -8.0, "chaos_y": 0.0, "chaos_z": 0.0,
        "loudness": 0.4, "kuramoto_r": 0.5,
        "expect": "COOL pool (x < -5, sync below 0.7, loudness below 0.6)",
    },
    {
        "name": "Hard audio peak (any x, loudness above 0.6)",
        "chaos_x": 8.0, "chaos_y": 0.0, "chaos_z": 0.0,
        "loudness": 0.85, "kuramoto_r": 0.5,
        "expect": "GEOMANTIC pool (loudness > 0.6 wins)",
    },
    {
        "name": "Locked coherence (kuramoto r above 0.7, quiet)",
        "chaos_x": 1.0, "chaos_y": 0.0, "chaos_z": 0.0,
        "loudness": 0.1, "kuramoto_r": 0.78,
        "expect": "GEOMANTIC pool (sync > 0.7 wins)",
    },
]

print("=" * 70)
print(f"USE_ALABO_LORA = {br.USE_ALABO_LORA}")
print(f"BACKEND = {br.BACKEND}")
print(f"MIN_INTERVAL = {br.MIN_INTERVAL}s   ALABO_LORA_STRENGTH = {br.ALABO_LORA_STRENGTH}")
print(f"Geomantic pool: {len(br.MEDIA_GEOMANTIC)} entries")
print(f"Warm pool: {len(br.MEDIA_WARM)}, Cool: {len(br.MEDIA_COOL)}, Transition: {len(br.MEDIA_TRANSITION)}")
print("=" * 70)

for i, sc in enumerate(scenarios):
    br.state.chaos_x = sc["chaos_x"]
    br.state.chaos_y = sc["chaos_y"]
    br.state.chaos_z = sc["chaos_z"]
    br.state.loudness = sc["loudness"]
    br.state.kuramoto_r = sc["kuramoto_r"]
    br.state.frame_count = i * 8  # rotate through the pools

    prompt = br.build_flux_prompt()

    # Reverse-engineer which pool was chosen by string match
    if any(g in prompt for g in br.MEDIA_GEOMANTIC):
        pool = "GEOMANTIC"
    elif any(g in prompt for g in br.MEDIA_WARM):
        pool = "WARM"
    elif any(g in prompt for g in br.MEDIA_COOL):
        pool = "COOL"
    elif any(g in prompt for g in br.MEDIA_TRANSITION):
        pool = "TRANSITION"
    else:
        pool = "UNKNOWN"

    print(f"\n[{i+1}] {sc['name']}")
    print(f"    expect: {sc['expect']}")
    print(f"    fired : {pool}")
    print(f"    prompt: {prompt[:160]}{'...' if len(prompt) > 160 else ''}")

print("\n" + "=" * 70)
print("Dry-run complete. No API calls made, no cost incurred.")
