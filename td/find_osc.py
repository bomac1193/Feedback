"""Find all OSC In CHOPs and print their paths, ports, channel snapshots."""

found = root.findChildren(type=oscinCHOP)
print(f"Found {len(found)} OSC In CHOPs:")
for o in found:
    try:
        port = o.par.port.eval()
    except Exception:
        port = '?'
    try:
        active = o.par.active.eval()
    except Exception:
        active = '?'
    print(f"  {o.path}  port={port}  active={active}  chans={o.numChans}")
    for c in o.chans():
        try:
            print(f"     {c.name} = {c.eval():.4f}")
        except Exception:
            print(f"     {c.name} = ?")
