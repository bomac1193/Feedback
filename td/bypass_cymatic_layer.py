"""
Bypass cymatic_layer: restore the original direct chaos_viz -> tonemap chain
so audio reactivity runs realtime again.

The cymatic_layer GLSL TOP was bottlenecking the cook chain (heavy FBM noise,
multi-harmonic Chladni, per-pixel hashes). Disconnecting it returns the visual
to its pre-cymatic state.

cymatic_layer stays in the network but disconnected so it can be re-enabled
later when we have a lighter shader.

Run in TD textport:
    exec(open(r'\\\\wsl.localhost\\Ubuntu\\home\\sphinxy\\Feedback\\td\\bypass_cymatic_layer.py').read())
"""

CHAOS_VIZ_PATH = '/project1/feedback_viz/chaos_viz'
LAYER_PATH = '/project1/feedback_viz/cymatic_layer'
TONEMAP_PATH = '/project1/feedback_viz/tonemap'


def main():
    print("=" * 60)
    print("Bypass Cymatic Layer (restore realtime chain)")
    print("=" * 60)

    chaos = op(CHAOS_VIZ_PATH)
    layer = op(LAYER_PATH)
    tonemap = op(TONEMAP_PATH)

    if chaos is None:
        print(f"[ERROR] {CHAOS_VIZ_PATH} not found")
        return
    if tonemap is None:
        print(f"[ERROR] {TONEMAP_PATH} not found")
        return

    # Disconnect tonemap input 0 (whatever's feeding it currently)
    try:
        tonemap.inputConnectors[0].disconnect()
        print(f"[OK] Disconnected {tonemap.path} input 0")
    except Exception as e:
        print(f"[WARN] Disconnect tonemap input failed: {e}")

    # If cymatic_layer exists, disconnect its inputs/outputs
    if layer is not None:
        try:
            layer.inputConnectors[0].disconnect()
            print(f"[OK] Disconnected {layer.path} input 0")
        except Exception as e:
            print(f"[WARN] Disconnect cymatic_layer input failed: {e}")
        try:
            for in_conn in list(layer.outputConnectors[0].connections):
                in_conn.disconnect()
            print(f"[OK] Disconnected {layer.path} outputs")
        except Exception as e:
            print(f"[WARN] Disconnect cymatic_layer outputs failed: {e}")

    # Reconnect chaos_viz directly to tonemap
    try:
        chaos.outputConnectors[0].connect(tonemap.inputConnectors[0])
        print(f"[OK] Connected {chaos.path} -> {tonemap.path}")
    except Exception as e:
        print(f"[ERROR] Connect chaos->tonemap failed: {e}")

    print()
    print("=" * 60)
    print("Done. Chain is now: chaos_viz -> tonemap (no cymatic in path).")
    print("Audio reactivity should be realtime again.")
    print()
    print("cymatic_layer is still in the network but disconnected.")
    print("It will be reconnected later with a lighter shader.")
    print("=" * 60)


main()
