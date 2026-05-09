{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            50,
            50,
            780,
            460
        ],
        "openinpresentation": 1,
        "default_fontsize": 11.0,
        "default_fontname": "Inter",
        "default_fontface": 0,
        "gridonopen": 1,
        "gridsize": [
            15,
            15
        ],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 0,
        "toolbarvisible": 0,
        "bgcolor": [
            0.06,
            0.06,
            0.07,
            1.0
        ],
        "editing_bgcolor": [
            0.06,
            0.06,
            0.07,
            1.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-61a9350f",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        750.0,
                        24.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        10.0,
                        750.0,
                        24.0
                    ],
                    "varname": "title_main",
                    "text": "Reliqua",
                    "fontface": 1,
                    "fontsize": 18.0,
                    "textcolor": [
                        0.93,
                        0.93,
                        0.92,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e9d1869d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        750.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        36.0,
                        750.0,
                        16.0
                    ],
                    "varname": "subtitle_main",
                    "text": "chaos resonator surface, demo build",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-98bbb8ce",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        220.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        60.0,
                        220.0,
                        90.0
                    ],
                    "varname": "panel_transport",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-11cfcc01",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        200.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        25.0,
                        64.0,
                        200.0,
                        16.0
                    ],
                    "varname": "label_transport",
                    "text": "TRANSPORT",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-38b12850",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        90.0,
                        30.0,
                        30.0
                    ],
                    "varname": "play",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-5d7bc2cb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        25.0,
                        124.0,
                        40.0,
                        14.0
                    ],
                    "varname": "play_l",
                    "text": "run",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-8b782d15",
                    "maxclass": "live.numbox",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        70.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        75.0,
                        95.0,
                        70.0,
                        22.0
                    ],
                    "varname": "bpm",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                120
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "bpm",
                            "parameter_shortname": "BPM",
                            "parameter_range": [
                                30,
                                240
                            ],
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-32194d7c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        70.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        75.0,
                        120.0,
                        70.0,
                        14.0
                    ],
                    "varname": "bpm_l",
                    "text": "bpm",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-98ee0aa4",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        180.0,
                        90.0,
                        30.0,
                        30.0
                    ],
                    "varname": "tap",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-828778fc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        175.0,
                        124.0,
                        40.0,
                        14.0
                    ],
                    "varname": "tap_l",
                    "text": "tap",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-8b73f98f",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        260.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        250.0,
                        60.0,
                        260.0,
                        90.0
                    ],
                    "varname": "panel_engine",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-710389c5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        240.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        260.0,
                        64.0,
                        240.0,
                        16.0
                    ],
                    "varname": "label_engine",
                    "text": "ENGINE",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-b4717798",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        265.0,
                        86.0,
                        50.0,
                        50.0
                    ],
                    "varname": "chaos",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.3
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chaos",
                            "parameter_shortname": "Chaos",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-73766e84",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        325.0,
                        86.0,
                        50.0,
                        50.0
                    ],
                    "varname": "rho",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                28
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rho",
                            "parameter_shortname": "Rho",
                            "parameter_range": [
                                0.5,
                                200
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-e2557ef3",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        385.0,
                        86.0,
                        50.0,
                        50.0
                    ],
                    "varname": "dt",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0012
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dt",
                            "parameter_shortname": "Time",
                            "parameter_range": [
                                0.0001,
                                0.02
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-04d664cf",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        445.0,
                        86.0,
                        50.0,
                        50.0
                    ],
                    "varname": "drive",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "drive",
                            "parameter_shortname": "Drive",
                            "parameter_range": [
                                0,
                                2
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-30faaf22",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        240.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        525.0,
                        60.0,
                        240.0,
                        90.0
                    ],
                    "varname": "panel_pattern",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-5ea52b6e",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        220.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        535.0,
                        64.0,
                        220.0,
                        16.0
                    ],
                    "varname": "label_pattern",
                    "text": "PATTERN",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-9fb1a5c7",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        100.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        540.0,
                        86.0,
                        100.0,
                        22.0
                    ],
                    "varname": "arp_mode",
                    "parameter_enable": 1,
                    "items": [
                        "Up",
                        "Down",
                        "Random",
                        "Chord",
                        "Triplet"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7690c646",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        100.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        650.0,
                        86.0,
                        100.0,
                        22.0
                    ],
                    "varname": "pattern",
                    "parameter_enable": 1,
                    "items": [
                        "Bembe 12 8",
                        "Shiko",
                        "Son Clave",
                        "Fume Fume",
                        "Kassa"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-b59150e6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        100.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        540.0,
                        110.0,
                        100.0,
                        14.0
                    ],
                    "varname": "arp_l",
                    "text": "traversal",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-340cda26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        100.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        650.0,
                        110.0,
                        100.0,
                        14.0
                    ],
                    "varname": "pat_l",
                    "text": "bundled rhythm",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-4935515c",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        495.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        175.0,
                        495.0,
                        90.0
                    ],
                    "varname": "panel_effects",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-d1e42ff7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        475.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        25.0,
                        179.0,
                        475.0,
                        16.0
                    ],
                    "varname": "label_effects",
                    "text": "EFFECTS",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-d84edfdd",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "rev_wet",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.3
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rev_wet",
                            "parameter_shortname": "Reverb",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-5416a85f",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        95.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "dly_wet",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.25
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dly_wet",
                            "parameter_shortname": "Delay",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-7e05e43d",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        160.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "filter",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                6000
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "filter",
                            "parameter_shortname": "Tone",
                            "parameter_range": [
                                50,
                                18000
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-b659fa24",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        225.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "drive_fx",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "drive_fx",
                            "parameter_shortname": "Drive",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-36ff871e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        290.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "width",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "width",
                            "parameter_shortname": "Width",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-b63c1b5d",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        355.0,
                        201.0,
                        50.0,
                        50.0
                    ],
                    "varname": "master",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.7
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "master",
                            "parameter_shortname": "Master",
                            "parameter_range": [
                                0,
                                1
                            ],
                            "parameter_type": 0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-cd3b6075",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        240.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        525.0,
                        175.0,
                        240.0,
                        90.0
                    ],
                    "varname": "panel_capture",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-acaecdb0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        220.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        535.0,
                        179.0,
                        220.0,
                        16.0
                    ],
                    "varname": "label_capture",
                    "text": "CAPTURE",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5602e6a6",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        540.0,
                        205.0,
                        30.0,
                        30.0
                    ],
                    "varname": "rec_open",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-f8ae4c58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        530.0,
                        237.0,
                        50.0,
                        14.0
                    ],
                    "varname": "rec_open_l",
                    "text": "open",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-358eed58",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        590.0,
                        205.0,
                        30.0,
                        30.0
                    ],
                    "varname": "rec_arm",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "rec_arm",
                            "parameter_shortname": "rec_arm",
                            "parameter_type": 2
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-fdc797f9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        585.0,
                        237.0,
                        40.0,
                        14.0
                    ],
                    "varname": "rec_arm_l",
                    "text": "arm",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-b140147c",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        12.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        635.0,
                        201.0,
                        12.0,
                        50.0
                    ],
                    "varname": "rec_meter_l",
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-6863ef97",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20.0,
                        20.0,
                        12.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        655.0,
                        201.0,
                        12.0,
                        50.0
                    ],
                    "varname": "rec_meter_r",
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-2194cbe1",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        750.0,
                        60.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        290.0,
                        750.0,
                        60.0
                    ],
                    "varname": "panel_status",
                    "background": 1,
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-3a7c0a6d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        730.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        25.0,
                        294.0,
                        730.0,
                        16.0
                    ],
                    "varname": "label_status",
                    "text": "STATUS",
                    "fontface": 1,
                    "fontsize": 10.0,
                    "textcolor": [
                        0.85,
                        0.78,
                        0.55,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-174ac6d5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        200.0,
                        18.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        312.0,
                        200.0,
                        18.0
                    ],
                    "varname": "status_l",
                    "text": "ready",
                    "fontface": 1,
                    "fontsize": 11.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-ffdb1a88",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        20.0,
                        140.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        615.0,
                        314.0,
                        140.0,
                        14.0
                    ],
                    "varname": "ver_l",
                    "text": "surface generated by maxui",
                    "fontsize": 10.0,
                    "textcolor": [
                        0.55,
                        0.55,
                        0.52,
                        1.0
                    ]
                }
            }
        ],
        "lines": []
    }
}