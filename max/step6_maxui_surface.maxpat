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
            60,
            60,
            1160,
            1390
        ],
        "openinpresentation": 1,
        "default_fontsize": 11.0,
        "default_fontname": "S\u00f6hne",
        "default_fontface": 0,
        "gridonopen": 1,
        "gridsize": [
            15,
            15
        ],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "bgcolor": [
            0.04,
            0.04,
            0.045,
            1.0
        ],
        "editing_bgcolor": [
            0.04,
            0.04,
            0.045,
            1.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-fbbb8f91",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        10.0,
                        1070.0,
                        32.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        10.0,
                        1070.0,
                        32.0
                    ],
                    "varname": "title_main",
                    "text": "Feedback",
                    "fontname": "Canela",
                    "fontface": 0,
                    "fontsize": 28.0,
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e2dee5c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        44.0,
                        1070.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        44.0,
                        1070.0,
                        14.0
                    ],
                    "varname": "subtitle_main",
                    "text": "chaos resonator, 5 attractors, 6 voices, african tunings",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.5,
                        0.48,
                        0.45,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-119546f0",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        60.0,
                        1070.0,
                        1.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        60.0,
                        1070.0,
                        1.0
                    ],
                    "varname": "title_underline",
                    "background": 1,
                    "bgcolor": [
                        0.16,
                        0.15,
                        0.14,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-0f38c245",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        90.0,
                        275.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        90.0,
                        275.0,
                        110.0
                    ],
                    "varname": "panel_transport",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-37f722e2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        96.0,
                        251.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        96.0,
                        251.0,
                        14.0
                    ],
                    "varname": "label_transport",
                    "text": "Transport",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-37005523",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "varname": "play",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-8437931b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        25.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        25.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "varname": "play_l",
                    "text": "run",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-88f1a804",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        75.0,
                        125.0,
                        70.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        75.0,
                        125.0,
                        70.0,
                        22.0
                    ],
                    "varname": "bpm",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 120.0
                }
            },
            {
                "box": {
                    "id": "obj-a13fa4ad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        75.0,
                        150.0,
                        70.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        75.0,
                        150.0,
                        70.0,
                        14.0
                    ],
                    "varname": "bpm_l",
                    "text": "bpm",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-d2eb8ce2",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        160.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        160.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "varname": "tap",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-331251d6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        155.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        155.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "varname": "tap_l",
                    "text": "tap",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-65c0cde5",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "varname": "mute",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mute",
                            "parameter_shortname": "mute",
                            "parameter_type": 2
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-4db42962",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        205.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        205.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "varname": "mute_l",
                    "text": "stop",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-84f2c869",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        255.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        255.0,
                        120.0,
                        30.0,
                        30.0
                    ],
                    "varname": "reset",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-241a1155",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        247.0,
                        154.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        247.0,
                        154.0,
                        50.0,
                        14.0
                    ],
                    "varname": "reset_l",
                    "text": "reset",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-876bebd3",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        305.0,
                        90.0,
                        320.0,
                        130.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        305.0,
                        90.0,
                        320.0,
                        130.0
                    ],
                    "varname": "panel_engine",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-165467ad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        317.0,
                        96.0,
                        296.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        317.0,
                        96.0,
                        296.0,
                        14.0
                    ],
                    "varname": "label_engine",
                    "text": "Engine",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-818f9fcd",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        320.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        116.0,
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
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-1e1528ae",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        380.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        380.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "varname": "rho",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                28.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rho",
                            "parameter_shortname": "Rho",
                            "parameter_range": [
                                0.5,
                                200.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 0.5
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-b93c295c",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        440.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        440.0,
                        116.0,
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
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 0.02,
                            "parameter_mmin": 0.0001
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-02f2f698",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        500.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        500.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "varname": "flex",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flex",
                            "parameter_shortname": "Flex",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-de55f4ed",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        560.0,
                        116.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        560.0,
                        116.0,
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
                                0.0,
                                1.5
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.5,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-cb541aa9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        323.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        323.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "varname": "chaos_l",
                    "text": "chaos",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-390ee082",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        383.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        383.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "varname": "rho_l",
                    "text": "rho",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-80bab53c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        443.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        443.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "varname": "dt_l",
                    "text": "time",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5f126bc7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        503.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        503.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "varname": "flex_l",
                    "text": "flex",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2b92213a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        563.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        563.0,
                        170.0,
                        50.0,
                        14.0
                    ],
                    "varname": "master_l",
                    "text": "master",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-99019bf7",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        320.0,
                        190.0,
                        290.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        190.0,
                        290.0,
                        22.0
                    ],
                    "varname": "rho_preset",
                    "items": [
                        "Converging 20",
                        ",",
                        "Edge 24.74",
                        ",",
                        "Classic 28",
                        ",",
                        "Periodic 100",
                        ",",
                        "Stable 166",
                        ",",
                        "Bursts 50"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e8398b1f",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        640.0,
                        90.0,
                        445.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        640.0,
                        90.0,
                        445.0,
                        110.0
                    ],
                    "varname": "panel_attractor",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-e1d01ee7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        652.0,
                        96.0,
                        421.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        652.0,
                        96.0,
                        421.0,
                        14.0
                    ],
                    "varname": "label_attractor",
                    "text": "Attractor",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-165987b0",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        655.0,
                        116.0,
                        110.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        655.0,
                        116.0,
                        110.0,
                        22.0
                    ],
                    "varname": "att_a",
                    "items": [
                        "Lorenz",
                        ",",
                        "Rossler",
                        ",",
                        "Chua",
                        ",",
                        "Halvorsen",
                        ",",
                        "Aizawa"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1648fbe9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        655.0,
                        140.0,
                        110.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        655.0,
                        140.0,
                        110.0,
                        14.0
                    ],
                    "varname": "att_a_l",
                    "text": "primary",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1da6dc7c",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        775.0,
                        116.0,
                        110.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        775.0,
                        116.0,
                        110.0,
                        22.0
                    ],
                    "varname": "att_b",
                    "items": [
                        "False",
                        ",",
                        "Lorenz",
                        ",",
                        "Rossler",
                        ",",
                        "Chua",
                        ",",
                        "Halvorsen",
                        ",",
                        "Aizawa"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2f0e1063",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        775.0,
                        140.0,
                        110.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        775.0,
                        140.0,
                        110.0,
                        14.0
                    ],
                    "varname": "att_b_l",
                    "text": "secondary",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5cb76cb0",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        895.0,
                        116.0,
                        90.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        895.0,
                        116.0,
                        90.0,
                        22.0
                    ],
                    "varname": "combine",
                    "items": [
                        "Blend",
                        ",",
                        "Modulate",
                        ",",
                        "Route"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5f935ff9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        895.0,
                        140.0,
                        90.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        895.0,
                        140.0,
                        90.0,
                        14.0
                    ],
                    "varname": "combine_l",
                    "text": "combine mode",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c8fc60e6",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        1000.0,
                        114.0,
                        36.0,
                        36.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1000.0,
                        114.0,
                        36.0,
                        36.0
                    ],
                    "varname": "blend_mix",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "blend_mix",
                            "parameter_shortname": "Mix",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-0fb7fe83",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        998.0,
                        154.0,
                        36.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        998.0,
                        154.0,
                        36.0,
                        14.0
                    ],
                    "varname": "blend_l",
                    "text": "a",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-f307665d",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        1040.0,
                        114.0,
                        36.0,
                        36.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1040.0,
                        114.0,
                        36.0,
                        36.0
                    ],
                    "varname": "mod_depth",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.3
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "mod_depth",
                            "parameter_shortname": "Mod",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-c25707b4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1038.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1038.0,
                        154.0,
                        40.0,
                        14.0
                    ],
                    "varname": "mod_l",
                    "text": "depth",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5fe86676",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        230.0,
                        240.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        230.0,
                        240.0,
                        110.0
                    ],
                    "varname": "panel_lorenz params",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-4568e3c7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        236.0,
                        216.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        236.0,
                        216.0,
                        14.0
                    ],
                    "varname": "label_lorenz_params",
                    "text": "Lorenz params",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-63d33ff0",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "sigma",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                10.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sigma",
                            "parameter_shortname": "Sigma",
                            "parameter_range": [
                                0.1,
                                50.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 50.0,
                            "parameter_mmin": 0.1
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-2e6bfa4a",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        90.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        90.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "rho_l_p",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                28.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rho_l_p",
                            "parameter_shortname": "Rho",
                            "parameter_range": [
                                0.5,
                                200.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 0.5
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-f4791ac1",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        150.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        150.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "beta",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                2.667
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "beta",
                            "parameter_shortname": "Beta",
                            "parameter_range": [
                                0.1,
                                20.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 20.0,
                            "parameter_mmin": 0.1
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-6a1b1399",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "lor_dt",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0012
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "lor_dt",
                            "parameter_shortname": "Dt",
                            "parameter_range": [
                                0.0001,
                                0.02
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 0.02,
                            "parameter_mmin": 0.0001
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-78601e9f",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        270.0,
                        230.0,
                        180.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        270.0,
                        230.0,
                        180.0,
                        110.0
                    ],
                    "varname": "panel_rossler params",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-5c754846",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        282.0,
                        236.0,
                        156.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        282.0,
                        236.0,
                        156.0,
                        14.0
                    ],
                    "varname": "label_rossler_params",
                    "text": "Rossler params",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6da4abde",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        285.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        285.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "ross_a",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.2
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_a",
                            "parameter_shortname": "A",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-2f67fb19",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        345.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        345.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "ross_b",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.2
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_b",
                            "parameter_shortname": "B",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-ad4a2878",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        405.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        405.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "ross_c",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                5.7
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_c",
                            "parameter_shortname": "C",
                            "parameter_range": [
                                0.5,
                                20.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 20.0,
                            "parameter_mmin": 0.5
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-108e7dd8",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        465.0,
                        230.0,
                        180.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        465.0,
                        230.0,
                        180.0,
                        110.0
                    ],
                    "varname": "panel_chua params",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-1d7bda61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        477.0,
                        236.0,
                        156.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        477.0,
                        236.0,
                        156.0,
                        14.0
                    ],
                    "varname": "label_chua_params",
                    "text": "Chua params",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-d3713f95",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        480.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        480.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "chua_alpha",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                15.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_alpha",
                            "parameter_shortname": "Alpha",
                            "parameter_range": [
                                1.0,
                                30.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 30.0,
                            "parameter_mmin": 1.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-abd23ca8",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        540.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        540.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "chua_beta",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                28.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_beta",
                            "parameter_shortname": "Beta",
                            "parameter_range": [
                                1.0,
                                50.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 50.0,
                            "parameter_mmin": 1.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-e86f25d3",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        600.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        600.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "chua_m0",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                -1.143
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_m0",
                            "parameter_shortname": "m0",
                            "parameter_range": [
                                -3.0,
                                3.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 3.0,
                            "parameter_mmin": -3.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-0b803cdb",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        660.0,
                        230.0,
                        120.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        660.0,
                        230.0,
                        120.0,
                        110.0
                    ],
                    "varname": "panel_halvorsen",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-ad6b83f1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        672.0,
                        236.0,
                        96.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        672.0,
                        236.0,
                        96.0,
                        14.0
                    ],
                    "varname": "label_halvorsen",
                    "text": "Halvorsen",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-317706ff",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        675.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        675.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "halv_a",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                1.89
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "halv_a",
                            "parameter_shortname": "A",
                            "parameter_range": [
                                0.5,
                                3.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 3.0,
                            "parameter_mmin": 0.5
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-72e6df6d",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        795.0,
                        230.0,
                        290.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        795.0,
                        230.0,
                        290.0,
                        110.0
                    ],
                    "varname": "panel_aizawa",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-230d61c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        807.0,
                        236.0,
                        266.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        807.0,
                        236.0,
                        266.0,
                        14.0
                    ],
                    "varname": "label_aizawa",
                    "text": "Aizawa",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c9592fba",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        810.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        810.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "aiz_a",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.95
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_a",
                            "parameter_shortname": "A",
                            "parameter_range": [
                                0.0,
                                2.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 2.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-b8ef27b4",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        870.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        870.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "aiz_b",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.7
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_b",
                            "parameter_shortname": "B",
                            "parameter_range": [
                                0.0,
                                2.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 2.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-baaad3cb",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        930.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        930.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "aiz_c",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_c",
                            "parameter_shortname": "C",
                            "parameter_range": [
                                0.0,
                                2.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 2.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-99284893",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        990.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        990.0,
                        256.0,
                        50.0,
                        50.0
                    ],
                    "varname": "aiz_d",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                3.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_d",
                            "parameter_shortname": "D",
                            "parameter_range": [
                                0.0,
                                6.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 6.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-6a85155a",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        370.0,
                        490.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        370.0,
                        490.0,
                        110.0
                    ],
                    "varname": "panel_pattern",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-c5fd05c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        376.0,
                        466.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        376.0,
                        466.0,
                        14.0
                    ],
                    "varname": "label_pattern",
                    "text": "Pattern",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c6e3a9a9",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        396.0,
                        200.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        396.0,
                        200.0,
                        22.0
                    ],
                    "varname": "arp_mode",
                    "items": [
                        "All on",
                        ",",
                        "Up",
                        ",",
                        "Down",
                        ",",
                        "Up down",
                        ",",
                        "Random",
                        ",",
                        "Chord",
                        ",",
                        "Triplet",
                        ",",
                        "Euclidean",
                        ",",
                        "Sequencer"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-70e2183c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        235.0,
                        398.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        235.0,
                        398.0,
                        80.0,
                        14.0
                    ],
                    "varname": "arp_l",
                    "text": "traversal",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-bcc83dab",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        426.0,
                        200.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        426.0,
                        200.0,
                        22.0
                    ],
                    "varname": "pattern",
                    "items": [
                        "Bembe 12 8",
                        ",",
                        "Shiko",
                        ",",
                        "Poly 3 2",
                        ",",
                        "Call response",
                        ",",
                        "Gahu",
                        ",",
                        "Son clave",
                        ",",
                        "Fume fume",
                        ",",
                        "Kassa",
                        ",",
                        "Kuduro",
                        ",",
                        "Semba",
                        ",",
                        "Kizomba",
                        ",",
                        "Marrabenta"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-0a3c9b18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        235.0,
                        428.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        235.0,
                        428.0,
                        80.0,
                        14.0
                    ],
                    "varname": "pattern_l",
                    "text": "rhythm",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-b54ad4e2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        320.0,
                        396.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        396.0,
                        50.0,
                        22.0
                    ],
                    "varname": "arp_div",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 2.0
                }
            },
            {
                "box": {
                    "id": "obj-dabe997c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        375.0,
                        398.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        375.0,
                        398.0,
                        60.0,
                        14.0
                    ],
                    "varname": "div_l",
                    "text": "division",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-3dec7760",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        320.0,
                        426.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        426.0,
                        50.0,
                        22.0
                    ],
                    "varname": "transpose",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-338b3ae8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        375.0,
                        428.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        375.0,
                        428.0,
                        80.0,
                        14.0
                    ],
                    "varname": "trans_l",
                    "text": "transpose",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6b5fd215",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        320.0,
                        456.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        456.0,
                        50.0,
                        22.0
                    ],
                    "varname": "inversion",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-38830625",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        375.0,
                        458.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        375.0,
                        458.0,
                        80.0,
                        14.0
                    ],
                    "varname": "inv_l",
                    "text": "inversion",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-38cae183",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        456.0,
                        200.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        456.0,
                        200.0,
                        22.0
                    ],
                    "varname": "tuning",
                    "items": [
                        "12 ET",
                        ",",
                        "Just intonation",
                        ",",
                        "Pythagorean",
                        ",",
                        "Yoruba pent",
                        ",",
                        "Akan",
                        ",",
                        "Wolof",
                        ",",
                        "Igbo",
                        ",",
                        "Bambara",
                        ",",
                        "Mande",
                        ",",
                        "Ewe",
                        ",",
                        "Hausa",
                        ",",
                        "Zulu",
                        ",",
                        "Kongo",
                        ",",
                        "Shona",
                        ",",
                        "Bantu",
                        ",",
                        "Duala",
                        ",",
                        "Maasai",
                        ",",
                        "Berber",
                        ",",
                        "Mali"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7520bd2b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        235.0,
                        458.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        235.0,
                        458.0,
                        80.0,
                        14.0
                    ],
                    "varname": "tuning_l",
                    "text": "tuning",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-54c59abb",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        505.0,
                        370.0,
                        260.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        505.0,
                        370.0,
                        260.0,
                        110.0
                    ],
                    "varname": "panel_sub bass",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-44765316",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        517.0,
                        376.0,
                        236.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        517.0,
                        376.0,
                        236.0,
                        14.0
                    ],
                    "varname": "label_sub_bass",
                    "text": "Sub bass",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-76c55bab",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        520.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        520.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "sub_amt",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_amt",
                            "parameter_shortname": "Level",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-01493d4e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        580.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        580.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "sub_drive",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_drive",
                            "parameter_shortname": "Drive",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-f4a12b2d",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        640.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        640.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "sub_chaos",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_chaos",
                            "parameter_shortname": "Chaos",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-4a844fe8",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        700.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        700.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "sub_oct",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                -1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_oct",
                            "parameter_shortname": "Octave",
                            "parameter_range": [
                                -3.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": -3.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-dc9b8ca9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        523.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        523.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "subamt_l",
                    "text": "level",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-cbc74fc6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        583.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        583.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "subdrv_l",
                    "text": "drive",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e4005922",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        643.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        643.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "subch_l",
                    "text": "chaos",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-d191f40f",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        703.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        703.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "suboct_l",
                    "text": "octave",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-961acdeb",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        775.0,
                        370.0,
                        310.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        775.0,
                        370.0,
                        310.0,
                        110.0
                    ],
                    "varname": "panel_effects",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-1f5c2c6f",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        787.0,
                        376.0,
                        286.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        787.0,
                        376.0,
                        286.0,
                        14.0
                    ],
                    "varname": "label_effects",
                    "text": "Effects",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dab3b53b",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        790.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        790.0,
                        396.0,
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
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-40913b87",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        850.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        850.0,
                        396.0,
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
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-04b2c823",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        910.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        910.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "dly_time",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                250.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dly_time",
                            "parameter_shortname": "Time",
                            "parameter_range": [
                                1.0,
                                2000.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 2000.0,
                            "parameter_mmin": 1.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-522d42d4",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        970.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        970.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "filter",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                6000.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "filter",
                            "parameter_shortname": "Tone",
                            "parameter_range": [
                                50.0,
                                18000.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 18000.0,
                            "parameter_mmin": 50.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-79fe5a18",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        1030.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1030.0,
                        396.0,
                        50.0,
                        50.0
                    ],
                    "varname": "drive",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "drive",
                            "parameter_shortname": "Drive",
                            "parameter_range": [
                                0.0,
                                6.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 6.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-833b21ee",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        793.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        793.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "rev_l",
                    "text": "reverb",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-f75d8146",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        853.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        853.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "dly_l",
                    "text": "dly wet",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c1ab891c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        913.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        913.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "dly_time_l",
                    "text": "dly ms",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-9bf581ea",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        973.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        973.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "flt_l",
                    "text": "tone",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e3ee8c52",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1033.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1033.0,
                        450.0,
                        50.0,
                        14.0
                    ],
                    "varname": "drive_l",
                    "text": "gain",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1b4a346f",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        510.0,
                        275.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        510.0,
                        275.0,
                        110.0
                    ],
                    "varname": "panel_envelope",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-0b65634d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        516.0,
                        251.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        516.0,
                        251.0,
                        14.0
                    ],
                    "varname": "label_envelope",
                    "text": "Envelope",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-30849b37",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "env_a",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.005
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_a",
                            "parameter_shortname": "Attack",
                            "parameter_range": [
                                0.0,
                                5.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 5.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-e6befa04",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        90.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        90.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "env_d",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.05
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_d",
                            "parameter_shortname": "Decay",
                            "parameter_range": [
                                0.0,
                                5.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 5.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-149ad24e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        150.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        150.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "env_s",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.8
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_s",
                            "parameter_shortname": "Sustain",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-56a0d8e6",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "env_r",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_r",
                            "parameter_shortname": "Release",
                            "parameter_range": [
                                0.0,
                                8.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 8.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-0b8daa92",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        33.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        33.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "enva_l",
                    "text": "attack",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7ec23187",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        93.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        93.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "envd_l",
                    "text": "decay",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-839cde31",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        153.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        153.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "envs_l",
                    "text": "sustain",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-05a8e816",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        213.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        213.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "envr_l",
                    "text": "release",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-43dad462",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        305.0,
                        510.0,
                        430.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        305.0,
                        510.0,
                        430.0,
                        110.0
                    ],
                    "varname": "panel_root",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-e8322109",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        317.0,
                        516.0,
                        406.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        317.0,
                        516.0,
                        406.0,
                        14.0
                    ],
                    "varname": "label_root",
                    "text": "Root",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-198b9c62",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        320.0,
                        546.0,
                        60.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        546.0,
                        60.0,
                        30.0
                    ],
                    "varname": "root",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 55.0
                }
            },
            {
                "box": {
                    "id": "obj-9f50f997",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        320.0,
                        580.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        320.0,
                        580.0,
                        60.0,
                        14.0
                    ],
                    "varname": "root_l",
                    "text": "root hz",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1b25e889",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        390.0,
                        536.0,
                        130.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390.0,
                        536.0,
                        130.0,
                        22.0
                    ],
                    "varname": "root_preset",
                    "items": [
                        "Iya ilu 61",
                        ",",
                        "Omele 82",
                        ",",
                        "Body 125",
                        ",",
                        "Vowel 172",
                        ",",
                        "Brass 220",
                        ",",
                        "High 350"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-87b89faf",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        390.0,
                        560.0,
                        130.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390.0,
                        560.0,
                        130.0,
                        14.0
                    ],
                    "varname": "rootp_l",
                    "text": "african root preset",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-a86e2b5e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        530.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        530.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "glide",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.001
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "glide",
                            "parameter_shortname": "Glide",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-32333ce7",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        590.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        590.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "brightness",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "brightness",
                            "parameter_shortname": "Bright",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-0e11eae5",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        650.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        650.0,
                        536.0,
                        50.0,
                        50.0
                    ],
                    "varname": "rootspring",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rootspring",
                            "parameter_shortname": "Spring",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-79689045",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        533.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        533.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "glide_l",
                    "text": "glide",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-a94c7b25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        593.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        593.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "bright_l",
                    "text": "bright",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5f2cc4b0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        653.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        653.0,
                        590.0,
                        50.0,
                        14.0
                    ],
                    "varname": "spring_l",
                    "text": "spring",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1e21df8b",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        650.0,
                        1070.0,
                        350.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        650.0,
                        1070.0,
                        350.0
                    ],
                    "varname": "panel_sequencer",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-4757ae89",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        656.0,
                        1046.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        656.0,
                        1046.0,
                        14.0
                    ],
                    "varname": "label_sequencer",
                    "text": "Sequencer",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-8a5a0513",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        30.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "varname": "pat_len",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 16.0
                }
            },
            {
                "box": {
                    "id": "obj-dc6cfeaa",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        30.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "varname": "pat_len_l",
                    "text": "length",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2750d185",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        95.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        95.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "varname": "swing",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "swing",
                            "parameter_shortname": "Swing",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-ac3dd168",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        93.0,
                        712.0,
                        42.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        93.0,
                        712.0,
                        42.0,
                        14.0
                    ],
                    "varname": "swing_l",
                    "text": "swing",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5ce03502",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        145.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        145.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "varname": "prob",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "prob",
                            "parameter_shortname": "Prob",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-1ff6dd9f",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        137.0,
                        712.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        137.0,
                        712.0,
                        60.0,
                        14.0
                    ],
                    "varname": "prob_l",
                    "text": "probability",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-b8d45876",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        205.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        205.0,
                        672.0,
                        38.0,
                        38.0
                    ],
                    "varname": "vel_range",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "vel_range",
                            "parameter_shortname": "Range",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-68ae7da8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        199.0,
                        712.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        199.0,
                        712.0,
                        50.0,
                        14.0
                    ],
                    "varname": "vel_l",
                    "text": "velocity",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-3cd52786",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        265.0,
                        680.0,
                        110.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        265.0,
                        680.0,
                        110.0,
                        22.0
                    ],
                    "varname": "direction",
                    "items": [
                        "Forward",
                        ",",
                        "Back",
                        ",",
                        "Ping pong",
                        ",",
                        "Random"
                    ],
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "textcolor2": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-bf96be6a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        265.0,
                        704.0,
                        110.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        265.0,
                        704.0,
                        110.0,
                        14.0
                    ],
                    "varname": "dir_l",
                    "text": "direction",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-df7038cd",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        395.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        395.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "varname": "ratchet",
                    "bgcolor": [
                        0.1,
                        0.1,
                        0.11,
                        1.0
                    ],
                    "textcolor": [
                        0.95,
                        0.94,
                        0.91,
                        1.0
                    ],
                    "triangle": 0,
                    "format": 6,
                    "value": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-aa5a0162",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        395.0,
                        704.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        395.0,
                        704.0,
                        60.0,
                        14.0
                    ],
                    "varname": "ratchet_l",
                    "text": "ratchet",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-9a049961",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        475.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        475.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "varname": "pat_a",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-02e16d1f",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        503.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        503.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "varname": "pat_b",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-28d13007",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        531.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        531.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "varname": "pat_c",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-9ec1167a",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        559.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        559.0,
                        680.0,
                        22.0,
                        22.0
                    ],
                    "varname": "pat_d",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-17a22d25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        475.0,
                        704.0,
                        110.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        475.0,
                        704.0,
                        110.0,
                        14.0
                    ],
                    "varname": "pat_bank_l",
                    "text": "bank a",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c3d94ff7",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        605.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        605.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "varname": "pat_clear",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-0708fb99",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        605.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        605.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "varname": "pat_clear_l",
                    "text": "clear",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-45c7a6fc",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        675.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        675.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "varname": "pat_rand",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-66b87e74",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        675.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        675.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "varname": "pat_rand_l",
                    "text": "random",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e15ed13e",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        745.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        745.0,
                        680.0,
                        50.0,
                        22.0
                    ],
                    "varname": "pat_copy",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-579a2011",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        745.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        745.0,
                        704.0,
                        50.0,
                        14.0
                    ],
                    "varname": "pat_copy_l",
                    "text": "copy",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-406b34df",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "list",
                        "list"
                    ],
                    "patching_rect": [
                        30.0,
                        750.0,
                        501.0,
                        191.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        750.0,
                        501.0,
                        191.0
                    ],
                    "varname": "ugrid",
                    "columns": 16,
                    "rows": 6,
                    "bgcolor": [
                        0.04,
                        0.04,
                        0.045,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0,
                    "horizontalspacing": 3,
                    "verticalspacing": 3,
                    "horizontalmargin": 4,
                    "verticalmargin": 4,
                    "cellwidth": 28,
                    "cellheight": 28
                }
            },
            {
                "box": {
                    "id": "obj-0277e1ec",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "list",
                        "list"
                    ],
                    "patching_rect": [
                        30.0,
                        955.0,
                        501.0,
                        36.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        955.0,
                        501.0,
                        36.0
                    ],
                    "varname": "stepind",
                    "columns": 16,
                    "rows": 1,
                    "bgcolor": [
                        0.04,
                        0.04,
                        0.045,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0,
                    "horizontalspacing": 3,
                    "verticalspacing": 3,
                    "horizontalmargin": 4,
                    "verticalmargin": 4,
                    "cellwidth": 28,
                    "cellheight": 28
                }
            },
            {
                "box": {
                    "id": "obj-7939288c",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        870.0,
                        990.0,
                        220.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        870.0,
                        990.0,
                        220.0,
                        90.0
                    ],
                    "varname": "panel_capture",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-64e3fdc1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        882.0,
                        996.0,
                        196.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        882.0,
                        996.0,
                        196.0,
                        14.0
                    ],
                    "varname": "label_capture",
                    "text": "Capture",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-45082879",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        885.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        885.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "rec_open",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-bb61910d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        880.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        880.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "varname": "rec_open_l",
                    "text": "open",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-739347c4",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        935.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        935.0,
                        1016.0,
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
                    "id": "obj-8c1c0a88",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        930.0,
                        1050.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        930.0,
                        1050.0,
                        40.0,
                        14.0
                    ],
                    "varname": "rec_arm_l",
                    "text": "arm",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2076fa53",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        980.0,
                        1016.0,
                        12.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        980.0,
                        1016.0,
                        12.0,
                        50.0
                    ],
                    "varname": "meter_l",
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-fe2389df",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1000.0,
                        1016.0,
                        12.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1000.0,
                        1016.0,
                        12.0,
                        50.0
                    ],
                    "varname": "meter_r",
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-22f7f1a8",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        990.0,
                        165.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        990.0,
                        165.0,
                        90.0
                    ],
                    "varname": "panel_drone",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-4d8d68d1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        996.0,
                        141.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        996.0,
                        141.0,
                        14.0
                    ],
                    "varname": "label_drone",
                    "text": "Drone",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1a9e8480",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "dr_root",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-a5a9cf61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        20.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "varname": "dr_root_l",
                    "text": "root drone",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-23d37451",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        105.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        105.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "dr_fifth",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-a439d2cf",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        95.0,
                        1050.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        95.0,
                        1050.0,
                        60.0,
                        14.0
                    ],
                    "varname": "dr_fifth_l",
                    "text": "fifth drone",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-0da434dd",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        195.0,
                        990.0,
                        310.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        195.0,
                        990.0,
                        310.0,
                        90.0
                    ],
                    "varname": "panel_chord",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-e538047a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        207.0,
                        996.0,
                        286.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        207.0,
                        996.0,
                        286.0,
                        14.0
                    ],
                    "varname": "label_chord",
                    "text": "Chord",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-fdf7c5b6",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "cp_yoruba",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-4d364704",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        195.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        195.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "varname": "cp_yoruba_l",
                    "text": "yoruba",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-37dd7b3b",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        275.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        275.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "cp_cluster",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-9bdddb3c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        265.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        265.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "varname": "cp_cluster_l",
                    "text": "cluster",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-e12d1c00",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        345.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        345.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "cp_fifths",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-49644763",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        335.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        335.0,
                        1050.0,
                        70.0,
                        14.0
                    ],
                    "varname": "cp_fifths_l",
                    "text": "fifths",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-22b732bd",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        425.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        425.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "cp_subdrone",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-6d42214e",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        410.0,
                        1050.0,
                        80.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        410.0,
                        1050.0,
                        80.0,
                        14.0
                    ],
                    "varname": "cp_subdrone_l",
                    "text": "sub drone",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-213443d5",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        520.0,
                        990.0,
                        225.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        520.0,
                        990.0,
                        225.0,
                        90.0
                    ],
                    "varname": "panel_voice spread",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-e1a1c8b5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        532.0,
                        996.0,
                        201.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        532.0,
                        996.0,
                        201.0,
                        14.0
                    ],
                    "varname": "label_voice_spread",
                    "text": "Voice spread",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-970c7b94",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        535.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        535.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "spr_tight",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-2e920bdb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        527.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        527.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "varname": "spr_tight_l",
                    "text": "tight",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6cab37d4",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        595.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        595.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "spr_med",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-9cc06e07",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        590.0,
                        1050.0,
                        40.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        590.0,
                        1050.0,
                        40.0,
                        14.0
                    ],
                    "varname": "spr_med_l",
                    "text": "med",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2e902c35",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        655.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        655.0,
                        1016.0,
                        30.0,
                        30.0
                    ],
                    "varname": "spr_wide",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-f0eed3cc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        647.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        647.0,
                        1050.0,
                        50.0,
                        14.0
                    ],
                    "varname": "spr_wide_l",
                    "text": "wide",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-f313016f",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        1100.0,
                        800.0,
                        90.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        1100.0,
                        800.0,
                        90.0
                    ],
                    "varname": "panel_voicings",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-c5b20512",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        1106.0,
                        776.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        1106.0,
                        776.0,
                        14.0
                    ],
                    "varname": "label_voicings",
                    "text": "Voicings",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7ee969ac",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_pluck",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-b70e7ee7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        22.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        22.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_pluck_l",
                    "text": "pluck",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-33bf622a",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        90.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        90.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_pad",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-aa0a5c7d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        82.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        82.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_pad_l",
                    "text": "pad",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-88b87fdb",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        150.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        150.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_swell",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-d50cdf6c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        142.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        142.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_swell_l",
                    "text": "swell",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-516cd303",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_stab",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-4bb20005",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        202.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        202.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_stab_l",
                    "text": "stab",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-fb47764e",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        270.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        270.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_bell",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-265eb6f0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        262.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        262.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_bell_l",
                    "text": "bell",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-df9f6632",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        330.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        330.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_swarm",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-6bb57596",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        322.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        322.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_swarm_l",
                    "text": "swarm",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-406bf100",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        390.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_drift",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-116baa58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        382.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        382.0,
                        1160.0,
                        50.0,
                        14.0
                    ],
                    "varname": "voice_drift_l",
                    "text": "drift",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-ff40d8d4",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        450.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        450.0,
                        1126.0,
                        30.0,
                        30.0
                    ],
                    "varname": "voice_sus",
                    "parameter_enable": 1
                }
            },
            {
                "box": {
                    "id": "obj-d1782224",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        440.0,
                        1160.0,
                        60.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        440.0,
                        1160.0,
                        60.0,
                        14.0
                    ],
                    "varname": "voice_sus_l",
                    "text": "sustain",
                    "fontname": "S\u00f6hne",
                    "fontsize": 9.0,
                    "textcolor": [
                        0.32,
                        0.3,
                        0.28,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-55be2665",
                    "maxclass": "panel",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15.0,
                        1210.0,
                        810.0,
                        110.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        15.0,
                        1210.0,
                        810.0,
                        110.0
                    ],
                    "varname": "panel_macros",
                    "background": 1,
                    "bgcolor": [
                        0.07,
                        0.07,
                        0.08,
                        1.0
                    ],
                    "bordersize": 0,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "obj-009a87a2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        27.0,
                        1216.0,
                        786.0,
                        14.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        27.0,
                        1216.0,
                        786.0,
                        14.0
                    ],
                    "varname": "label_macros",
                    "text": "Macros",
                    "fontname": "S\u00f6hne",
                    "fontface": 0,
                    "fontsize": 9.0,
                    "textcolor": [
                        0.4,
                        0.45,
                        0.62,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-8b0a7912",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        30.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        30.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_melt",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_melt",
                            "parameter_shortname": "Melt",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-a413fa79",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        90.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        90.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_ritual",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_ritual",
                            "parameter_shortname": "Ritual",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-31e9e4a1",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        150.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        150.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_mouth",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_mouth",
                            "parameter_shortname": "Mouth",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-60bf3c1f",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        210.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_ghost",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_ghost",
                            "parameter_shortname": "Ghost",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-ab98c2d2",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        270.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        270.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_choir",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_choir",
                            "parameter_shortname": "Choir",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-14f76413",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        330.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        330.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_recall",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_recall",
                            "parameter_shortname": "Recall",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-abc7eaa6",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        390.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_heat",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_heat",
                            "parameter_shortname": "Heat",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-5841ddd2",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "patching_rect": [
                        450.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        450.0,
                        1236.0,
                        50.0,
                        50.0
                    ],
                    "varname": "m_split",
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_split",
                            "parameter_shortname": "Split",
                            "parameter_range": [
                                0.0,
                                1.0
                            ],
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_modmode": 3,
                            "parameter_mmax": 1.0,
                            "parameter_mmin": 0.0
                        }
                    }
                }
            }
        ],
        "lines": []
    }
}