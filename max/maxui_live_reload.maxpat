{
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [50, 50, 760, 540],
        "openinpresentation": 1,
        "default_fontsize": 11.0,
        "default_fontname": "Inter",
        "default_fontface": 0,
        "gridonopen": 1,
        "gridsize": [15.0, 15.0],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 0,
        "toolbarvisible": 0,
        "bgcolor": [0.06, 0.06, 0.07, 1.0],
        "editing_bgcolor": [0.06, 0.06, 0.07, 1.0],
        "boxes": [
            {"box": {"id": "lr-title", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [15, 15, 400, 24], "presentation": 1, "presentation_rect": [15, 15, 400, 24], "text": "MaxUI live reload", "fontface": 1, "fontsize": 18.0, "textcolor": [0.93, 0.93, 0.92, 1.0], "varname": "lr-title"}},
            {"box": {"id": "lr-sub", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [15, 41, 600, 16], "presentation": 1, "presentation_rect": [15, 41, 600, 16], "text": "drop a maxpat onto the box below, then rebuild your YAML and click reload.", "fontsize": 10.0, "textcolor": [0.55, 0.55, 0.52, 1.0], "varname": "lr-sub"}},
            {"box": {"id": "lr-drop", "maxclass": "dropfile", "numinlets": 1, "numoutlets": 2, "outlettype": ["", ""], "patching_rect": [15, 75, 600, 50], "presentation": 1, "presentation_rect": [15, 75, 600, 50], "varname": "lr-drop"}},
            {"box": {"id": "lr-store", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [15, 140, 90, 22], "text": "tosymbol", "varname": "lr-store"}},
            {"box": {"id": "lr-pak", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [15, 168, 200, 22], "text": "pak replace symbol", "varname": "lr-pak"}},
            {"box": {"id": "lr-bp", "maxclass": "bpatcher", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [15, 200, 720, 320], "presentation": 1, "presentation_rect": [15, 145, 720, 360], "varname": "lr-bp", "border": 1, "rounded": 0}},
            {"box": {"id": "lr-reload-btn", "maxclass": "button", "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"], "parameter_enable": 0, "patching_rect": [630, 75, 30, 30], "presentation": 1, "presentation_rect": [630, 86, 30, 30], "varname": "lr-reload-btn"}},
            {"box": {"id": "lr-reload-l", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [625, 110, 50, 14], "presentation": 1, "presentation_rect": [625, 121, 50, 14], "text": "reload", "fontsize": 10.0, "textcolor": [0.55, 0.55, 0.52, 1.0], "varname": "lr-reload-l"}}
        ],
        "lines": [
            {"patchline": {"source": ["lr-drop", 0], "destination": ["lr-store", 0]}},
            {"patchline": {"source": ["lr-store", 0], "destination": ["lr-pak", 1]}},
            {"patchline": {"source": ["lr-reload-btn", 0], "destination": ["lr-pak", 0]}},
            {"patchline": {"source": ["lr-pak", 0], "destination": ["lr-bp", 0]}}
        ]
    }
}
