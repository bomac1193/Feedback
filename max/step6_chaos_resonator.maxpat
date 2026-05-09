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
        "rect": [ 34.0, 76.0, 1469.0, 803.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-title",
                    "linecount": 12,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 50.0, 280.0, 172.0 ],
                    "text": "CHAOS RESONATOR v5\n\n5 attractors → 6 waveguide resonators.\nBlend / Modulate / Route combining.\n19 African tuning systems. Arpeggiator.\nADSR. African patterns. BPM sync.\nMIDI clock. Scale-degree transpose.\n\n1. Turn on ezdac\n2. Choose attractor(s) + combine mode\n3. Connect MIDI clock (RYTM etc)\n4. STOP = click-free mute",
                    "varname": "obj-title"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 245.0, 45.0, 45.0 ],
                    "varname": "obj-ezdac"
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 202.0, 250.0, 58.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "obj-loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-startdsp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 282.0, 250.0, 75.0, 22.0 ],
                    "text": "startwindow",
                    "varname": "obj-startdsp"
                }
            },
            {
                "box": {
                    "id": "obj-init-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 202.0, 275.0, 61.0, 22.0 ],
                    "text": "delay 100",
                    "varname": "obj-init-delay"
                }
            },
            {
                "box": {
                    "id": "obj-init-msg",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 237.0, 299.0, 602.0, 36.0 ],
                    "text": "mute 0, chaos_gain 0.3, master_gain 1., rho 28, root 55, arp_mode 8, arp_div 3, arp_bpm 120, att_sel 0, att_b_sel 2, combine_mode 0, blend_mix 0.5, sub_amt 0, sub_drone 0",
                    "varname": "obj-init-msg"
                }
            },
            {
                "box": {
                    "id": "obj-s-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 202.0, 325.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-init"
                }
            },
            {
                "box": {
                    "id": "obj-mute-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 77.0, 250.0, 30.0, 30.0 ],
                    "varname": "obj-mute-tog"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-mute-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 255.0, 45.0, 20.0 ],
                    "text": "STOP",
                    "varname": "obj-mute-label"
                }
            },
            {
                "box": {
                    "id": "obj-mute-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 77.0, 285.0, 55.0, 22.0 ],
                    "text": "mute $1",
                    "varname": "obj-mute-m"
                }
            },
            {
                "box": {
                    "id": "obj-s-mute",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 142.0, 285.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-mute"
                }
            },
            {
                "box": {
                    "id": "obj-reset-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 17.0, 315.0, 30.0, 30.0 ],
                    "varname": "obj-reset-btn"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-reset-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 52.0, 320.0, 50.0, 20.0 ],
                    "text": "RESET",
                    "varname": "obj-reset-label"
                }
            },
            {
                "box": {
                    "id": "obj-reset-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 17.0, 353.0, 50.0, 22.0 ],
                    "text": "reset 1",
                    "varname": "obj-reset-on"
                }
            },
            {
                "box": {
                    "id": "obj-reset-del",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 77.0, 353.0, 65.0, 22.0 ],
                    "text": "delay 100",
                    "varname": "obj-reset-del"
                }
            },
            {
                "box": {
                    "id": "obj-reset-off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 77.0, 380.0, 50.0, 22.0 ],
                    "text": "reset 0",
                    "varname": "obj-reset-off"
                }
            },
            {
                "box": {
                    "id": "obj-s-reset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 405.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-reset"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sm-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 433.0, 56.0, 20.0 ],
                    "text": "smooth:",
                    "varname": "obj-sm-label"
                }
            },
            {
                "box": {
                    "id": "obj-sm-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 72.0, 433.0, 97.0, 22.0 ],
                    "text": "smooth_speed 0",
                    "varname": "obj-sm-0"
                }
            },
            {
                "box": {
                    "id": "obj-sm-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 108.0, 433.0, 97.0, 22.0 ],
                    "text": "smooth_speed 1",
                    "varname": "obj-sm-1"
                }
            },
            {
                "box": {
                    "id": "obj-sm-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 433.0, 97.0, 22.0 ],
                    "text": "smooth_speed 2",
                    "varname": "obj-sm-2"
                }
            },
            {
                "box": {
                    "id": "obj-sm-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 433.0, 97.0, 22.0 ],
                    "text": "smooth_speed 3",
                    "varname": "obj-sm-3"
                }
            },
            {
                "box": {
                    "id": "obj-s-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 72.0, 458.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-smooth"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-voices",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 485.0, 260.0, 95.0 ],
                    "text": "VOICES (Main/Layer):\n1 Sub Bass (iya ilu) ← X\n2 Body (omele) ← Y\n3 Metallic (ogene) ← Z\n4 Transient (gudugudu) ← X (route)\n5 Drone ← Y (route)\n6 Crystalline (shekere) ← Z (route)",
                    "varname": "obj-voices"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-midi-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 600.0, 160.0, 20.0 ],
                    "text": "—— LIVE / MIDI ——",
                    "varname": "obj-midi-label"
                }
            },
            {
                "box": {
                    "id": "obj-midi",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 200.0, 200.0, 450.0, 420.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "m-in",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 30.0, 42.0, 22.0 ],
                                    "text": "midiin"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-sel",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 4,
                                    "outlettype": [ "bang", "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 60.0, 110.0, 22.0 ],
                                    "text": "select 248 250 252"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-ctr",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "int", "", "", "int" ],
                                    "patching_rect": [ 30.0, 95.0, 68.0, 22.0 ],
                                    "text": "counter 0 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-tmr",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "" ],
                                    "patching_rect": [ 30.0, 125.0, 38.0, 22.0 ],
                                    "text": "timer"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-bpm",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 62.0, 22.0 ],
                                    "text": "!/ 15000."
                                }
                            },
                            {
                                "box": {
                                    "id": "m-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 185.0, 75.0, 22.0 ],
                                    "text": "clip 30. 300."
                                }
                            },
                            {
                                "box": {
                                    "id": "m-slide",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "slide 5 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-chg",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 245.0, 48.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-bpm-msg",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 275.0, 68.0, 22.0 ],
                                    "text": "arp_bpm $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-trig",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 175.0, 95.0, 33.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-unmute",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 175.0, 125.0, 42.0, 22.0 ],
                                    "text": "mute 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-rst-on",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 125.0, 70.0, 22.0 ],
                                    "text": "arp_reset 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-rst-del",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 155.0, 52.0, 22.0 ],
                                    "text": "delay 50"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-rst-off",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 185.0, 70.0, 22.0 ],
                                    "text": "arp_reset 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-stop",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 330.0, 95.0, 42.0, 22.0 ],
                                    "text": "mute 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-send",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 310.0, 50.0, 22.0 ],
                                    "text": "s toGen"
                                }
                            },
                            {
                                "box": {
                                    "id": "m-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 120.0, 310.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "m-label1",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 340.0, 200.0, 50.0 ],
                                    "text": "MIDI Clock → BPM sync\nStart = unmute + phase reset\nStop = mute"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "m-clip", 0 ],
                                    "source": [ "m-bpm", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-send", 0 ],
                                    "source": [ "m-bpm-msg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-bpm-msg", 0 ],
                                    "order": 1,
                                    "source": [ "m-chg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-out1", 0 ],
                                    "order": 0,
                                    "source": [ "m-chg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-slide", 0 ],
                                    "source": [ "m-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-tmr", 0 ],
                                    "source": [ "m-ctr", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-sel", 0 ],
                                    "source": [ "m-in", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-rst-off", 0 ],
                                    "source": [ "m-rst-del", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-send", 0 ],
                                    "source": [ "m-rst-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-rst-del", 0 ],
                                    "order": 0,
                                    "source": [ "m-rst-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-send", 0 ],
                                    "order": 1,
                                    "source": [ "m-rst-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-ctr", 0 ],
                                    "source": [ "m-sel", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-stop", 0 ],
                                    "source": [ "m-sel", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-trig", 0 ],
                                    "source": [ "m-sel", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-chg", 0 ],
                                    "source": [ "m-slide", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-send", 0 ],
                                    "source": [ "m-stop", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-bpm", 0 ],
                                    "source": [ "m-tmr", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-rst-on", 0 ],
                                    "source": [ "m-trig", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-unmute", 0 ],
                                    "source": [ "m-trig", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m-send", 0 ],
                                    "source": [ "m-unmute", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "patching_rect": [ 17.0, 623.0, 80.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "text": "p midi_sync",
                    "varname": "obj-midi"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-bpm-disp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 102.0, 623.0, 50.0, 22.0 ],
                    "varname": "obj-bpm-disp"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-bpm-disp-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 157.0, 626.0, 35.0, 20.0 ],
                    "text": "BPM",
                    "varname": "obj-bpm-disp-l"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-ml-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 655.0, 160.0, 20.0 ],
                    "text": "—— MIDI LEARN ——",
                    "varname": "obj-ml-label"
                }
            },
            {
                "box": {
                    "id": "obj-ml-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 17.0, 680.0, 20.0, 20.0 ],
                    "varname": "obj-ml-tog"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-ml-tog-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 680.0, 50.0, 20.0 ],
                    "text": "LEARN",
                    "varname": "obj-ml-tog-l"
                }
            },
            {
                "box": {
                    "id": "obj-ml-menu",
                    "items": [ "chaos_gain", "rho", "root_offset", "flex", "master_gain", "blend_mix", "mod_depth", "sub_amt", "arp_bpm", "arp_rate", "brightness", "sub_chaos" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 92.0, 680.0, 120.0, 22.0 ],
                    "varname": "obj-ml-menu"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-ml-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 705.0, 280.0, 17.0 ],
                    "text": "1. Select param  2. Toggle LEARN  3. Move a CC",
                    "varname": "obj-ml-hint"
                }
            },
            {
                "box": {
                    "id": "obj-ml-p",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 0.0, 0.0, 400.0, 250.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "ml-ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "int", "int" ],
                                    "patching_rect": [ 30.0, 30.0, 42.0, 22.0 ],
                                    "text": "ctlin"
                                }
                            },
                            {
                                "box": {
                                    "id": "ml-pack",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 60.0, 65.0, 22.0 ],
                                    "text": "pack 0 0 0"
                                }
                            },
                            {
                                "box": {
                                    "comment": "learn toggle",
                                    "id": "ml-in-learn",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "param index",
                                    "id": "ml-in-param",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 200.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "ml-js",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 100.0, 100.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "filename": "midi_learn.js",
                                        "parameter_enable": 0
                                    },
                                    "text": "js midi_learn.js"
                                }
                            },
                            {
                                "box": {
                                    "comment": "param messages",
                                    "id": "ml-out",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 150.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "ml-pack", 2 ],
                                    "source": [ "ml-ctl", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-pack", 1 ],
                                    "source": [ "ml-ctl", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-pack", 0 ],
                                    "source": [ "ml-ctl", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-js", 1 ],
                                    "source": [ "ml-in-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-js", 2 ],
                                    "source": [ "ml-in-param", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-out", 0 ],
                                    "source": [ "ml-js", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ml-js", 0 ],
                                    "source": [ "ml-pack", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.9, 0.9, 0.9, 1.0 ]
                    },
                    "patching_rect": [ 17.0, 725.0, 82.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.9, 0.9, 0.9, 1.0 ]
                    },
                    "text": "p midi_learn",
                    "varname": "obj-ml-p"
                }
            },
            {
                "box": {
                    "id": "obj-s-ml",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 17.0, 750.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-ml"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-lc-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 29.0, 160.0, 20.0 ],
                    "text": "—— LORENZ ——",
                    "varname": "obj-lc-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sigma-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 49.0, 50.0, 20.0 ],
                    "text": "sigma",
                    "varname": "obj-sigma-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-sigma-n",
                    "maxclass": "flonum",
                    "maximum": 50.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 69.0, 55.0, 22.0 ],
                    "varname": "obj-sigma-n"
                }
            },
            {
                "box": {
                    "id": "obj-sigma-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 94.0, 57.0, 22.0 ],
                    "text": "sigma $1",
                    "varname": "obj-sigma-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rho-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 448.0, 49.0, 50.0, 20.0 ],
                    "text": "rho",
                    "varname": "obj-rho-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-rho-n",
                    "maxclass": "flonum",
                    "maximum": 200.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 448.0, 69.0, 55.0, 22.0 ],
                    "varname": "obj-rho-n"
                }
            },
            {
                "box": {
                    "id": "obj-rho-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 448.0, 94.0, 45.0, 22.0 ],
                    "text": "rho $1",
                    "varname": "obj-rho-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-beta-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 513.0, 49.0, 50.0, 20.0 ],
                    "text": "beta",
                    "varname": "obj-beta-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-beta-n",
                    "maxclass": "flonum",
                    "maximum": 20.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 69.0, 55.0, 22.0 ],
                    "varname": "obj-beta-n"
                }
            },
            {
                "box": {
                    "id": "obj-beta-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 513.0, 94.0, 50.0, 22.0 ],
                    "text": "beta $1",
                    "varname": "obj-beta-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-dt-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 578.0, 49.0, 50.0, 20.0 ],
                    "text": "dt",
                    "varname": "obj-dt-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-dt-n",
                    "maxclass": "flonum",
                    "maximum": 0.02,
                    "minimum": 0.0003,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 578.0, 69.0, 55.0, 22.0 ],
                    "varname": "obj-dt-n"
                }
            },
            {
                "box": {
                    "id": "obj-dt-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 578.0, 94.0, 78.0, 22.0 ],
                    "text": "lorenz_dt $1",
                    "varname": "obj-dt-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-cg-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 668.0, 49.0, 50.0, 20.0 ],
                    "text": "chaos",
                    "varname": "obj-cg-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-cg-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 668.0, 69.0, 55.0, 22.0 ],
                    "varname": "obj-cg-n"
                }
            },
            {
                "box": {
                    "id": "obj-cg-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 668.0, 94.0, 87.0, 22.0 ],
                    "text": "chaos_gain $1",
                    "varname": "obj-cg-m"
                }
            },
            {
                "box": {
                    "id": "obj-s-lor",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 580.0, 128.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-lor"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-att-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 129.0, 160.0, 20.0 ],
                    "text": "—— ATTRACTOR ——",
                    "varname": "obj-att-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-att-a-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 154.0, 50.0, 20.0 ],
                    "text": "Main:",
                    "varname": "obj-att-a-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-a-lbl-lor",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 446.0, 154.0, 55.0, 18.0 ],
                    "text": "Lorenz",
                    "varname": "obj-att-a-lbl-lor"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-a-lbl-ros",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 509.0, 154.0, 55.0, 18.0 ],
                    "text": "Rossler",
                    "varname": "obj-att-a-lbl-ros"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-a-lbl-chu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 572.0, 154.0, 55.0, 18.0 ],
                    "text": "Chua",
                    "varname": "obj-att-a-lbl-chu"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-a-lbl-hal",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 635.0, 154.0, 55.0, 18.0 ],
                    "text": "Halv",
                    "varname": "obj-att-a-lbl-hal"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-a-lbl-aiz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 721.0, 154.0, 55.0, 18.0 ],
                    "text": "Aizawa",
                    "varname": "obj-att-a-lbl-aiz"
                }
            },
            {
                "box": {
                    "id": "obj-att-a-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 446.0, 172.0, 55.0, 22.0 ],
                    "text": "att_sel 0",
                    "varname": "obj-att-a-0"
                }
            },
            {
                "box": {
                    "id": "obj-att-a-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 509.0, 172.0, 55.0, 22.0 ],
                    "text": "att_sel 1",
                    "varname": "obj-att-a-1"
                }
            },
            {
                "box": {
                    "id": "obj-att-a-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 572.0, 172.0, 54.0, 22.0 ],
                    "text": "att_sel 2",
                    "varname": "obj-att-a-2"
                }
            },
            {
                "box": {
                    "id": "obj-att-a-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 635.0, 172.0, 55.0, 22.0 ],
                    "text": "att_sel 3",
                    "varname": "obj-att-a-3"
                }
            },
            {
                "box": {
                    "id": "obj-att-a-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 721.0, 172.0, 54.0, 22.0 ],
                    "text": "att_sel 4",
                    "varname": "obj-att-a-4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-att-b-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 204.0, 50.0, 20.0 ],
                    "text": "Layer:",
                    "varname": "obj-att-b-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-off",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 446.0, 204.0, 42.0, 18.0 ],
                    "text": "Off",
                    "varname": "obj-att-b-lbl-off"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-lor",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 488.0, 204.0, 42.0, 18.0 ],
                    "text": "Lor",
                    "varname": "obj-att-b-lbl-lor"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-ros",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 541.0, 204.0, 42.0, 18.0 ],
                    "text": "Ross",
                    "varname": "obj-att-b-lbl-ros"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-chu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 594.0, 204.0, 42.0, 18.0 ],
                    "text": "Chua",
                    "varname": "obj-att-b-lbl-chu"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-hal",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 641.0, 204.0, 42.0, 18.0 ],
                    "text": "Halv",
                    "varname": "obj-att-b-lbl-hal"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-att-b-lbl-aiz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 721.0, 204.0, 42.0, 18.0 ],
                    "text": "Aiz",
                    "varname": "obj-att-b-lbl-aiz"
                }
            },
            {
                "box": {
                    "id": "obj-att-b--1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 446.0, 222.0, 71.0, 22.0 ],
                    "text": "att_b_sel -1",
                    "varname": "obj-att-b--1"
                }
            },
            {
                "box": {
                    "id": "obj-att-b-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 488.0, 222.0, 67.0, 22.0 ],
                    "text": "att_b_sel 0",
                    "varname": "obj-att-b-0"
                }
            },
            {
                "box": {
                    "id": "obj-att-b-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 541.0, 222.0, 67.0, 22.0 ],
                    "text": "att_b_sel 1",
                    "varname": "obj-att-b-1"
                }
            },
            {
                "box": {
                    "id": "obj-att-b-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 594.0, 222.0, 67.0, 22.0 ],
                    "text": "att_b_sel 2",
                    "varname": "obj-att-b-2"
                }
            },
            {
                "box": {
                    "id": "obj-att-b-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 641.0, 222.0, 67.0, 22.0 ],
                    "text": "att_b_sel 3",
                    "varname": "obj-att-b-3"
                }
            },
            {
                "box": {
                    "id": "obj-att-b-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 721.0, 222.0, 67.0, 22.0 ],
                    "text": "att_b_sel 4",
                    "varname": "obj-att-b-4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-cm-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 254.0, 65.0, 20.0 ],
                    "text": "Combine:",
                    "varname": "obj-cm-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-cm-lbl-ble",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 446.0, 254.0, 60.0, 18.0 ],
                    "text": "Blend",
                    "varname": "obj-cm-lbl-ble"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-cm-lbl-mod",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 531.0, 254.0, 60.0, 18.0 ],
                    "text": "Modulate",
                    "varname": "obj-cm-lbl-mod"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-cm-lbl-rou",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 635.0, 254.0, 60.0, 18.0 ],
                    "text": "Route",
                    "varname": "obj-cm-lbl-rou"
                }
            },
            {
                "box": {
                    "id": "obj-cm-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 446.0, 272.0, 101.0, 22.0 ],
                    "text": "combine_mode 0",
                    "varname": "obj-cm-0"
                }
            },
            {
                "box": {
                    "id": "obj-cm-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 531.0, 272.0, 101.0, 22.0 ],
                    "text": "combine_mode 1",
                    "varname": "obj-cm-1"
                }
            },
            {
                "box": {
                    "id": "obj-cm-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 635.0, 272.0, 101.0, 22.0 ],
                    "text": "combine_mode 2",
                    "varname": "obj-cm-2"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-cm-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 446.0, 327.0, 320.0, 18.0 ],
                    "text": "Blend=crossfade  Modulate=AM  Route=split voices",
                    "varname": "obj-cm-hint"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-bmix-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 347.0, 69.0, 20.0 ],
                    "text": "blend mix:",
                    "varname": "obj-bmix-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-bmix-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 453.0, 347.0, 48.0, 22.0 ],
                    "varname": "obj-bmix-n"
                }
            },
            {
                "box": {
                    "id": "obj-bmix-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 453.0, 372.0, 80.0, 22.0 ],
                    "text": "blend_mix $1",
                    "varname": "obj-bmix-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-mdep-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 553.0, 347.0, 74.0, 20.0 ],
                    "text": "mod depth:",
                    "varname": "obj-mdep-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-mdep-n",
                    "maxclass": "flonum",
                    "maximum": 2.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 623.0, 347.0, 48.0, 22.0 ],
                    "varname": "obj-mdep-n"
                }
            },
            {
                "box": {
                    "id": "obj-mdep-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 623.0, 372.0, 85.0, 22.0 ],
                    "text": "mod_depth $1",
                    "varname": "obj-mdep-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-atp-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 407.0, 75.0, 20.0 ],
                    "text": "Character:",
                    "varname": "obj-atp-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-atp-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 463.0, 407.0, 150.0, 18.0 ],
                    "text": "per-attractor tuning",
                    "varname": "obj-atp-hint"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-ross_c-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 402.0, 427.0, 55.0, 20.0 ],
                    "text": "ross c",
                    "varname": "obj-ross_c-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-ross_c-n",
                    "maxclass": "flonum",
                    "maximum": 20.0,
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 402.0, 447.0, 55.0, 22.0 ],
                    "varname": "obj-ross_c-n"
                }
            },
            {
                "box": {
                    "id": "obj-ross_c-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 402.0, 472.0, 62.0, 22.0 ],
                    "text": "ross_c $1",
                    "varname": "obj-ross_c-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-chua_a-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 487.0, 427.0, 55.0, 20.0 ],
                    "text": "chua α",
                    "varname": "obj-chua_a-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-chua_a-n",
                    "maxclass": "flonum",
                    "maximum": 30.0,
                    "minimum": 5.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 487.0, 447.0, 55.0, 22.0 ],
                    "varname": "obj-chua_a-n"
                }
            },
            {
                "box": {
                    "id": "obj-chua_a-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 487.0, 472.0, 87.0, 22.0 ],
                    "text": "chua_alpha $1",
                    "varname": "obj-chua_a-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-halv_a-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 587.0, 427.0, 55.0, 20.0 ],
                    "text": "halv a",
                    "varname": "obj-halv_a-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-halv_a-n",
                    "maxclass": "flonum",
                    "maximum": 5.0,
                    "minimum": 0.5,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 587.0, 447.0, 55.0, 22.0 ],
                    "varname": "obj-halv_a-n"
                }
            },
            {
                "box": {
                    "id": "obj-halv_a-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 587.0, 472.0, 62.0, 22.0 ],
                    "text": "halv_a $1",
                    "varname": "obj-halv_a-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-aizc-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 402.0, 502.0, 55.0, 20.0 ],
                    "text": "aiz c",
                    "varname": "obj-aizc-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-aizc-n",
                    "maxclass": "flonum",
                    "maximum": 2.0,
                    "minimum": 0.1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 402.0, 522.0, 55.0, 22.0 ],
                    "varname": "obj-aizc-n"
                }
            },
            {
                "box": {
                    "id": "obj-aizc-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 402.0, 547.0, 53.0, 22.0 ],
                    "text": "aiz_c $1",
                    "varname": "obj-aizc-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-aizd-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 487.0, 502.0, 55.0, 20.0 ],
                    "text": "aiz d",
                    "varname": "obj-aizd-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-aizd-n",
                    "maxclass": "flonum",
                    "maximum": 10.0,
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 487.0, 522.0, 55.0, 22.0 ],
                    "varname": "obj-aizd-n"
                }
            },
            {
                "box": {
                    "id": "obj-aizd-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 487.0, 547.0, 54.0, 22.0 ],
                    "text": "aiz_d $1",
                    "varname": "obj-aizd-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-camac-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 579.0, 94.0, 20.0 ],
                    "text": "chaos amount:",
                    "varname": "obj-camac-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-camac-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 478.0, 579.0, 55.0, 22.0 ],
                    "varname": "obj-camac-n"
                }
            },
            {
                "box": {
                    "id": "obj-camac-srho",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 478.0, 604.0, 130.0, 22.0 ],
                    "text": "scale 0. 1. 100. 28.",
                    "varname": "obj-camac-srho"
                }
            },
            {
                "box": {
                    "id": "obj-camac-rhom",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 478.0, 629.0, 52.0, 22.0 ],
                    "text": "rho $1",
                    "varname": "obj-camac-rhom"
                }
            },
            {
                "box": {
                    "id": "obj-camac-scg",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 623.0, 604.0, 130.0, 22.0 ],
                    "text": "scale 0. 1. 0. 1.",
                    "varname": "obj-camac-scg"
                }
            },
            {
                "box": {
                    "id": "obj-camac-cgm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 623.0, 629.0, 88.0, 22.0 ],
                    "text": "chaos_gain $1",
                    "varname": "obj-camac-cgm"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-camac-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 579.0, 160.0, 18.0 ],
                    "text": "0=ordered  1=full chaos",
                    "varname": "obj-camac-hint"
                }
            },
            {
                "box": {
                    "id": "obj-s-att",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 659.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-att"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rc-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 685.0, 150.0, 20.0 ],
                    "text": "—— RESONATORS ——",
                    "varname": "obj-rc-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-flex-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 478.0, 707.0, 55.0, 20.0 ],
                    "text": "flex",
                    "varname": "obj-flex-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flex-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 478.0, 727.0, 55.0, 22.0 ],
                    "varname": "obj-flex-n"
                }
            },
            {
                "box": {
                    "id": "obj-flex-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 478.0, 752.0, 48.0, 22.0 ],
                    "text": "flex $1",
                    "varname": "obj-flex-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-mg-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 553.0, 707.0, 55.0, 20.0 ],
                    "text": "master",
                    "varname": "obj-mg-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-mg-n",
                    "maxclass": "flonum",
                    "maximum": 1.5,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 553.0, 727.0, 55.0, 22.0 ],
                    "varname": "obj-mg-n"
                }
            },
            {
                "box": {
                    "id": "obj-mg-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 553.0, 752.0, 95.0, 22.0 ],
                    "text": "master_gain $1",
                    "varname": "obj-mg-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-glide-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 707.0, 55.0, 20.0 ],
                    "text": "glide",
                    "varname": "obj-glide-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-glide-n",
                    "maxclass": "flonum",
                    "maximum": 0.05,
                    "minimum": 0.0001,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 653.0, 727.0, 55.0, 22.0 ],
                    "varname": "obj-glide-n"
                }
            },
            {
                "box": {
                    "id": "obj-glide-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 653.0, 752.0, 55.0, 22.0 ],
                    "text": "glide $1",
                    "varname": "obj-glide-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-root-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 707.0, 55.0, 20.0 ],
                    "text": "root",
                    "varname": "obj-root-l"
                }
            },
            {
                "box": {
                    "id": "obj-root-n",
                    "maxclass": "number",
                    "maximum": 500,
                    "minimum": 20,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 727.0, 55.0, 22.0 ],
                    "varname": "obj-root-n"
                }
            },
            {
                "box": {
                    "id": "obj-root-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 752.0, 55.0, 22.0 ],
                    "text": "root $1",
                    "varname": "obj-root-m"
                }
            },
            {
                "box": {
                    "id": "obj-root-snap",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 300.0, 200.0, 450.0, 320.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "rs-in1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 200.0, 15.0, 30.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "rs-recv",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 15.0, 50.0, 22.0 ],
                                    "text": "r toGen"
                                }
                            },
                            {
                                "box": {
                                    "id": "rs-route",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 50.0, 68.0, 22.0 ],
                                    "text": "route root"
                                }
                            },
                            {
                                "box": {
                                    "id": "rs-set",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 85.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "rs-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 120.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "rs-num",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 155.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "rs-label",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 185.0, 250.0, 40.0 ],
                                    "text": "Root display (spring logic in gen~ DSP)\nPresets update display via [r toGen]"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "rs-route", 0 ],
                                    "source": [ "rs-recv", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rs-num", 0 ],
                                    "order": 0,
                                    "source": [ "rs-route", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rs-set", 0 ],
                                    "order": 1,
                                    "source": [ "rs-route", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rs-out1", 0 ],
                                    "source": [ "rs-set", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "patching_rect": [ 17.0, 655.0, 78.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "text": "p root_snap",
                    "varname": "obj-root-snap"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-brt-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 743.0, 707.0, 50.0, 20.0 ],
                    "text": "bright",
                    "varname": "obj-brt-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-brt-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": -1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 743.0, 727.0, 55.0, 22.0 ],
                    "varname": "obj-brt-n"
                }
            },
            {
                "box": {
                    "id": "obj-brt-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 743.0, 752.0, 85.0, 22.0 ],
                    "text": "brightness $1",
                    "varname": "obj-brt-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-res-def-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 12.0, 780.0, 59.0, 20.0 ],
                    "text": "defaults:",
                    "varname": "obj-res-def-l"
                }
            },
            {
                "box": {
                    "id": "obj-res-def",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 72.0, 780.0, 401.0, 36.0 ],
                    "text": "root 55, flex 0.5, master_gain 0.7, glide 0.001, brightness 0, sub_amt 0.5, sub_drive 0, sub_drone 1, sub_oct -1",
                    "varname": "obj-res-def"
                }
            },
            {
                "box": {
                    "id": "obj-s-res",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 805.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-res"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sub-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 825.0, 126.0, 20.0 ],
                    "text": "—— SUB-BASS ——",
                    "varname": "obj-sub-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sub-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 847.0, 55.0, 20.0 ],
                    "text": "sub amt",
                    "varname": "obj-sub-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-sub-n",
                    "maxclass": "flonum",
                    "maximum": 1.5,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 867.0, 55.0, 22.0 ],
                    "varname": "obj-sub-n"
                }
            },
            {
                "box": {
                    "id": "obj-sub-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 892.0, 71.0, 22.0 ],
                    "text": "sub_amt $1",
                    "varname": "obj-sub-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-drv-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 478.0, 847.0, 50.0, 20.0 ],
                    "text": "drive",
                    "varname": "obj-drv-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-drv-n",
                    "maxclass": "flonum",
                    "maximum": 5.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 478.0, 867.0, 55.0, 22.0 ],
                    "varname": "obj-drv-n"
                }
            },
            {
                "box": {
                    "id": "obj-drv-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 478.0, 892.0, 80.0, 22.0 ],
                    "text": "sub_drive $1",
                    "varname": "obj-drv-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sdr-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 847.0, 45.0, 20.0 ],
                    "text": "drone",
                    "varname": "obj-sdr-l"
                }
            },
            {
                "box": {
                    "id": "obj-sdr-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 583.0, 867.0, 24.0, 24.0 ],
                    "varname": "obj-sdr-tog"
                }
            },
            {
                "box": {
                    "id": "obj-sdr-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 583.0, 892.0, 82.0, 22.0 ],
                    "text": "sub_drone $1",
                    "varname": "obj-sdr-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-sdr-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 915.0, 120.0, 17.0 ],
                    "text": "ON=const OFF=follow",
                    "varname": "obj-sdr-hint"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-soct-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 663.0, 847.0, 51.0, 20.0 ],
                    "text": "sub oct",
                    "varname": "obj-soct-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-soct-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": -3.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 663.0, 867.0, 50.0, 22.0 ],
                    "varname": "obj-soct-n"
                }
            },
            {
                "box": {
                    "id": "obj-soct-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 663.0, 892.0, 68.0, 22.0 ],
                    "text": "sub_oct $1",
                    "varname": "obj-soct-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-soct-hint",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 715.0, 865.0, 70.0, 27.0 ],
                    "text": "-1=oct below\n0=unison",
                    "varname": "obj-soct-hint"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sch-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 743.0, 847.0, 45.0, 20.0 ],
                    "text": "chaos",
                    "varname": "obj-sch-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-sch-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 743.0, 867.0, 50.0, 22.0 ],
                    "varname": "obj-sch-n"
                }
            },
            {
                "box": {
                    "id": "obj-sch-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 743.0, 892.0, 85.0, 22.0 ],
                    "text": "sub_chaos $1",
                    "varname": "obj-sch-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-sch-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 743.0, 915.0, 90.0, 17.0 ],
                    "text": "0=clean 1=dirty",
                    "varname": "obj-sch-hint"
                }
            },
            {
                "box": {
                    "id": "obj-s-sub",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 935.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-sub"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-ts-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 955.0, 120.0, 20.0 ],
                    "text": "—— TUNING ——",
                    "varname": "obj-ts-label"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ts-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 975.0, 90.0, 20.0 ],
                    "text": "system (0-18)",
                    "varname": "obj-ts-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-ts-n",
                    "maxclass": "flonum",
                    "maximum": 18.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 995.0, 45.0, 22.0 ],
                    "varname": "obj-ts-n"
                }
            },
            {
                "box": {
                    "id": "obj-ts-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 1020.0, 105.0, 22.0 ],
                    "text": "tuning_system $1",
                    "varname": "obj-ts-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-inv-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 975.0, 70.0, 20.0 ],
                    "text": "inversion",
                    "varname": "obj-inv-l"
                }
            },
            {
                "box": {
                    "id": "obj-inv-n",
                    "maxclass": "number",
                    "maximum": 2,
                    "minimum": -2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 503.0, 995.0, 40.0, 22.0 ],
                    "varname": "obj-inv-n"
                }
            },
            {
                "box": {
                    "id": "obj-inv-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 503.0, 1020.0, 80.0, 22.0 ],
                    "text": "inversion $1",
                    "varname": "obj-inv-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-trn-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 618.0, 975.0, 66.0, 20.0 ],
                    "text": "transpose",
                    "varname": "obj-trn-l"
                }
            },
            {
                "box": {
                    "id": "obj-trn-n",
                    "maxclass": "number",
                    "maximum": 12,
                    "minimum": -12,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 618.0, 995.0, 40.0, 22.0 ],
                    "varname": "obj-trn-n"
                }
            },
            {
                "box": {
                    "id": "obj-trn-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 618.0, 1020.0, 80.0, 22.0 ],
                    "text": "transpose $1",
                    "varname": "obj-trn-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-reg-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1045.0, 65.0, 20.0 ],
                    "text": "register",
                    "varname": "obj-reg-l"
                }
            },
            {
                "box": {
                    "id": "obj-reg-n",
                    "maxclass": "number",
                    "maximum": 3,
                    "minimum": -3,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 1065.0, 40.0, 22.0 ],
                    "varname": "obj-reg-n"
                }
            },
            {
                "box": {
                    "id": "obj-reg-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 1090.0, 72.0, 22.0 ],
                    "text": "register $1",
                    "varname": "obj-reg-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-boct-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 1045.0, 65.0, 20.0 ],
                    "text": "bass oct",
                    "varname": "obj-boct-l"
                }
            },
            {
                "box": {
                    "id": "obj-boct-n",
                    "maxclass": "number",
                    "maximum": 2,
                    "minimum": -2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 503.0, 1065.0, 40.0, 22.0 ],
                    "varname": "obj-boct-n"
                }
            },
            {
                "box": {
                    "id": "obj-boct-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 503.0, 1090.0, 73.0, 22.0 ],
                    "text": "bass_oct $1",
                    "varname": "obj-boct-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-toct-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 618.0, 1045.0, 70.0, 20.0 ],
                    "text": "treble oct",
                    "varname": "obj-toct-l"
                }
            },
            {
                "box": {
                    "id": "obj-toct-n",
                    "maxclass": "number",
                    "maximum": 4,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 618.0, 1065.0, 40.0, 22.0 ],
                    "varname": "obj-toct-n"
                }
            },
            {
                "box": {
                    "id": "obj-toct-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 618.0, 1090.0, 78.0, 22.0 ],
                    "text": "treble_oct $1",
                    "varname": "obj-toct-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rsp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1120.0, 160.0, 20.0 ],
                    "text": "—— ROOT SPRING ——",
                    "varname": "obj-rsp-label"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-roff-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1140.0, 70.0, 20.0 ],
                    "text": "offset (st)",
                    "varname": "obj-roff-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-roff-n",
                    "maxclass": "flonum",
                    "maximum": 24.0,
                    "minimum": -24.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 383.0, 1160.0, 55.0, 22.0 ],
                    "varname": "obj-roff-n"
                }
            },
            {
                "box": {
                    "id": "obj-roff-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 1185.0, 95.0, 22.0 ],
                    "text": "root_offset $1",
                    "varname": "obj-roff-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rmod-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 1140.0, 41.0, 20.0 ],
                    "text": "mode",
                    "varname": "obj-rmod-l"
                }
            },
            {
                "box": {
                    "id": "obj-rmod-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 503.0, 1160.0, 24.0, 24.0 ],
                    "varname": "obj-rmod-tog"
                }
            },
            {
                "box": {
                    "id": "obj-rmod-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 503.0, 1185.0, 85.0, 22.0 ],
                    "text": "root_mode $1",
                    "varname": "obj-rmod-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-rmod-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 533.0, 1162.0, 110.0, 17.0 ],
                    "text": "0=Spring 1=Latch",
                    "varname": "obj-rmod-hint"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-rret-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 618.0, 1140.0, 70.0, 20.0 ],
                    "text": "return (s)",
                    "varname": "obj-rret-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-rret-n",
                    "maxclass": "flonum",
                    "maximum": 3.0,
                    "minimum": 0.05,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 618.0, 1160.0, 55.0, 22.0 ],
                    "varname": "obj-rret-n"
                }
            },
            {
                "box": {
                    "id": "obj-rret-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 618.0, 1185.0, 95.0, 22.0 ],
                    "text": "root_return $1",
                    "varname": "obj-rret-m"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-rcc-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1213.0, 110.0, 18.0 ],
                    "text": "MIDI CC → offset",
                    "varname": "obj-rcc-l"
                }
            },
            {
                "box": {
                    "id": "obj-rcc-ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 383.0, 1231.0, 40.0, 22.0 ],
                    "text": "ctlin",
                    "varname": "obj-rcc-ctl"
                }
            },
            {
                "box": {
                    "id": "obj-rcc-scl",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 1256.0, 115.0, 22.0 ],
                    "text": "scale 0 127 -24 24",
                    "varname": "obj-rcc-scl"
                }
            },
            {
                "box": {
                    "id": "obj-rcc-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 383.0, 1281.0, 112.0, 22.0 ],
                    "text": "prepend root_offset",
                    "varname": "obj-rcc-prep"
                }
            },
            {
                "box": {
                    "id": "obj-s-tun",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1310.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-tun"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-arp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1235.0, 160.0, 20.0 ],
                    "text": "—— ARPEGGIATOR ——",
                    "varname": "obj-arp-label"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-eucl-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 1345.0, 70.0, 18.0 ],
                    "text": "Euclidean",
                    "varname": "obj-eucl-hint"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-ep-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 733.0, 1345.0, 42.0, 18.0 ],
                    "text": "pulses",
                    "varname": "obj-ep-l"
                }
            },
            {
                "box": {
                    "id": "obj-ep-n",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 733.0, 1365.0, 35.0, 22.0 ],
                    "varname": "obj-ep-n"
                }
            },
            {
                "box": {
                    "id": "obj-ep-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 653.0, 1390.0, 89.0, 22.0 ],
                    "text": "eucl_pulses $1",
                    "varname": "obj-ep-m"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-es-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 778.0, 1345.0, 35.0, 18.0 ],
                    "text": "steps",
                    "varname": "obj-es-l"
                }
            },
            {
                "box": {
                    "id": "obj-es-n",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 778.0, 1365.0, 35.0, 22.0 ],
                    "varname": "obj-es-n"
                }
            },
            {
                "box": {
                    "id": "obj-es-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 743.0, 1390.0, 83.0, 22.0 ],
                    "text": "eucl_steps $1",
                    "varname": "obj-es-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-bpm-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 1420.0, 34.0, 20.0 ],
                    "text": "bpm",
                    "varname": "obj-bpm-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-bpm-n",
                    "maxclass": "flonum",
                    "maximum": 300.0,
                    "minimum": 20.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 418.0, 1420.0, 50.0, 22.0 ],
                    "varname": "obj-bpm-n"
                }
            },
            {
                "box": {
                    "id": "obj-bpm-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 418.0, 1445.0, 73.0, 22.0 ],
                    "text": "arp_bpm $1",
                    "varname": "obj-bpm-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-arpr-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 513.0, 1420.0, 50.0, 20.0 ],
                    "text": "free Hz",
                    "varname": "obj-arpr-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-arpr-n",
                    "maxclass": "flonum",
                    "maximum": 50.0,
                    "minimum": 0.1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 568.0, 1420.0, 50.0, 22.0 ],
                    "varname": "obj-arpr-n"
                }
            },
            {
                "box": {
                    "id": "obj-arpr-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.0, 1445.0, 70.0, 22.0 ],
                    "text": "arp_rate $1",
                    "varname": "obj-arpr-m"
                }
            },
            {
                "box": {
                    "id": "obj-s-arp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 1470.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-arp"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-ugrid-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 188.0, 1565.0, 120.0, 19.0 ],
                    "text": "USER PATTERN",
                    "varname": "obj-ugrid-label"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-ugrid-voices",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 188.0, 1582.0, 200.0, 17.0 ],
                    "text": "v1 v2 v3 v4 v5 v6",
                    "varname": "obj-ugrid-voices"
                }
            },
            {
                "box": {
                    "columns": 16,
                    "id": "obj-ugrid",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "list" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 188.0, 1600.0, 320.0, 120.0 ],
                    "rows": 6,
                    "varname": "obj-ugrid"
                }
            },
            {
                "box": {
                    "columns": 16,
                    "id": "obj-stepind",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "list" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 188.0, 1735.0, 320.0, 18.0 ],
                    "rows": 1,
                    "varname": "obj-stepind"
                }
            },
            {
                "box": {
                    "id": "obj-stepind-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 540.0, 1735.0, 90.0, 22.0 ],
                    "text": "snapshot~ 16"
                }
            },
            {
                "box": {
                    "id": "obj-stepind-change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 540.0, 1762.0, 60.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-stepind-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "bang" ],
                    "patching_rect": [ 540.0, 1789.0, 50.0, 22.0 ],
                    "text": "t i b"
                }
            },
            {
                "box": {
                    "id": "obj-stepind-clear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 605.0, 1816.0, 45.0, 22.0 ],
                    "text": "clear",
                    "varname": "obj-stepind-clear"
                }
            },
            {
                "box": {
                    "id": "obj-stepind-pak",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 1816.0, 130.0, 22.0 ],
                    "text": "pak 0 0 1"
                }
            },
            {
                "box": {
                    "id": "obj-grid-p",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 300.0, 200.0, 350.0, 200.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "g-in1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 15.0, 30.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "g-unpack",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "int", "int" ],
                                    "patching_rect": [ 30.0, 50.0, 70.0, 22.0 ],
                                    "text": "unpack i i i"
                                }
                            },
                            {
                                "box": {
                                    "id": "g-coll",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "", "", "" ],
                                    "patching_rect": [ 30.0, 180.0, 100.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "embed": 0,
                                        "precision": 6
                                    },
                                    "text": "coll grid_masks"
                                }
                            },
                            {
                                "box": {
                                    "id": "g-getmsg",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 200.0, 50.0, 78.0, 22.0 ],
                                    "text": "prepend refer"
                                }
                            },
                            {
                                "box": {
                                    "id": "g-js",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 85.0, 110.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "filename": "grid_bitmask.js",
                                        "parameter_enable": 0
                                    },
                                    "text": "js grid_bitmask.js"
                                }
                            },
                            {
                                "box": {
                                    "id": "g-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 120.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "g-label",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 150.0, 280.0, 20.0 ],
                                    "text": "Converts matrixctrl col/row/state to usN bitmask messages"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "g-js", 0 ],
                                    "source": [ "g-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "g-out1", 0 ],
                                    "source": [ "g-js", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "patching_rect": [ 722.0, 1730.0, 110.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "text": "p grid_to_bitmask",
                    "varname": "obj-grid-p"
                }
            },
            {
                "box": {
                    "id": "obj-s-grid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 275.0, 1843.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-grid"
                }
            },
            {
                "box": {
                    "id": "obj-ugrid-act",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 188.0, 1745.0, 79.0, 22.0 ],
                    "text": "arp_mode 20",
                    "varname": "obj-ugrid-act"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-ugrid-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 275.0, 1747.0, 60.0, 18.0 ],
                    "text": "← activate",
                    "varname": "obj-ugrid-hint"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-upl-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 414.0, 1903.0, 40.0, 18.0 ],
                    "text": "steps:",
                    "varname": "obj-upl-l"
                }
            },
            {
                "box": {
                    "id": "obj-upl-n",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 457.0, 1903.0, 35.0, 22.0 ],
                    "varname": "obj-upl-n"
                }
            },
            {
                "box": {
                    "id": "obj-upl-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 497.0, 1903.0, 100.0, 22.0 ],
                    "text": "user_pat_len $1",
                    "varname": "obj-upl-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-adsr-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 279.0, 1933.0, 180.0, 20.0 ],
                    "text": "—— ADSR ENVELOPE ——",
                    "varname": "obj-adsr-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-atk-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 279.0, 1955.0, 60.0, 20.0 ],
                    "text": "attack",
                    "varname": "obj-atk-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-atk-n",
                    "maxclass": "flonum",
                    "maximum": 2.0,
                    "minimum": 0.001,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 279.0, 1975.0, 55.0, 22.0 ],
                    "varname": "obj-atk-n"
                }
            },
            {
                "box": {
                    "id": "obj-atk-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.0, 2000.0, 85.0, 22.0 ],
                    "text": "env_attack $1",
                    "varname": "obj-atk-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-dec-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 374.0, 1955.0, 60.0, 20.0 ],
                    "text": "decay",
                    "varname": "obj-dec-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-dec-n",
                    "maxclass": "flonum",
                    "maximum": 2.0,
                    "minimum": 0.001,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 374.0, 1975.0, 55.0, 22.0 ],
                    "varname": "obj-dec-n"
                }
            },
            {
                "box": {
                    "id": "obj-dec-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 374.0, 2000.0, 83.0, 22.0 ],
                    "text": "env_decay $1",
                    "varname": "obj-dec-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sus-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 464.0, 1955.0, 60.0, 20.0 ],
                    "text": "sustain",
                    "varname": "obj-sus-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-sus-n",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 464.0, 1975.0, 55.0, 22.0 ],
                    "varname": "obj-sus-n"
                }
            },
            {
                "box": {
                    "id": "obj-sus-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 464.0, 2000.0, 92.0, 22.0 ],
                    "text": "env_sustain $1",
                    "varname": "obj-sus-m"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rel-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 566.0, 1955.0, 60.0, 20.0 ],
                    "text": "release",
                    "varname": "obj-rel-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-rel-n",
                    "maxclass": "flonum",
                    "maximum": 5.0,
                    "minimum": 0.001,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1975.0, 55.0, 22.0 ],
                    "varname": "obj-rel-n"
                }
            },
            {
                "box": {
                    "id": "obj-rel-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 566.0, 2000.0, 91.0, 22.0 ],
                    "text": "env_release $1",
                    "varname": "obj-rel-m"
                }
            },
            {
                "box": {
                    "id": "obj-s-adsr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 279.0, 2027.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-adsr"
                }
            },
            {
                "box": {
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 7,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 100.0, 100.0, 950.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-gin1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 15.0, 30.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gin2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 150.0, 15.0, 30.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "code": "// CHAOS RESONATOR — 5 Attractors -> 6 Waveguide Resonators\n// Lorenz, Rossler, Chua, Halvorsen, Aizawa.\n// 3 combine modes: Blend, Modulate, Route.\n// 19 African tuning systems. Arpeggiator. ADSR envelope.\n// BPM-synced arp. African rhythm patterns. Mute.\n// Scale-degree transpose. MIDI sync reset.\n// tanh() in feedback = self-limiting.\n\n// === Declarations ===\nParam sigma(10);\nParam rho(28);\nParam beta(2.667);\nParam lorenz_dt(0.0012);\nParam chaos_gain(0.05);\nParam root(55);\nParam flex(0.5);\nParam tuning_system(0);\nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam glide(0.001);\nParam reset(0);\nParam arp_mode(20);\nParam arp_rate(2);\nParam arp_bpm(120);\nParam arp_div(2);\nParam inversion(0);\nParam env_attack(0.005);\nParam env_decay(0.05);\nParam env_sustain(0.8);\nParam env_release(0.1);\nParam mute(0);\nParam transpose(0);\nParam arp_reset(0);\nParam clk_enable(0);\nParam user_pat_len(16);\nParam poly_mode(0);\nParam poly_len1(16); Param poly_len2(16); Param poly_len3(16);\nParam poly_len4(16); Param poly_len5(16); Param poly_len6(16);\nParam poly_rate1(2); Param poly_rate2(2); Param poly_rate3(2);\nParam poly_rate4(2); Param poly_rate5(2); Param poly_rate6(2);\nParam us0(63); Param us1(0); Param us2(0); Param us3(0);\nParam us4(63); Param us5(0); Param us6(0); Param us7(0);\nParam us8(63); Param us9(0); Param us10(0); Param us11(0);\nParam us12(63); Param us13(0); Param us14(0); Param us15(0);\nParam brightness(0);\nParam register(0);\nParam bass_oct(0);\nParam treble_oct(0);\nParam smooth_speed(1);\nParam sub_amt(0);\nParam sub_drive(0.0);\nParam sub_drone(0);\nParam sub_oct(-1);\nParam sub_chaos(0);\nParam eucl_pulses(3);\nParam eucl_steps(8);\nParam att_sel(0);\nParam att_b_sel(-1);\nParam combine_mode(0);\nParam blend_mix(0.5);\nParam mod_depth(0.5);\nParam root_offset(0);\nParam root_mode(0);\nParam root_return(0.5);\nParam ross_c(5.7);\nParam chua_alpha(15.6);\nParam halv_a(1.89);\nParam aiz_c(0.6);\nParam aiz_d(3.5);\nData tuning_table(190);\nData arp_pat_data(240);\nHistory init_done(0);\nHistory s_sigma(10);\nHistory s_rho(28);\nHistory s_beta(2.667);\nHistory s_dt(0.0012);\nHistory s_cg(0.03);\nHistory lx(0.1);\nHistory ly(0);\nHistory lz(0);\nHistory r1_pd(0);\nHistory r2_pd(0);\nHistory r3_pd(0);\nHistory r4_pd(0);\nHistory r5_pd(0);\nHistory r6_pd(0);\nHistory r1_sdl(0);\nHistory r2_sdl(0);\nHistory r3_sdl(0);\nHistory r4_sdl(0);\nHistory r5_sdl(0);\nHistory r6_sdl(0);\nHistory arp_phase(0);\nHistory arp_step(0);\nHistory arp_dir(1);\nHistory ps1(0); History ps2(0); History ps3(0);\nHistory ps4(0); History ps5(0); History ps6(0);\nHistory pph1(0); History pph2(0); History pph3(0);\nHistory pph4(0); History pph5(0); History pph6(0);\nHistory v_amp1(0);\nHistory v_amp2(0);\nHistory v_amp3(0);\nHistory v_amp4(0);\nHistory v_amp5(0);\nHistory v_amp6(0);\nHistory pk1(0);\nHistory pk2(0);\nHistory pk3(0);\nHistory pk4(0);\nHistory pk5(0);\nHistory pk6(0);\nHistory mute_s(0);\nHistory r_sub_pd(0);\nHistory r_sub_sdl(0);\nHistory sub_env_h(0);\nHistory rx(1); History ry(0); History rz(0);\nHistory chx(0.1); History chy(0); History chz(0);\nHistory hx(1); History hy(0); History hz(0);\nHistory aix(0.1); History aiy(0); History aiz_h(0);\nHistory bx_h(0); History by_h(0); History bz_h(0);\nHistory s_root_off(0);\nHistory prev_roff(0);\nHistory roff_idle(0);\nHistory clk_prev(0);\nHistory clk_count(0);\nHistory clk_bpm(120);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\nDelay r_sub(48000);\n\n// === INIT (tuning tables + rhythm patterns, runs once) ===\nif (init_done < 0.5) {\n    // 0: Yoruba Pentatonic (Pythagorean base, flex at runtime)\n    poke(tuning_table, 5, 0, 0);\n    poke(tuning_table, 1.0, 1, 0);\n    poke(tuning_table, 1.125, 2, 0);\n    poke(tuning_table, 1.265625, 3, 0);\n    poke(tuning_table, 1.5, 4, 0);\n    poke(tuning_table, 1.6875, 5, 0);\n    // 1: Dundun 3-Tone (0, 200, 400c)\n    poke(tuning_table, 3, 10, 0);\n    poke(tuning_table, 1.0, 11, 0);\n    poke(tuning_table, 1.12246, 12, 0);\n    poke(tuning_table, 1.25992, 13, 0);\n    // 2: Balafon Equi-Pentatonic (0, 220, 460, 690, 930c)\n    poke(tuning_table, 5, 20, 0);\n    poke(tuning_table, 1.0, 21, 0);\n    poke(tuning_table, 1.13534, 22, 0);\n    poke(tuning_table, 1.30486, 23, 0);\n    poke(tuning_table, 1.49180, 24, 0);\n    poke(tuning_table, 1.71002, 25, 0);\n    // 3: Equi-Heptatonic 7-TET\n    poke(tuning_table, 7, 30, 0);\n    poke(tuning_table, 1.0, 31, 0);\n    poke(tuning_table, 1.10409, 32, 0);\n    poke(tuning_table, 1.21901, 33, 0);\n    poke(tuning_table, 1.34590, 34, 0);\n    poke(tuning_table, 1.48599, 35, 0);\n    poke(tuning_table, 1.64059, 36, 0);\n    poke(tuning_table, 1.81145, 37, 0);\n    // 4: BaAka/Pygmy 5-TET (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 40, 0);\n    poke(tuning_table, 1.0, 41, 0);\n    poke(tuning_table, 1.14870, 42, 0);\n    poke(tuning_table, 1.31951, 43, 0);\n    poke(tuning_table, 1.51572, 44, 0);\n    poke(tuning_table, 1.74110, 45, 0);\n    // 5: Shona Nyamaropa (0, 180, 380, 500, 700, 880, 1080c)\n    poke(tuning_table, 7, 50, 0);\n    poke(tuning_table, 1.0, 51, 0);\n    poke(tuning_table, 1.10957, 52, 0);\n    poke(tuning_table, 1.24574, 53, 0);\n    poke(tuning_table, 1.33484, 54, 0);\n    poke(tuning_table, 1.49831, 55, 0);\n    poke(tuning_table, 1.65948, 56, 0);\n    poke(tuning_table, 1.86121, 57, 0);\n    // 6: Shona Gandanga (0, 100, 300, 500, 700, 800, 1000c)\n    poke(tuning_table, 7, 60, 0);\n    poke(tuning_table, 1.0, 61, 0);\n    poke(tuning_table, 1.05946, 62, 0);\n    poke(tuning_table, 1.18921, 63, 0);\n    poke(tuning_table, 1.33484, 64, 0);\n    poke(tuning_table, 1.49831, 65, 0);\n    poke(tuning_table, 1.58740, 66, 0);\n    poke(tuning_table, 1.78180, 67, 0);\n    // 7: Kora Silaba (0, 200, 385, 500, 700, 900, 1085c)\n    poke(tuning_table, 7, 70, 0);\n    poke(tuning_table, 1.0, 71, 0);\n    poke(tuning_table, 1.12246, 72, 0);\n    poke(tuning_table, 1.24915, 73, 0);\n    poke(tuning_table, 1.33484, 74, 0);\n    poke(tuning_table, 1.49831, 75, 0);\n    poke(tuning_table, 1.68179, 76, 0);\n    poke(tuning_table, 1.86459, 77, 0);\n    // 8: Kora Sauta (0, 185, 405, 605, 700, 885, 1105c)\n    poke(tuning_table, 7, 80, 0);\n    poke(tuning_table, 1.0, 81, 0);\n    poke(tuning_table, 1.11278, 82, 0);\n    poke(tuning_table, 1.26330, 83, 0);\n    poke(tuning_table, 1.41747, 84, 0);\n    poke(tuning_table, 1.49831, 85, 0);\n    poke(tuning_table, 1.66230, 86, 0);\n    poke(tuning_table, 1.88800, 87, 0);\n    // 9: Ethiopian Tizita Major (0, 200, 400, 700, 900c)\n    poke(tuning_table, 5, 90, 0);\n    poke(tuning_table, 1.0, 91, 0);\n    poke(tuning_table, 1.12246, 92, 0);\n    poke(tuning_table, 1.25992, 93, 0);\n    poke(tuning_table, 1.49831, 94, 0);\n    poke(tuning_table, 1.68179, 95, 0);\n    // 10: Ethiopian Tizita Minor (0, 200, 300, 700, 800c)\n    poke(tuning_table, 5, 100, 0);\n    poke(tuning_table, 1.0, 101, 0);\n    poke(tuning_table, 1.12246, 102, 0);\n    poke(tuning_table, 1.18921, 103, 0);\n    poke(tuning_table, 1.49831, 104, 0);\n    poke(tuning_table, 1.58740, 105, 0);\n    // 11: Ethiopian Bati (0, 200, 500, 700, 900c)\n    poke(tuning_table, 5, 110, 0);\n    poke(tuning_table, 1.0, 111, 0);\n    poke(tuning_table, 1.12246, 112, 0);\n    poke(tuning_table, 1.33484, 113, 0);\n    poke(tuning_table, 1.49831, 114, 0);\n    poke(tuning_table, 1.68179, 115, 0);\n    // 12: Ethiopian Ambassel (0, 200, 400, 700, 800c)\n    poke(tuning_table, 5, 120, 0);\n    poke(tuning_table, 1.0, 121, 0);\n    poke(tuning_table, 1.12246, 122, 0);\n    poke(tuning_table, 1.25992, 123, 0);\n    poke(tuning_table, 1.49831, 124, 0);\n    poke(tuning_table, 1.58740, 125, 0);\n    // 13: Ethiopian Anchihoye (0, 100, 500, 600, 900c)\n    poke(tuning_table, 5, 130, 0);\n    poke(tuning_table, 1.0, 131, 0);\n    poke(tuning_table, 1.05946, 132, 0);\n    poke(tuning_table, 1.33484, 133, 0);\n    poke(tuning_table, 1.41421, 134, 0);\n    poke(tuning_table, 1.68179, 135, 0);\n    // 14: Bugandan Amadinda (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 140, 0);\n    poke(tuning_table, 1.0, 141, 0);\n    poke(tuning_table, 1.14870, 142, 0);\n    poke(tuning_table, 1.31951, 143, 0);\n    poke(tuning_table, 1.51572, 144, 0);\n    poke(tuning_table, 1.74110, 145, 0);\n    // 15: Chopi Timbila (0, 175, 346, 519, 681, 854, 1025c)\n    poke(tuning_table, 7, 150, 0);\n    poke(tuning_table, 1.0, 151, 0);\n    poke(tuning_table, 1.10653, 152, 0);\n    poke(tuning_table, 1.22082, 153, 0);\n    poke(tuning_table, 1.34890, 154, 0);\n    poke(tuning_table, 1.48160, 155, 0);\n    poke(tuning_table, 1.63720, 156, 0);\n    poke(tuning_table, 1.80699, 157, 0);\n    // 16: San Musical Bow (0, 200, 386, 498, 702, 884c)\n    poke(tuning_table, 6, 160, 0);\n    poke(tuning_table, 1.0, 161, 0);\n    poke(tuning_table, 1.12246, 162, 0);\n    poke(tuning_table, 1.24984, 163, 0);\n    poke(tuning_table, 1.33322, 164, 0);\n    poke(tuning_table, 1.50000, 165, 0);\n    poke(tuning_table, 1.66212, 166, 0);\n    // 17: Wagogo Ilimba — harmonics 4-9\n    poke(tuning_table, 6, 170, 0);\n    poke(tuning_table, 1.0, 171, 0);\n    poke(tuning_table, 1.25, 172, 0);\n    poke(tuning_table, 1.5, 173, 0);\n    poke(tuning_table, 1.75, 174, 0);\n    poke(tuning_table, 2.0, 175, 0);\n    poke(tuning_table, 2.25, 176, 0);\n    // 18: Igbo Pentatonic (0, 200, 386, 702, 884c)\n    poke(tuning_table, 5, 180, 0);\n    poke(tuning_table, 1.0, 181, 0);\n    poke(tuning_table, 1.12246, 182, 0);\n    poke(tuning_table, 1.24984, 183, 0);\n    poke(tuning_table, 1.50000, 184, 0);\n    poke(tuning_table, 1.66212, 185, 0);\n\n    // === RHYTHM PATTERN DATA ===\n    // Each pattern: [length, mask0, mask1, ...] at offset = patIdx * 16\n    // Voice bitmask: v1=1, v2=2, v3=4, v4=8, v5=16, v6=32\n\n    // Pattern 0 — Polyrhythm 3:2 (arp_mode 6, offset 0)\n    poke(arp_pat_data, 6, 0, 0);\n    poke(arp_pat_data, 63, 1, 0);\n    poke(arp_pat_data, 0, 2, 0);\n    poke(arp_pat_data, 21, 3, 0);\n    poke(arp_pat_data, 42, 4, 0);\n    poke(arp_pat_data, 21, 5, 0);\n    poke(arp_pat_data, 0, 6, 0);\n\n    // Pattern 1 — Triplet (arp_mode 7, offset 16)\n    poke(arp_pat_data, 3, 16, 0);\n    poke(arp_pat_data, 3, 17, 0);\n    poke(arp_pat_data, 12, 18, 0);\n    poke(arp_pat_data, 48, 19, 0);\n\n    // Pattern 2 — Bembe 12/8 bell (arp_mode 8, offset 32)\n    poke(arp_pat_data, 12, 32, 0);\n    poke(arp_pat_data, 1, 33, 0);\n    poke(arp_pat_data, 0, 34, 0);\n    poke(arp_pat_data, 4, 35, 0);\n    poke(arp_pat_data, 0, 36, 0);\n    poke(arp_pat_data, 2, 37, 0);\n    poke(arp_pat_data, 8, 38, 0);\n    poke(arp_pat_data, 0, 39, 0);\n    poke(arp_pat_data, 16, 40, 0);\n    poke(arp_pat_data, 0, 41, 0);\n    poke(arp_pat_data, 32, 42, 0);\n    poke(arp_pat_data, 0, 43, 0);\n    poke(arp_pat_data, 4, 44, 0);\n\n    // Pattern 3 — Shiko (arp_mode 9, offset 48)\n    poke(arp_pat_data, 12, 48, 0);\n    poke(arp_pat_data, 17, 49, 0);\n    poke(arp_pat_data, 0, 50, 0);\n    poke(arp_pat_data, 0, 51, 0);\n    poke(arp_pat_data, 8, 52, 0);\n    poke(arp_pat_data, 0, 53, 0);\n    poke(arp_pat_data, 0, 54, 0);\n    poke(arp_pat_data, 6, 55, 0);\n    poke(arp_pat_data, 0, 56, 0);\n    poke(arp_pat_data, 0, 57, 0);\n    poke(arp_pat_data, 0, 58, 0);\n    poke(arp_pat_data, 32, 59, 0);\n    poke(arp_pat_data, 0, 60, 0);\n\n    // Pattern 4 — Call & Response (arp_mode 10, offset 64)\n    poke(arp_pat_data, 8, 64, 0);\n    poke(arp_pat_data, 19, 65, 0);\n    poke(arp_pat_data, 19, 66, 0);\n    poke(arp_pat_data, 0, 67, 0);\n    poke(arp_pat_data, 0, 68, 0);\n    poke(arp_pat_data, 44, 69, 0);\n    poke(arp_pat_data, 44, 70, 0);\n    poke(arp_pat_data, 0, 71, 0);\n    poke(arp_pat_data, 0, 72, 0);\n\n    // Pattern 5 — Gahu (arp_mode 11, offset 80, length 15)\n    // Ewe social dance bell: x..x..x.x..x..x (15 steps)\n    poke(arp_pat_data, 15, 80, 0);\n    poke(arp_pat_data, 17, 81, 0);   // step 0: v1+v5 bass+metallic\n    poke(arp_pat_data, 0, 82, 0);\n    poke(arp_pat_data, 0, 83, 0);\n    poke(arp_pat_data, 4, 84, 0);    // step 3: v3 mid\n    poke(arp_pat_data, 0, 85, 0);\n    poke(arp_pat_data, 0, 86, 0);\n    poke(arp_pat_data, 10, 87, 0);   // step 6: v2+v4 low-mid+mid-high\n    poke(arp_pat_data, 0, 88, 0);\n    poke(arp_pat_data, 32, 89, 0);   // step 8: v6 crystal\n    poke(arp_pat_data, 0, 90, 0);\n    poke(arp_pat_data, 0, 91, 0);\n    poke(arp_pat_data, 5, 92, 0);    // step 11: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 93, 0);\n    poke(arp_pat_data, 0, 94, 0);\n    poke(arp_pat_data, 48, 95, 0);   // step 14: v5+v6 metallic+crystal\n\n    // Pattern 6 — Son Clave 3:2 (arp_mode 12, offset 96, length 15)\n    // Foundational Afro-Cuban rhythm: x..x..x...x.x.. (15 steps)\n    poke(arp_pat_data, 15, 96, 0);\n    poke(arp_pat_data, 19, 97, 0);   // step 0: v1+v2+v5 low body\n    poke(arp_pat_data, 0, 98, 0);\n    poke(arp_pat_data, 0, 99, 0);\n    poke(arp_pat_data, 12, 100, 0);  // step 3: v3+v4 mid crack\n    poke(arp_pat_data, 0, 101, 0);\n    poke(arp_pat_data, 0, 102, 0);\n    poke(arp_pat_data, 32, 103, 0);  // step 6: v6 crystal\n    poke(arp_pat_data, 0, 104, 0);\n    poke(arp_pat_data, 0, 105, 0);\n    poke(arp_pat_data, 0, 106, 0);\n    poke(arp_pat_data, 5, 107, 0);   // step 10: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 108, 0);\n    poke(arp_pat_data, 42, 109, 0);  // step 12: v2+v4+v6 full spread\n    poke(arp_pat_data, 0, 110, 0);\n    poke(arp_pat_data, 0, 111, 0);\n\n    // Pattern 7 — Fume Fume (arp_mode 13, offset 112, length 12)\n    // Ewe ceremonial bell: x.x..x.x..x. (12 steps)\n    poke(arp_pat_data, 12, 112, 0);\n    poke(arp_pat_data, 3, 113, 0);   // step 0: v1+v2 bass pair\n    poke(arp_pat_data, 0, 114, 0);\n    poke(arp_pat_data, 24, 115, 0);  // step 2: v4+v5 mid-high pair\n    poke(arp_pat_data, 0, 116, 0);\n    poke(arp_pat_data, 0, 117, 0);\n    poke(arp_pat_data, 36, 118, 0);  // step 5: v3+v6 mid+crystal\n    poke(arp_pat_data, 0, 119, 0);\n    poke(arp_pat_data, 17, 120, 0);  // step 7: v1+v5 bass+metallic\n    poke(arp_pat_data, 0, 121, 0);\n    poke(arp_pat_data, 0, 122, 0);\n    poke(arp_pat_data, 14, 123, 0);  // step 10: v2+v3+v4 mid spread\n    poke(arp_pat_data, 0, 124, 0);\n\n    // Pattern 8 — Kassa (arp_mode 14, offset 128, length 12)\n    // Manding harvest dance: xx.x.xx.x.x. (12 steps) — dense, energetic\n    poke(arp_pat_data, 12, 128, 0);\n    poke(arp_pat_data, 17, 129, 0);  // step 0: v1+v5 bass+metallic\n    poke(arp_pat_data, 4, 130, 0);   // step 1: v3 mid\n    poke(arp_pat_data, 0, 131, 0);\n    poke(arp_pat_data, 34, 132, 0);  // step 3: v2+v6 low-mid+crystal\n    poke(arp_pat_data, 0, 133, 0);\n    poke(arp_pat_data, 8, 134, 0);   // step 5: v4 mid-high\n    poke(arp_pat_data, 5, 135, 0);   // step 6: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 136, 0);\n    poke(arp_pat_data, 48, 137, 0);  // step 8: v5+v6 metallic+crystal\n    poke(arp_pat_data, 0, 138, 0);\n    poke(arp_pat_data, 10, 139, 0);  // step 10: v2+v4 low-mid+mid-high\n    poke(arp_pat_data, 0, 140, 0);\n\n    // === LUSOPHONE / DIASPORA PATTERNS ===\n\n    // Pattern 9 — Kuduro (arp_mode 15, offset 144, length 15)\n    // Angolan: heavy kick pattern, syncopated. x..x..x.x..x..x at 140 BPM\n    poke(arp_pat_data, 15, 144, 0);\n    poke(arp_pat_data, 3, 145, 0);   // step 0: v1+v2 bass+body (kick)\n    poke(arp_pat_data, 0, 146, 0);\n    poke(arp_pat_data, 0, 147, 0);\n    poke(arp_pat_data, 3, 148, 0);   // step 3: kick\n    poke(arp_pat_data, 0, 149, 0);\n    poke(arp_pat_data, 0, 150, 0);\n    poke(arp_pat_data, 12, 151, 0);  // step 6: v3+v4 mid+transient (snare)\n    poke(arp_pat_data, 3, 152, 0);   // step 7: kick (syncopation)\n    poke(arp_pat_data, 0, 153, 0);\n    poke(arp_pat_data, 0, 154, 0);\n    poke(arp_pat_data, 3, 155, 0);   // step 10: kick\n    poke(arp_pat_data, 0, 156, 0);\n    poke(arp_pat_data, 0, 157, 0);\n    poke(arp_pat_data, 12, 158, 0);  // step 13: snare\n    poke(arp_pat_data, 3, 159, 0);   // step 14: kick (syncopation)\n\n    // Pattern 10 — Semba (arp_mode 16, offset 160, length 15)\n    // Angolan: flowing, 2-bar feel, bass-heavy with clave accent\n    poke(arp_pat_data, 15, 160, 0);\n    poke(arp_pat_data, 1, 161, 0);   // step 0: v1 bass\n    poke(arp_pat_data, 0, 162, 0);\n    poke(arp_pat_data, 0, 163, 0);\n    poke(arp_pat_data, 6, 164, 0);   // step 3: v2+v3 body+metallic\n    poke(arp_pat_data, 0, 165, 0);\n    poke(arp_pat_data, 1, 166, 0);   // step 5: v1 bass\n    poke(arp_pat_data, 0, 167, 0);\n    poke(arp_pat_data, 48, 168, 0);  // step 7: v5+v6 shimmer\n    poke(arp_pat_data, 1, 169, 0);   // step 8: v1 bass\n    poke(arp_pat_data, 0, 170, 0);\n    poke(arp_pat_data, 8, 171, 0);   // step 10: v4 transient\n    poke(arp_pat_data, 0, 172, 0);\n    poke(arp_pat_data, 6, 173, 0);   // step 12: v2+v3 body+metallic\n    poke(arp_pat_data, 0, 174, 0);\n    poke(arp_pat_data, 1, 175, 0);   // step 14: v1 bass\n\n    // Pattern 11 — Kizomba (arp_mode 17, offset 176, length 8)\n    // Angolan slow: intimate bass pulse, minimal percussion. 90 BPM.\n    poke(arp_pat_data, 8, 176, 0);\n    poke(arp_pat_data, 3, 177, 0);   // step 0: v1+v2 bass+body\n    poke(arp_pat_data, 0, 178, 0);\n    poke(arp_pat_data, 48, 179, 0);  // step 2: v5+v6 shimmer\n    poke(arp_pat_data, 0, 180, 0);\n    poke(arp_pat_data, 3, 181, 0);   // step 4: bass+body\n    poke(arp_pat_data, 0, 182, 0);\n    poke(arp_pat_data, 4, 183, 0);   // step 6: v3 metallic\n    poke(arp_pat_data, 0, 184, 0);\n\n    // Pattern 12 — Marrabenta (arp_mode 18, offset 192, length 12)\n    // Mozambican: 12/8 guitar-derived, bright and driving\n    poke(arp_pat_data, 12, 192, 0);\n    poke(arp_pat_data, 5, 193, 0);   // step 0: v1+v3 bass+metallic\n    poke(arp_pat_data, 0, 194, 0);\n    poke(arp_pat_data, 32, 195, 0);  // step 2: v6 crystal\n    poke(arp_pat_data, 2, 196, 0);   // step 3: v2 body\n    poke(arp_pat_data, 0, 197, 0);\n    poke(arp_pat_data, 16, 198, 0);  // step 5: v5 drone\n    poke(arp_pat_data, 5, 199, 0);   // step 6: v1+v3 bass+metallic\n    poke(arp_pat_data, 0, 200, 0);\n    poke(arp_pat_data, 8, 201, 0);   // step 8: v4 transient\n    poke(arp_pat_data, 2, 202, 0);   // step 9: v2 body\n    poke(arp_pat_data, 0, 203, 0);\n    poke(arp_pat_data, 48, 204, 0);  // step 11: v5+v6 shimmer\n\n    init_done = 1;\n}\n\n// === TUNING SETUP ===\nts = clamp(floor(tuning_system), 0, 18);\nts_base = ts * 10;\nts_size = max(peek(tuning_table, ts_base, 0), 1);\nj0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;\n\n// === INVERSION (-2 to +2) ===\ninv_off = floor(clamp(inversion, -2, 2));\ninv_up = (inv_off > 0.5) ? inv_off : 0;\ninv_dn = (inv_off < -0.5) ? inv_off : 0;\nreg = floor(clamp(register, -3, 3));\nboct = floor(clamp(bass_oct, -2, 2));\ntoct = floor(clamp(treble_oct, 0, 4));\n\n// === LORENZ PARAM SMOOTHING ===\n// 0=off (instant), 1=slow (~500ms), 2=medium (~50ms), 3=fast (~5ms)\nsm = floor(clamp(smooth_speed, 0, 3));\nsm_coeff = (sm < 0.5) ? 1.0 : (sm < 1.5) ? (1.0 - exp(-1.0 / (0.5 * samplerate))) : (sm < 2.5) ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (0.005 * samplerate)));\ns_sigma = s_sigma + (sigma - s_sigma) * sm_coeff;\ns_rho = s_rho + (rho - s_rho) * sm_coeff;\ns_beta = s_beta + (beta - s_beta) * sm_coeff;\ns_dt = s_dt + (lorenz_dt - s_dt) * sm_coeff;\ns_cg = s_cg + (chaos_gain - s_cg) * sm_coeff;\n\n// === CHAOS ATTRACTOR SYSTEM ===\n\n// --- LORENZ (4x unrolled Euler) ---\nrho_mod = s_rho + in1;\ntx = lx; ty = ly; tz = lz;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\nlx = (reset > 0.5) ? 0.1 : clamp(tx, -100, 100) + noise() * 0.01;\nly = (reset > 0.5) ? 0.0 : clamp(ty, -100, 100) + noise() * 0.01;\nlz = (reset > 0.5) ? 0.0 : clamp(tz, -100, 100) + noise() * 0.01;\nlor_x = lx * 0.05; lor_y = ly * 0.04; lor_z = (lz - 25) * 0.04;\n\n// --- ROSSLER (4x unrolled Euler) ---\ndt_r = 0.006;\nrtx = rx; rty = ry; rtz = rz;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrx = (reset > 0.5) ? 1.0 : clamp(rtx, -100, 100) + noise() * 0.01;\nry = (reset > 0.5) ? 0.0 : clamp(rty, -100, 100) + noise() * 0.01;\nrz = (reset > 0.5) ? 0.0 : clamp(rtz, -100, 100) + noise() * 0.01;\nros_x = rx * 0.08; ros_y = ry * 0.08; ros_z = (rz - 12) * 0.08;\n\n// --- CHUA (4x unrolled Euler) ---\ndt_c = 0.0012;\nctx = chx; cty = chy; ctz = chz;\nch_h = -0.714 * ctx + 0.5 * (-1.143 + 0.714) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -0.714 * ctx + 0.5 * (-1.143 + 0.714) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -0.714 * ctx + 0.5 * (-1.143 + 0.714) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -0.714 * ctx + 0.5 * (-1.143 + 0.714) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nchx = (reset > 0.5) ? 0.1 : clamp(ctx, -10, 10) + noise() * 0.001;\nchy = (reset > 0.5) ? 0.0 : clamp(cty, -3, 3) + noise() * 0.001;\nchz = (reset > 0.5) ? 0.0 : clamp(ctz, -20, 20) + noise() * 0.001;\nchu_x = chx * 0.4; chu_y = chy * 2.0; chu_z = chz * 0.25;\n\n// --- HALVORSEN (4x unrolled Euler) ---\ndt_h = 0.005;\nhtx = hx; hty = hy; htz = hz;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhx = (reset > 0.5) ? 1.0 : clamp(htx, -20, 20) + noise() * 0.01;\nhy = (reset > 0.5) ? 0.0 : clamp(hty, -20, 20) + noise() * 0.01;\nhz = (reset > 0.5) ? 0.0 : clamp(htz, -20, 20) + noise() * 0.01;\nhal_x = hx * 0.1; hal_y = hy * 0.1; hal_z = hz * 0.1;\n\n// --- AIZAWA (4x unrolled Euler) ---\ndt_a = 0.006;\natx = aix; aty = aiy; atz = aiz_h;\nadx = (atz - 0.7) * atx - aiz_d * aty;\nady = aiz_d * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.95 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.25 * atz) + 0.1 * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - aiz_d * aty;\nady = aiz_d * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.95 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.25 * atz) + 0.1 * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - aiz_d * aty;\nady = aiz_d * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.95 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.25 * atz) + 0.1 * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - aiz_d * aty;\nady = aiz_d * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.95 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.25 * atz) + 0.1 * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\naix = (reset > 0.5) ? 0.1 : clamp(atx, -3, 3) + noise() * 0.001;\naiy = (reset > 0.5) ? 0.0 : clamp(aty, -3, 3) + noise() * 0.001;\naiz_h = (reset > 0.5) ? 0.0 : clamp(atz, -3, 3) + noise() * 0.001;\naiz_x = aix * 0.7; aiz_y = aiy * 0.7; aiz_z = (aiz_h - 0.5) * 1.0;\n\n// --- SELECT ATTRACTOR A ---\nas = floor(clamp(att_sel, 0, 4));\nax = (as < 0.5) ? lor_x : (as < 1.5) ? ros_x : (as < 2.5) ? chu_x : (as < 3.5) ? hal_x : aiz_x;\nay = (as < 0.5) ? lor_y : (as < 1.5) ? ros_y : (as < 2.5) ? chu_y : (as < 3.5) ? hal_y : aiz_y;\naz = (as < 0.5) ? lor_z : (as < 1.5) ? ros_z : (as < 2.5) ? chu_z : (as < 3.5) ? hal_z : aiz_z;\n\n// --- SELECT ATTRACTOR B ---\nbs = floor(clamp(att_b_sel, -1, 4));\nb_active = (bs > -0.5);\nbx_raw = (bs < 0.5) ? lor_x : (bs < 1.5) ? ros_x : (bs < 2.5) ? chu_x : (bs < 3.5) ? hal_x : aiz_x;\nby_raw = (bs < 0.5) ? lor_y : (bs < 1.5) ? ros_y : (bs < 2.5) ? chu_y : (bs < 3.5) ? hal_y : aiz_y;\nbz_raw = (bs < 0.5) ? lor_z : (bs < 1.5) ? ros_z : (bs < 2.5) ? chu_z : (bs < 3.5) ? hal_z : aiz_z;\n\n// --- COMBINING MODES ---\ncm = floor(clamp(combine_mode, 0, 2));\n\n// Mode 0: BLEND — linear crossfade\nbl_x = ax * (1.0 - blend_mix) + bx_raw * blend_mix;\nbl_y = ay * (1.0 - blend_mix) + by_raw * blend_mix;\nbl_z = az * (1.0 - blend_mix) + bz_raw * blend_mix;\n\n// Mode 1: MODULATE — B shapes A (floor-limited, never zeroes)\nmod_fx = max(0.15, 1.0 + bx_h * mod_depth * 0.6);\nmod_fy = max(0.15, 1.0 + by_h * mod_depth * 0.6);\nmod_fz = max(0.15, 1.0 + bz_h * mod_depth * 0.6);\nmd_x = ax * mod_fx;\nmd_y = ay * mod_fy;\nmd_z = az * mod_fz;\nbx_h = bx_raw; by_h = by_raw; bz_h = bz_raw;\n\n// Mode 2: ROUTE — A drives voices 1-3, B drives voices 4-6 (handled at excitation)\n\n// Final combined output for voices 1-3\ncx = b_active ? ((cm < 0.5) ? bl_x : (cm < 1.5) ? md_x : ax) : ax;\ncy = b_active ? ((cm < 0.5) ? bl_y : (cm < 1.5) ? md_y : ay) : ay;\ncz = b_active ? ((cm < 0.5) ? bl_z : (cm < 1.5) ? md_z : az) : az;\n\n// Route mode: separate chaos for voices 4-6\ncx_456 = (b_active * (cm > 1.5)) ? bx_raw : cx;\ncy_456 = (b_active * (cm > 1.5)) ? by_raw : cy;\ncz_456 = (b_active * (cm > 1.5)) ? bz_raw : cz;\n\n// === ANALOG CLOCK INPUT (rising edge → BPM) ===\nclk_in = in2;\nclk_edge = (clk_in > 0.5) * (clk_prev < 0.5) * (clk_enable > 0.5);\nclk_prev = clk_in;\nclk_count = clk_edge ? 0 : clk_count + 1;\nclk_hz = clk_edge ? (samplerate / max(clk_count, 1)) : 0;\nclk_bpm = clk_edge ? clamp(clk_hz * 60.0, 20, 300) : clk_bpm;\neff_arp_bpm = (clk_enable > 0.5) ? clk_bpm : arp_bpm;\n\n// === ARPEGGIATOR (BPM sync + patterns + MIDI reset) ===\neff_rate = (arp_div > 0.01) ? (eff_arp_bpm / 60.0 * arp_div) : arp_rate;\narp_ph_new = arp_phase + eff_rate / samplerate;\narp_trig_flag = (arp_ph_new >= 1.0);\narp_phase = arp_ph_new - floor(arp_ph_new);\n\n// Pattern detection\nis_user_pat = (arp_mode > 19.5);\nis_eucl = ((arp_mode > 18.5) * (arp_mode < 19.5));\nis_pattern = (arp_mode > 5.5);\npat_idx = clamp(floor(arp_mode - 6), 0, 12);\npat_base = pat_idx * 16;\ne_steps = clamp(floor(eucl_steps), 1, 16);\npat_len = is_user_pat ? max(user_pat_len, 1) : (is_eucl ? e_steps : (is_pattern ? max(peek(arp_pat_data, pat_base, 0), 1) : 6));\n\n// Standard mode stepping\nup_s = mod(arp_step + 1, 6);\ndn_s = mod(arp_step + 5, 6);\npp_next = arp_step + arp_dir;\npp_rev_hi = (pp_next > 5);\npp_rev_lo = (pp_next < 0);\npp_new_dir = pp_rev_hi ? -1 : (pp_rev_lo ? 1 : arp_dir);\npp_s = pp_rev_hi ? 4 : (pp_rev_lo ? 1 : clamp(pp_next, 0, 5));\nrnd_s = clamp(floor(abs(noise()) * 6), 0, 5);\nstd_new_s = (arp_mode > 3.5) ? rnd_s : (arp_mode > 2.5) ? pp_s : (arp_mode > 1.5) ? dn_s : (arp_mode > 0.5) ? up_s : arp_step;\n\n// Pattern mode: sequential stepping, wraps at pat_len\npat_next_s = mod(arp_step + 1, pat_len);\n\n// Select step\nnew_s = is_pattern ? pat_next_s : std_new_s;\nnew_d = ((arp_mode > 2.5) * (arp_mode < 3.5)) ? pp_new_dir : arp_dir;\narp_step = arp_trig_flag ? new_s : arp_step;\narp_dir = arp_trig_flag ? new_d : arp_dir;\n\n// Phase reset (MIDI sync — snaps pattern to downbeat)\narp_step = (arp_reset > 0.5) ? 0 : arp_step;\narp_phase = (arp_reset > 0.5) ? 0 : arp_phase;\n\ncur = floor(arp_step);\n\n// Standard voice activation (modes 0-5)\narp_active = ((arp_mode > 0.5) * (arp_mode < 4.5));\nst1 = arp_active ? (abs(cur) < 0.5 ? 1.0 : 0.0) : 1.0;\nst2 = arp_active ? (abs(cur - 1) < 0.5 ? 1.0 : 0.0) : 1.0;\nst3 = arp_active ? (abs(cur - 2) < 0.5 ? 1.0 : 0.0) : 1.0;\nst4 = arp_active ? (abs(cur - 3) < 0.5 ? 1.0 : 0.0) : 1.0;\nst5 = arp_active ? (abs(cur - 4) < 0.5 ? 1.0 : 0.0) : 1.0;\nst6 = arp_active ? (abs(cur - 5) < 0.5 ? 1.0 : 0.0) : 1.0;\n\n// Euclidean rhythm (Bjorklund algorithm inline — threshold method)\n// A step fires if floor(k * (step+1) / n) > floor(k * step / n)\ne_pulses = clamp(floor(eucl_pulses), 0, e_steps);\ne_cur = clamp(cur, 0, e_steps - 1);\ne_hit = (floor(e_pulses * (e_cur + 1.0) / e_steps) - floor(e_pulses * e_cur / e_steps)) > 0.5;\neucl_mask = e_hit ? 63 : 0;\n\n// Polymetric: per-voice phase accumulators + independent rates\nis_poly = (poly_mode > 0.5) * is_user_pat;\nbpm_base = eff_arp_bpm / 60.0;\npph1_n = pph1 + is_poly * bpm_base * poly_rate1 / samplerate;\npt1_trig = (pph1_n >= 1.0) * is_poly;\npph1 = is_poly ? (pph1_n - floor(pph1_n)) : 0;\nps1 = pt1_trig ? mod(ps1 + 1, max(poly_len1, 1)) : ps1;\npph2_n = pph2 + is_poly * bpm_base * poly_rate2 / samplerate;\npt2_trig = (pph2_n >= 1.0) * is_poly;\npph2 = is_poly ? (pph2_n - floor(pph2_n)) : 0;\nps2 = pt2_trig ? mod(ps2 + 1, max(poly_len2, 1)) : ps2;\npph3_n = pph3 + is_poly * bpm_base * poly_rate3 / samplerate;\npt3_trig = (pph3_n >= 1.0) * is_poly;\npph3 = is_poly ? (pph3_n - floor(pph3_n)) : 0;\nps3 = pt3_trig ? mod(ps3 + 1, max(poly_len3, 1)) : ps3;\npph4_n = pph4 + is_poly * bpm_base * poly_rate4 / samplerate;\npt4_trig = (pph4_n >= 1.0) * is_poly;\npph4 = is_poly ? (pph4_n - floor(pph4_n)) : 0;\nps4 = pt4_trig ? mod(ps4 + 1, max(poly_len4, 1)) : ps4;\npph5_n = pph5 + is_poly * bpm_base * poly_rate5 / samplerate;\npt5_trig = (pph5_n >= 1.0) * is_poly;\npph5 = is_poly ? (pph5_n - floor(pph5_n)) : 0;\nps5 = pt5_trig ? mod(ps5 + 1, max(poly_len5, 1)) : ps5;\npph6_n = pph6 + is_poly * bpm_base * poly_rate6 / samplerate;\npt6_trig = (pph6_n >= 1.0) * is_poly;\npph6 = is_poly ? (pph6_n - floor(pph6_n)) : 0;\nps6 = pt6_trig ? mod(ps6 + 1, max(poly_len6, 1)) : ps6;\n// Reset poly steps on arp_reset\nps1 = (arp_reset > 0.5) ? 0 : ps1;\nps2 = (arp_reset > 0.5) ? 0 : ps2;\nps3 = (arp_reset > 0.5) ? 0 : ps3;\nps4 = (arp_reset > 0.5) ? 0 : ps4;\nps5 = (arp_reset > 0.5) ? 0 : ps5;\nps6 = (arp_reset > 0.5) ? 0 : ps6;\n\n// Bitmask lookup helper — reads usN for a given step\nucur = clamp(cur, 0, 15);\nuser_mask = (ucur<0.5)?us0:(ucur<1.5)?us1:(ucur<2.5)?us2:(ucur<3.5)?us3:(ucur<4.5)?us4:(ucur<5.5)?us5:(ucur<6.5)?us6:(ucur<7.5)?us7:(ucur<8.5)?us8:(ucur<9.5)?us9:(ucur<10.5)?us10:(ucur<11.5)?us11:(ucur<12.5)?us12:(ucur<13.5)?us13:(ucur<14.5)?us14:us15;\n\n// Per-voice poly lookups\npc1 = clamp(floor(ps1), 0, 15); pm1 = (pc1<0.5)?us0:(pc1<1.5)?us1:(pc1<2.5)?us2:(pc1<3.5)?us3:(pc1<4.5)?us4:(pc1<5.5)?us5:(pc1<6.5)?us6:(pc1<7.5)?us7:(pc1<8.5)?us8:(pc1<9.5)?us9:(pc1<10.5)?us10:(pc1<11.5)?us11:(pc1<12.5)?us12:(pc1<13.5)?us13:(pc1<14.5)?us14:us15;\npc2 = clamp(floor(ps2), 0, 15); pm2 = (pc2<0.5)?us0:(pc2<1.5)?us1:(pc2<2.5)?us2:(pc2<3.5)?us3:(pc2<4.5)?us4:(pc2<5.5)?us5:(pc2<6.5)?us6:(pc2<7.5)?us7:(pc2<8.5)?us8:(pc2<9.5)?us9:(pc2<10.5)?us10:(pc2<11.5)?us11:(pc2<12.5)?us12:(pc2<13.5)?us13:(pc2<14.5)?us14:us15;\npc3 = clamp(floor(ps3), 0, 15); pm3 = (pc3<0.5)?us0:(pc3<1.5)?us1:(pc3<2.5)?us2:(pc3<3.5)?us3:(pc3<4.5)?us4:(pc3<5.5)?us5:(pc3<6.5)?us6:(pc3<7.5)?us7:(pc3<8.5)?us8:(pc3<9.5)?us9:(pc3<10.5)?us10:(pc3<11.5)?us11:(pc3<12.5)?us12:(pc3<13.5)?us13:(pc3<14.5)?us14:us15;\npc4 = clamp(floor(ps4), 0, 15); pm4 = (pc4<0.5)?us0:(pc4<1.5)?us1:(pc4<2.5)?us2:(pc4<3.5)?us3:(pc4<4.5)?us4:(pc4<5.5)?us5:(pc4<6.5)?us6:(pc4<7.5)?us7:(pc4<8.5)?us8:(pc4<9.5)?us9:(pc4<10.5)?us10:(pc4<11.5)?us11:(pc4<12.5)?us12:(pc4<13.5)?us13:(pc4<14.5)?us14:us15;\npc5 = clamp(floor(ps5), 0, 15); pm5 = (pc5<0.5)?us0:(pc5<1.5)?us1:(pc5<2.5)?us2:(pc5<3.5)?us3:(pc5<4.5)?us4:(pc5<5.5)?us5:(pc5<6.5)?us6:(pc5<7.5)?us7:(pc5<8.5)?us8:(pc5<9.5)?us9:(pc5<10.5)?us10:(pc5<11.5)?us11:(pc5<12.5)?us12:(pc5<13.5)?us13:(pc5<14.5)?us14:us15;\npc6 = clamp(floor(ps6), 0, 15); pm6 = (pc6<0.5)?us0:(pc6<1.5)?us1:(pc6<2.5)?us2:(pc6<3.5)?us3:(pc6<4.5)?us4:(pc6<5.5)?us5:(pc6<6.5)?us6:(pc6<7.5)?us7:(pc6<8.5)?us8:(pc6<9.5)?us9:(pc6<10.5)?us10:(pc6<11.5)?us11:(pc6<12.5)?us12:(pc6<13.5)?us13:(pc6<14.5)?us14:us15;\n\n// In poly mode, each voice reads its own step; in normal, all read shared step\nmask = is_user_pat ? user_mask : (is_eucl ? eucl_mask : peek(arp_pat_data, pat_base + 1 + clamp(cur, 0, 15), 0));\nm = floor(mask);\npt1 = is_poly ? (mod(floor(pm1), 2) > 0.5) : (mod(m, 2) > 0.5);\npt2 = is_poly ? (mod(floor(pm2 / 2), 2) > 0.5) : (mod(floor(m / 2), 2) > 0.5);\npt3 = is_poly ? (mod(floor(pm3 / 4), 2) > 0.5) : (mod(floor(m / 4), 2) > 0.5);\npt4 = is_poly ? (mod(floor(pm4 / 8), 2) > 0.5) : (mod(floor(m / 8), 2) > 0.5);\npt5 = is_poly ? (mod(floor(pm5 / 16), 2) > 0.5) : (mod(floor(m / 16), 2) > 0.5);\npt6 = is_poly ? (mod(floor(pm6 / 32), 2) > 0.5) : (mod(floor(m / 32), 2) > 0.5);\n\n// Select voice activation path\nt1 = is_pattern ? pt1 : st1;\nt2 = is_pattern ? pt2 : st2;\nt3 = is_pattern ? pt3 : st3;\nt4 = is_pattern ? pt4 : st4;\nt5 = is_pattern ? pt5 : st5;\nt6 = is_pattern ? pt6 : st6;\n\n// === ADSR ENVELOPE ===\na_rate = 1.0 / max(env_attack * samplerate, 1);\nd_coeff = 1.0 - exp(-4.0 / max(env_decay * samplerate, 1));\nr_coeff = 1.0 - exp(-4.0 / max(env_release * samplerate, 1));\n\ngate1 = t1 > 0.5;\natk_ph1 = gate1 * (1.0 - pk1);\npk1 = gate1 ? min(pk1 + (v_amp1 >= 0.999), 1.0) : 0.0;\nv_amp1 = atk_ph1 ? min(v_amp1 + a_rate, 1.0) : (gate1 ? (v_amp1 + (env_sustain - v_amp1) * d_coeff) : (v_amp1 + (0.0 - v_amp1) * r_coeff));\n\ngate2 = t2 > 0.5;\natk_ph2 = gate2 * (1.0 - pk2);\npk2 = gate2 ? min(pk2 + (v_amp2 >= 0.999), 1.0) : 0.0;\nv_amp2 = atk_ph2 ? min(v_amp2 + a_rate, 1.0) : (gate2 ? (v_amp2 + (env_sustain - v_amp2) * d_coeff) : (v_amp2 + (0.0 - v_amp2) * r_coeff));\n\ngate3 = t3 > 0.5;\natk_ph3 = gate3 * (1.0 - pk3);\npk3 = gate3 ? min(pk3 + (v_amp3 >= 0.999), 1.0) : 0.0;\nv_amp3 = atk_ph3 ? min(v_amp3 + a_rate, 1.0) : (gate3 ? (v_amp3 + (env_sustain - v_amp3) * d_coeff) : (v_amp3 + (0.0 - v_amp3) * r_coeff));\n\ngate4 = t4 > 0.5;\natk_ph4 = gate4 * (1.0 - pk4);\npk4 = gate4 ? min(pk4 + (v_amp4 >= 0.999), 1.0) : 0.0;\nv_amp4 = atk_ph4 ? min(v_amp4 + a_rate, 1.0) : (gate4 ? (v_amp4 + (env_sustain - v_amp4) * d_coeff) : (v_amp4 + (0.0 - v_amp4) * r_coeff));\n\ngate5 = t5 > 0.5;\natk_ph5 = gate5 * (1.0 - pk5);\npk5 = gate5 ? min(pk5 + (v_amp5 >= 0.999), 1.0) : 0.0;\nv_amp5 = atk_ph5 ? min(v_amp5 + a_rate, 1.0) : (gate5 ? (v_amp5 + (env_sustain - v_amp5) * d_coeff) : (v_amp5 + (0.0 - v_amp5) * r_coeff));\n\ngate6 = t6 > 0.5;\natk_ph6 = gate6 * (1.0 - pk6);\npk6 = gate6 ? min(pk6 + (v_amp6 >= 0.999), 1.0) : 0.0;\nv_amp6 = atk_ph6 ? min(v_amp6 + a_rate, 1.0) : (gate6 ? (v_amp6 + (env_sustain - v_amp6) * d_coeff) : (v_amp6 + (0.0 - v_amp6) * r_coeff));\n\n// === MUTE (click-free ~5ms fade) ===\nmute_coeff = 1.0 - exp(-1.0 / (0.005 * samplerate));\nmute_s = mute_s + (mute - mute_s) * mute_coeff;\nunmute = 1.0 - mute_s;\n\n// === ROOT SPRING / LATCH SYSTEM ===\n// Detect when root_offset stops changing (user released control)\nroff_changed = abs(root_offset - prev_roff) > 0.0001;\nprev_roff = root_offset;\nroff_idle = roff_changed ? 0 : min(roff_idle + 1, samplerate);\nis_idle = roff_idle > (0.1 * samplerate);\nis_latch = (root_mode > 0.5);\ntrack_c = 1.0 - exp(-1.0 / (0.01 * samplerate));\nspring_c = 1.0 - exp(-1.0 / max(root_return * samplerate, 1));\n// Latch: always follow root_offset\n// Spring: follow while active, snap to 0 when idle\nspring_target = is_latch ? root_offset : (is_idle ? 0.0 : root_offset);\nrcoeff = is_latch ? spring_c : (is_idle ? spring_c : track_c);\ns_root_off = s_root_off + (spring_target - s_root_off) * rcoeff;\neff_root = root * pow(2.0, s_root_off / 12.0);\n\n// === Voice 1: Sub Bass (iya ilu) ===\ninv_adj1 = (oct1 < -0.5) * inv_up + (oct1 > 0.5) * inv_dn;\neff_oct1 = oct1 + inv_adj1 + reg + (oct1 < -0.5) * boct + (oct1 > 0.5) * toct;\ndeg1_eff = deg1 + transpose;\ndeg1_w = mod(floor(deg1_eff) + ts_size * 20, ts_size);\noct1_x = floor(deg1_eff / ts_size);\nr1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);\nr1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;\nr1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;\nr1_freq = eff_root * r1_rat * pow(2.0, eff_oct1 + oct1_x);\nr1_target = samplerate / max(r1_freq, 20);\nr1_sdl = (r1_sdl < 1) ? r1_target : r1_sdl + (r1_target - r1_sdl) * glide;\nexc1 = (cx * s_cg + noise() * 0.0003) * v_amp1 * unmute;\nr1_del = r1_d.read(r1_sdl);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_b = clamp(0.2 + brightness, 0, 1);\nr1_filt = r1_del * r1_b + r1_avg * (1.0 - r1_b);\nr1_out = tanh(r1_filt) * 0.9995;\nr1_d.write(exc1 + r1_out);\n\n// === SUB-BASS WAVEGUIDE (tracks voice 1 at -1 octave) ===\n// sub_drone=1: always resonates (gqom/dance bass bed)\n// sub_drone=0: follows voice 1 with 50ms attack / 2s release (pattern pulse)\nsub_tgt = (sub_drone > 0.5) ? 1.0 : v_amp1;\nsub_up = (sub_tgt > sub_env_h);\nsub_coeff = sub_up ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (2.0 * samplerate)));\nsub_env_h = sub_env_h + (sub_tgt - sub_env_h) * sub_coeff;\nsub_freq = r1_freq * pow(2.0, sub_oct);\nsub_target = samplerate / max(sub_freq, 15);\nr_sub_sdl = (r_sub_sdl < 1) ? sub_target : r_sub_sdl + (sub_target - r_sub_sdl) * glide;\n// sub_chaos: 0=normal (voice1 excitation), 1=direct chaos (dirtier, for gqom)\nexc_sub_clean = cx * s_cg * sub_env_h * unmute * 1.5;\nexc_sub_chaos = (cx * cx + cy * cy + cz * cz) * s_cg * sub_env_h * unmute * 3.0;\nexc_sub = exc_sub_clean * (1.0 - sub_chaos) + exc_sub_chaos * sub_chaos;\nsub_del = r_sub.read(r_sub_sdl);\nsub_avg = (sub_del + r_sub_pd) * 0.5;\nr_sub_pd = sub_del;\nsub_filt = sub_del * 0.1 + sub_avg * 0.9;\nsub_out = tanh(sub_filt) * 0.99995;\nr_sub.write(exc_sub + sub_out);\n\n// === Voice 2: Body (omele) ===\ninv_adj2 = (oct2 < -0.5) * inv_up + (oct2 > 0.5) * inv_dn;\neff_oct2 = oct2 + inv_adj2 + reg + (oct2 < -0.5) * boct + (oct2 > 0.5) * toct;\ndeg2_eff = deg2 + transpose;\ndeg2_w = mod(floor(deg2_eff) + ts_size * 20, ts_size);\noct2_x = floor(deg2_eff / ts_size);\nr2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);\nr2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;\nr2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;\nr2_freq = eff_root * r2_rat * pow(2.0, eff_oct2 + oct2_x);\nr2_target = samplerate / max(r2_freq, 20);\nr2_sdl = (r2_sdl < 1) ? r2_target : r2_sdl + (r2_target - r2_sdl) * glide;\nexc2 = (cy * s_cg + noise() * 0.0003) * v_amp2 * unmute;\nr2_del = r2_d.read(r2_sdl);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_b = clamp(0.4 + brightness, 0, 1);\nr2_filt = r2_del * r2_b + r2_avg * (1.0 - r2_b);\nr2_out = tanh(r2_filt) * 0.998;\nr2_d.write(exc2 + r2_out);\n\n// === Voice 3: Metallic (ogene) ===\ninv_adj3 = (oct3 < -0.5) * inv_up + (oct3 > 0.5) * inv_dn;\neff_oct3 = oct3 + inv_adj3 + reg + (oct3 < -0.5) * boct + (oct3 > 0.5) * toct;\ndeg3_eff = deg3 + transpose;\ndeg3_w = mod(floor(deg3_eff) + ts_size * 20, ts_size);\noct3_x = floor(deg3_eff / ts_size);\nr3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);\nr3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;\nr3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;\nr3_freq = eff_root * r3_rat * pow(2.0, eff_oct3 + oct3_x);\nr3_target = samplerate / max(r3_freq, 20);\nr3_sdl = (r3_sdl < 1) ? r3_target : r3_sdl + (r3_target - r3_sdl) * glide;\nexc3 = (cz * s_cg + noise() * 0.0003) * v_amp3 * unmute;\nr3_del = r3_d.read(r3_sdl);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_b = clamp(0.85 + brightness, 0, 1);\nr3_filt = r3_del * r3_b + r3_avg * (1.0 - r3_b);\nr3_out = tanh(r3_filt) * 0.9975;\nr3_d.write(exc3 + r3_out);\n\n// === Voice 4: Transient (gudugudu) ===\ninv_adj4 = (oct4 < -0.5) * inv_up + (oct4 > 0.5) * inv_dn;\neff_oct4 = oct4 + inv_adj4 + reg + (oct4 < -0.5) * boct + (oct4 > 0.5) * toct;\ndeg4_eff = deg4 + transpose;\ndeg4_w = mod(floor(deg4_eff) + ts_size * 20, ts_size);\noct4_x = floor(deg4_eff / ts_size);\nr4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);\nr4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;\nr4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;\nr4_freq = eff_root * r4_rat * pow(2.0, eff_oct4 + oct4_x);\nr4_target = samplerate / max(r4_freq, 20);\nr4_sdl = (r4_sdl < 1) ? r4_target : r4_sdl + (r4_target - r4_sdl) * glide;\nexc4 = (cx_456 * s_cg + noise() * 0.0003) * v_amp4 * unmute;\nr4_del = r4_d.read(r4_sdl);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_b = clamp(0.9 + brightness, 0, 1);\nr4_filt = r4_del * r4_b + r4_avg * (1.0 - r4_b);\nr4_out = tanh(r4_filt) * 0.993;\nr4_d.write(exc4 + r4_out);\n\n// === Voice 5: Drone ===\ninv_adj5 = (oct5 < -0.5) * inv_up + (oct5 > 0.5) * inv_dn;\neff_oct5 = oct5 + inv_adj5 + reg + (oct5 < -0.5) * boct + (oct5 > 0.5) * toct;\ndeg5_eff = deg5 + transpose;\ndeg5_w = mod(floor(deg5_eff) + ts_size * 20, ts_size);\noct5_x = floor(deg5_eff / ts_size);\nr5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);\nr5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;\nr5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;\nr5_freq = eff_root * r5_rat * pow(2.0, eff_oct5 + oct5_x);\nr5_target = samplerate / max(r5_freq, 20);\nr5_sdl = (r5_sdl < 1) ? r5_target : r5_sdl + (r5_target - r5_sdl) * glide;\nexc5 = (cy_456 * s_cg + noise() * 0.0003) * v_amp5 * unmute;\nr5_del = r5_d.read(r5_sdl);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_b = clamp(0.3 + brightness, 0, 1);\nr5_filt = r5_del * r5_b + r5_avg * (1.0 - r5_b);\nr5_out = tanh(r5_filt) * 0.9998;\nr5_d.write(exc5 + r5_out);\n\n// === Voice 6: Crystalline (shekere) ===\ninv_adj6 = (oct6 < -0.5) * inv_up + (oct6 > 0.5) * inv_dn;\neff_oct6 = oct6 + inv_adj6 + reg + (oct6 < -0.5) * boct + (oct6 > 0.5) * toct;\ndeg6_eff = deg6 + transpose;\ndeg6_w = mod(floor(deg6_eff) + ts_size * 20, ts_size);\noct6_x = floor(deg6_eff / ts_size);\nr6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);\nr6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;\nr6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;\nr6_freq = eff_root * r6_rat * pow(2.0, eff_oct6 + oct6_x);\nr6_target = samplerate / max(r6_freq, 20);\nr6_sdl = (r6_sdl < 1) ? r6_target : r6_sdl + (r6_target - r6_sdl) * glide;\nexc6 = (cz_456 * s_cg + noise() * 0.0003) * v_amp6 * unmute;\nr6_del = r6_d.read(r6_sdl);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_b = clamp(0.95 + brightness, 0, 1);\nr6_filt = r6_del * r6_b + r6_avg * (1.0 - r6_b);\nr6_out = tanh(r6_filt) * 0.9965;\nr6_d.write(exc6 + r6_out);\n\n// === STEREO MIX (with sub-bass + drive saturation) ===\nsub_g = sub_amt;\nleft = r1_out*v_amp1*0.7 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.2 + r4_out*v_amp4*0.4 + r5_out*v_amp5*0.6 + r6_out*v_amp6*0.3 + sub_out*sub_g;\nright = r1_out*v_amp1*0.3 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.8 + r4_out*v_amp4*0.6 + r5_out*v_amp5*0.4 + r6_out*v_amp6*0.7 + sub_out*sub_g;\ndrv = max(1.0 + sub_drive, 1.0);\nout1 = tanh(left * drv) * master_gain * unmute;\nout2 = tanh(right * drv) * master_gain * unmute;\n// Attractor state outputs (for visual sync — normalized chaos XYZ)\nout3 = cx * s_cg;\nout4 = cy * s_cg;\nout5 = cz * s_cg;\n\n// === STEP POSITION OUTPUT (for visual cursor) ===\nout6 = floor(arp_step);\npoly_packed = floor(ps1) + floor(ps2) * 16 + floor(ps3) * 256 + floor(ps4) * 4096 + floor(ps5) * 65536 + floor(ps6) * 1048576;\nout7 = is_poly ? poly_packed : floor(arp_step);",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-gcb",
                                    "maxclass": "codebox",
                                    "numinlets": 2,
                                    "numoutlets": 7,
                                    "outlettype": [ "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 50.0, 55.0, 800.0, 600.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 675.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 250.0, 675.0, 35.0, 22.0 ],
                                    "text": "out 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 450.0, 675.0, 35.0, 22.0 ],
                                    "text": "out 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 550.0, 675.0, 35.0, 22.0 ],
                                    "text": "out 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 650.0, 675.0, 35.0, 22.0 ],
                                    "text": "out 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 350.0, 300.0, 40.0, 22.0 ],
                                    "text": "out 6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gout7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 420.0, 300.0, 40.0, 22.0 ],
                                    "text": "out 7"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-gout1", 0 ],
                                    "source": [ "obj-gcb", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout2", 0 ],
                                    "source": [ "obj-gcb", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout3", 0 ],
                                    "source": [ "obj-gcb", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout4", 0 ],
                                    "source": [ "obj-gcb", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout5", 0 ],
                                    "source": [ "obj-gcb", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout6", 0 ],
                                    "source": [ "obj-gcb", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gout7", 0 ],
                                    "source": [ "obj-gcb", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gcb", 0 ],
                                    "source": [ "obj-gin1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gcb", 1 ],
                                    "source": [ "obj-gin2", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "patching_rect": [ 102.0, 2420.0, 200.0, 22.0 ],
                    "text": "gen~",
                    "varname": "obj-gen"
                }
            },
            {
                "box": {
                    "id": "obj-r-toGen",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 102.0, 2397.0, 52.0, 22.0 ],
                    "text": "r toGen",
                    "varname": "obj-r-toGen"
                }
            },
            {
                "box": {
                    "id": "obj-fx-boost-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 102.0, 2475.0, 60.0, 22.0 ],
                    "text": "*~ 2.",
                    "varname": "obj-fx-boost-l"
                }
            },
            {
                "box": {
                    "id": "obj-fx-tanh-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 102.0, 2502.0, 60.0, 22.0 ],
                    "text": "tanh~",
                    "varname": "obj-fx-tanh-l"
                }
            },
            {
                "box": {
                    "id": "obj-fx-boost-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 182.0, 2475.0, 60.0, 22.0 ],
                    "text": "*~ 2.",
                    "varname": "obj-fx-boost-r"
                }
            },
            {
                "box": {
                    "id": "obj-fx-tanh-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 182.0, 2502.0, 60.0, 22.0 ],
                    "text": "tanh~",
                    "varname": "obj-fx-tanh-r"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-rec-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 2475.0, 56.0, 19.0 ],
                    "text": "RECORD",
                    "varname": "obj-rec-l"
                }
            },
            {
                "box": {
                    "id": "obj-rec-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 2502.0, 22.0, 22.0 ],
                    "varname": "obj-rec-tog"
                }
            },
            {
                "box": {
                    "id": "obj-rec-open-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 350.0, 2502.0, 22.0, 22.0 ],
                    "varname": "obj-rec-open-btn"
                }
            },
            {
                "box": {
                    "id": "obj-rec-open-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 2502.0, 45.0, 22.0 ],
                    "text": "open",
                    "varname": "obj-rec-open-msg"
                }
            },
            {
                "box": {
                    "id": "obj-rec",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 320.0, 2530.0, 130.0, 22.0 ],
                    "text": "sfrecord~ 2",
                    "varname": "obj-rec"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-rev-l-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 2475.0, 54.0, 19.0 ],
                    "text": "REVERB",
                    "varname": "obj-rev-l-label"
                }
            },
            {
                "box": {
                    "id": "obj-rev-mix-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 480.0, 2502.0, 50.0, 22.0 ],
                    "text": "+~",
                    "varname": "obj-rev-mix-l"
                }
            },
            {
                "box": {
                    "id": "obj-rev-tapin-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 480.0, 2530.0, 100.0, 22.0 ],
                    "text": "tapin~ 4000",
                    "varname": "obj-rev-tapin-l"
                }
            },
            {
                "box": {
                    "id": "obj-rev-tapout-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 480.0, 2557.0, 100.0, 22.0 ],
                    "text": "tapout~ 137",
                    "varname": "obj-rev-tapout-l"
                }
            },
            {
                "box": {
                    "id": "obj-rev-fb-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 480.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.45",
                    "varname": "obj-rev-fb-l"
                }
            },
            {
                "box": {
                    "id": "obj-rev-wet-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 555.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.3",
                    "varname": "obj-rev-wet-l"
                }
            },
            {
                "box": {
                    "id": "obj-rev-mix-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 660.0, 2502.0, 50.0, 22.0 ],
                    "text": "+~",
                    "varname": "obj-rev-mix-r"
                }
            },
            {
                "box": {
                    "id": "obj-rev-tapin-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 660.0, 2530.0, 100.0, 22.0 ],
                    "text": "tapin~ 4000",
                    "varname": "obj-rev-tapin-r"
                }
            },
            {
                "box": {
                    "id": "obj-rev-tapout-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 660.0, 2557.0, 100.0, 22.0 ],
                    "text": "tapout~ 211",
                    "varname": "obj-rev-tapout-r"
                }
            },
            {
                "box": {
                    "id": "obj-rev-fb-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 660.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.45",
                    "varname": "obj-rev-fb-r"
                }
            },
            {
                "box": {
                    "id": "obj-rev-wet-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 735.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.3",
                    "varname": "obj-rev-wet-r"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-dly-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 2475.0, 50.0, 19.0 ],
                    "text": "DELAY",
                    "varname": "obj-dly-label"
                }
            },
            {
                "box": {
                    "id": "obj-dly-mix-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 820.0, 2502.0, 50.0, 22.0 ],
                    "text": "+~",
                    "varname": "obj-dly-mix-l"
                }
            },
            {
                "box": {
                    "id": "obj-dly-tapin-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 820.0, 2530.0, 100.0, 22.0 ],
                    "text": "tapin~ 4000",
                    "varname": "obj-dly-tapin-l"
                }
            },
            {
                "box": {
                    "id": "obj-dly-tapout-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 820.0, 2557.0, 100.0, 22.0 ],
                    "text": "tapout~ 250",
                    "varname": "obj-dly-tapout-l"
                }
            },
            {
                "box": {
                    "id": "obj-dly-fb-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 820.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.5",
                    "varname": "obj-dly-fb-l"
                }
            },
            {
                "box": {
                    "id": "obj-dly-wet-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 895.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.25",
                    "varname": "obj-dly-wet-l"
                }
            },
            {
                "box": {
                    "id": "obj-dly-mix-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1000.0, 2502.0, 50.0, 22.0 ],
                    "text": "+~",
                    "varname": "obj-dly-mix-r"
                }
            },
            {
                "box": {
                    "id": "obj-dly-tapin-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 1000.0, 2530.0, 100.0, 22.0 ],
                    "text": "tapin~ 4000",
                    "varname": "obj-dly-tapin-r"
                }
            },
            {
                "box": {
                    "id": "obj-dly-tapout-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1000.0, 2557.0, 100.0, 22.0 ],
                    "text": "tapout~ 333",
                    "varname": "obj-dly-tapout-r"
                }
            },
            {
                "box": {
                    "id": "obj-dly-fb-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1000.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.5",
                    "varname": "obj-dly-fb-r"
                }
            },
            {
                "box": {
                    "id": "obj-dly-wet-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1075.0, 2584.0, 60.0, 22.0 ],
                    "text": "*~ 0.25",
                    "varname": "obj-dly-wet-r"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-flt-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 2640.0, 63.0, 19.0 ],
                    "text": "FILTER LP",
                    "varname": "obj-flt-label"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flt-cutoff",
                    "maxclass": "flonum",
                    "maximum": 18000.0,
                    "minimum": 50.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 555.0, 2640.0, 60.0, 22.0 ],
                    "varname": "obj-flt-cutoff"
                }
            },
            {
                "box": {
                    "id": "obj-flt-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 480.0, 2667.0, 90.0, 22.0 ],
                    "text": "onepole~ 6000",
                    "varname": "obj-flt-l"
                }
            },
            {
                "box": {
                    "id": "obj-flt-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 2667.0, 90.0, 22.0 ],
                    "text": "onepole~ 6000",
                    "varname": "obj-flt-r"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-tap-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 770.0, 1700.0, 60.0, 19.0 ],
                    "text": "TAP",
                    "varname": "obj-tap-label"
                }
            },
            {
                "box": {
                    "id": "obj-tap-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 770.0, 1722.0, 22.0, 22.0 ],
                    "varname": "obj-tap-btn"
                }
            },
            {
                "box": {
                    "id": "obj-tap-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 770.0, 1747.0, 50.0, 22.0 ],
                    "text": "t b b",
                    "varname": "obj-tap-t"
                }
            },
            {
                "box": {
                    "id": "obj-tap-timer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "float", "" ],
                    "patching_rect": [ 770.0, 1772.0, 50.0, 22.0 ],
                    "text": "timer",
                    "varname": "obj-tap-timer"
                }
            },
            {
                "box": {
                    "id": "obj-tap-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 770.0, 1797.0, 136.0, 22.0 ],
                    "text": "expr 60000./max($f1\\, 1)",
                    "varname": "obj-tap-expr"
                }
            },
            {
                "box": {
                    "id": "obj-adc-clk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 312.0, 2397.0, 50.0, 22.0 ],
                    "text": "adc~ 3",
                    "varname": "obj-adc-clk"
                }
            },
            {
                "box": {
                    "id": "obj-clk-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 372.0, 2397.0, 20.0, 20.0 ],
                    "varname": "obj-clk-tog"
                }
            },
            {
                "box": {
                    "id": "obj-clk-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 397.0, 2397.0, 85.0, 22.0 ],
                    "text": "clk_enable $1",
                    "varname": "obj-clk-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-clk-hint",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 372.0, 2378.0, 80.0, 27.0 ],
                    "text": "ANALOG CLK\n(adc~ 3 in)",
                    "varname": "obj-clk-hint"
                }
            },
            {
                "box": {
                    "id": "obj-s-clk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 397.0, 2422.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-clk"
                }
            },
            {
                "box": {
                    "id": "obj-gain-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 102.0, 2450.0, 42.0, 22.0 ],
                    "text": "*~ 1.",
                    "varname": "obj-gain-l"
                }
            },
            {
                "box": {
                    "id": "obj-gain-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 182.0, 2450.0, 42.0, 22.0 ],
                    "text": "*~ 1.",
                    "varname": "obj-gain-r"
                }
            },
            {
                "box": {
                    "id": "obj-dac",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 102.0, 2530.0, 100.0, 22.0 ],
                    "text": "dac~",
                    "varname": "obj-dac"
                }
            },
            {
                "box": {
                    "id": "obj-scope-l",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 312.0, 2420.0, 160.0, 50.0 ],
                    "varname": "obj-scope-l"
                }
            },
            {
                "box": {
                    "id": "obj-scope-r",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 312.0, 2475.0, 160.0, 50.0 ],
                    "varname": "obj-scope-r"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 2420.0, 20.0, 20.0 ],
                    "text": "L",
                    "varname": "obj-sl"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-sr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 2475.0, 20.0, 20.0 ],
                    "text": "R",
                    "varname": "obj-sr"
                }
            },
            {
                "box": {
                    "id": "obj-meter-l",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 312.0, 2530.0, 160.0, 16.0 ],
                    "varname": "obj-meter-l"
                }
            },
            {
                "box": {
                    "id": "obj-meter-r",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 312.0, 2550.0, 160.0, 16.0 ],
                    "varname": "obj-meter-r"
                }
            },
            {
                "box": {
                    "id": "obj-chaos-sx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 502.0, 2420.0, 100.0, 22.0 ],
                    "text": "send~ chaos_x",
                    "varname": "obj-chaos-sx"
                }
            },
            {
                "box": {
                    "id": "obj-chaos-sy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 502.0, 2445.0, 100.0, 22.0 ],
                    "text": "send~ chaos_y",
                    "varname": "obj-chaos-sy"
                }
            },
            {
                "box": {
                    "id": "obj-chaos-sz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 502.0, 2470.0, 100.0, 22.0 ],
                    "text": "send~ chaos_z",
                    "varname": "obj-chaos-sz"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-chaos-hint",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 607.0, 2430.0, 100.0, 41.0 ],
                    "text": "chaos XYZ\n(receive~ in\nvisual patches)",
                    "varname": "obj-chaos-hint"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rec-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 102.0, 2565.0, 120.0, 20.0 ],
                    "text": "—— RECORD ——",
                    "varname": "obj-rec-label"
                }
            },
            {
                "box": {
                    "id": "obj-smooth-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 232.0, 2585.0, 50.0, 22.0 ],
                    "text": "sel 1 0",
                    "varname": "obj-smooth-sel"
                }
            },
            {
                "box": {
                    "id": "obj-smooth-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 232.0, 2610.0, 100.0, 22.0 ],
                    "text": "smooth_speed 1",
                    "varname": "obj-smooth-on"
                }
            },
            {
                "box": {
                    "id": "obj-smooth-off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 342.0, 2610.0, 97.0, 22.0 ],
                    "text": "smooth_speed 1",
                    "varname": "obj-smooth-off"
                }
            },
            {
                "box": {
                    "id": "obj-smooth-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 232.0, 2635.0, 55.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-smooth-send"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 102.0, 2585.0, 24.0, 24.0 ],
                    "varname": "obj-rec-tog[1]"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-rec-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 2588.0, 34.0, 20.0 ],
                    "text": "REC",
                    "varname": "obj-rec-hint"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-rec-path",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 162.0, 2588.0, 140.0, 18.0 ],
                    "text": "saves next to patch",
                    "varname": "obj-rec-path"
                }
            },
            {
                "box": {
                    "id": "obj-recorder",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 200.0, 200.0, 620.0, 360.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "r-in1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 30.0, 35.0, 22.0 ],
                                    "text": "in~ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-in2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 100.0, 30.0, 35.0, 22.0 ],
                                    "text": "in~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-in3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 250.0, 30.0, 30.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-sel",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 250.0, 65.0, 50.0, 22.0 ],
                                    "text": "sel 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-trig",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 250.0, 100.0, 33.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-counter",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "int", "", "", "int" ],
                                    "patching_rect": [ 310.0, 100.0, 52.0, 22.0 ],
                                    "text": "counter"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-sprintf",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 310.0, 135.0, 165.0, 22.0 ],
                                    "text": "sprintf chaos_rec_%03d.wav"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-prepend",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 310.0, 170.0, 78.0, 22.0 ],
                                    "text": "prepend open"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-del",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 250.0, 140.0, 52.0, 22.0 ],
                                    "text": "delay 150"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-start",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 250.0, 175.0, 22.0, 22.0 ],
                                    "text": "1"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-stop",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 420.0, 65.0, 22.0, 22.0 ],
                                    "text": "0"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-sf",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 220.0, 80.0, 22.0 ],
                                    "text": "sfrecord~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "r-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 310.0, 220.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "r-label",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 260.0, 220.0, 60.0 ],
                                    "text": "One-click record\nToggle ON = auto-name + start\nToggle OFF = stop\nFiles: chaos_rec_000.wav, 001, etc."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "r-sprintf", 0 ],
                                    "source": [ "r-counter", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-start", 0 ],
                                    "source": [ "r-del", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sf", 0 ],
                                    "source": [ "r-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sf", 1 ],
                                    "source": [ "r-in2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sel", 0 ],
                                    "source": [ "r-in3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sf", 0 ],
                                    "source": [ "r-prepend", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-stop", 0 ],
                                    "source": [ "r-sel", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-trig", 0 ],
                                    "source": [ "r-sel", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-out1", 0 ],
                                    "order": 0,
                                    "source": [ "r-sprintf", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-prepend", 0 ],
                                    "order": 1,
                                    "source": [ "r-sprintf", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sf", 0 ],
                                    "source": [ "r-start", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-sf", 0 ],
                                    "source": [ "r-stop", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-counter", 0 ],
                                    "source": [ "r-trig", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "r-del", 0 ],
                                    "source": [ "r-trig", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "patching_rect": [ 102.0, 2615.0, 72.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.65, 0.65, 0.65, 1.0 ]
                    },
                    "text": "p recorder",
                    "varname": "obj-recorder"
                }
            },
            {
                "box": {
                    "id": "obj-rec-name",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 182.0, 2615.0, 200.0, 22.0 ],
                    "varname": "obj-rec-name"
                }
            },
            {
                "box": {
                    "id": "obj-render-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 102.0, 2645.0, 24.0, 24.0 ],
                    "varname": "obj-render-btn"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-render-hint",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 2648.0, 107.0, 20.0 ],
                    "text": "RENDER 8 BARS",
                    "varname": "obj-render-hint"
                }
            },
            {
                "box": {
                    "id": "obj-render-p",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
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
                        "rect": [ 0.0, 0.0, 400.0, 300.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "bang to render",
                                    "id": "rn-in1",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "BPM",
                                    "id": "rn-in2",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-f",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 60.0, 60.0, 22.0 ],
                                    "text": "float 120"
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-expr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 90.0, 230.0, 22.0 ],
                                    "text": "expr 8. * 4. * 60000. / max($f1\\, 20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-t",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "float" ],
                                    "patching_rect": [ 30.0, 120.0, 60.0, 22.0 ],
                                    "text": "t b f"
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-one",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 150.0, 30.0, 22.0 ],
                                    "text": "i 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-del",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 150.0, 80.0, 22.0 ],
                                    "text": "delay 16000"
                                }
                            },
                            {
                                "box": {
                                    "id": "rn-zero",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 100.0, 180.0, 30.0, 22.0 ],
                                    "text": "i 0"
                                }
                            },
                            {
                                "box": {
                                    "comment": "to rec toggle",
                                    "id": "rn-out",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 60.0, 220.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "rn-zero", 0 ],
                                    "source": [ "rn-del", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-t", 0 ],
                                    "source": [ "rn-expr", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-expr", 0 ],
                                    "source": [ "rn-f", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-f", 0 ],
                                    "source": [ "rn-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-f", 1 ],
                                    "source": [ "rn-in2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-out", 0 ],
                                    "source": [ "rn-one", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-del", 0 ],
                                    "source": [ "rn-t", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-one", 0 ],
                                    "source": [ "rn-t", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rn-out", 0 ],
                                    "source": [ "rn-zero", 0 ]
                                }
                            }
                        ],
                        "editing_bgcolor": [ 0.9, 0.9, 0.9, 1.0 ]
                    },
                    "patching_rect": [ 102.0, 2675.0, 95.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.9, 0.9, 0.9, 1.0 ]
                    },
                    "text": "p render_8bars",
                    "varname": "obj-render-p"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-cp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 353.0, 200.0, 20.0 ],
                    "text": "—— CHORD PRESETS ——",
                    "varname": "obj-cp-label"
                }
            },
            {
                "box": {
                    "id": "obj-cp1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 375.0, 600.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 1204.0, 388.0, 214.0, 50.0 ],
                    "text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1",
                    "varname": "obj-cp1"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-cp1-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 375.0, 250.0, 20.0 ],
                    "text": "Yoruba Spread",
                    "varname": "obj-cp1-l"
                }
            },
            {
                "box": {
                    "id": "obj-cp2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 399.0, 600.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 1204.0, 445.0, 214.0, 50.0 ],
                    "text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1",
                    "varname": "obj-cp2"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-cp2-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 399.0, 250.0, 20.0 ],
                    "text": "Root Cluster",
                    "varname": "obj-cp2-l"
                }
            },
            {
                "box": {
                    "id": "obj-cp3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 423.0, 600.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 1204.0, 508.0, 214.0, 50.0 ],
                    "text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1",
                    "varname": "obj-cp3"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-cp3-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 423.0, 250.0, 20.0 ],
                    "text": "Open Fifths",
                    "varname": "obj-cp3-l"
                }
            },
            {
                "box": {
                    "id": "obj-cp4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 447.0, 600.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 1204.0, 572.0, 214.0, 50.0 ],
                    "text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1",
                    "varname": "obj-cp4"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-cp4-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 447.0, 250.0, 20.0 ],
                    "text": "Sub Drone",
                    "varname": "obj-cp4-l"
                }
            },
            {
                "box": {
                    "id": "obj-cp-label-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 471.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-cp-label-send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-dr-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 499.0, 200.0, 20.0 ],
                    "text": "—— DRONE PRESETS ——",
                    "varname": "obj-dr-label"
                }
            },
            {
                "box": {
                    "id": "obj-dr1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 521.0, 600.0, 22.0 ],
                    "text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
                    "varname": "obj-dr1"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-dr1-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 521.0, 250.0, 20.0 ],
                    "text": "Root Drone",
                    "varname": "obj-dr1-l"
                }
            },
            {
                "box": {
                    "id": "obj-dr2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 545.0, 600.0, 22.0 ],
                    "text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
                    "varname": "obj-dr2"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-dr2-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1457.0, 545.0, 250.0, 20.0 ],
                    "text": "Fifth Drone",
                    "varname": "obj-dr2-l"
                }
            },
            {
                "box": {
                    "id": "obj-dr-label-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 569.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-dr-label-send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-ac-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 597.0, 200.0, 20.0 ],
                    "text": "—— ATTRACTOR COMBOS ——",
                    "varname": "obj-ac-label"
                }
            },
            {
                "box": {
                    "id": "obj-ac1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 619.0, 171.0, 22.0 ],
                    "text": "att_sel 0, att_b_sel -1",
                    "varname": "obj-ac1"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac1-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1028.0, 619.0, 250.0, 20.0 ],
                    "text": "Lorenz Solo (default)",
                    "varname": "obj-ac1-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 643.0, 255.0, 22.0 ],
                    "text": "att_sel 1, att_b_sel -1, ross_c 5.7",
                    "varname": "obj-ac2"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac2-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1112.0, 643.0, 250.0, 20.0 ],
                    "text": "Rossler Solo",
                    "varname": "obj-ac2-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 667.0, 290.0, 22.0 ],
                    "text": "att_sel 2, att_b_sel -1, chua_alpha 15.6",
                    "varname": "obj-ac3"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac3-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1147.0, 667.0, 250.0, 20.0 ],
                    "text": "Chua Solo",
                    "varname": "obj-ac3-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 691.0, 262.0, 22.0 ],
                    "text": "att_sel 3, att_b_sel -1, halv_a 1.89",
                    "varname": "obj-ac4"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac4-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1119.0, 691.0, 250.0, 20.0 ],
                    "text": "Halvorsen Solo",
                    "varname": "obj-ac4-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 715.0, 325.0, 22.0 ],
                    "text": "att_sel 4, att_b_sel -1, aiz_c 0.6, aiz_d 3.5",
                    "varname": "obj-ac5"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac5-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1182.0, 715.0, 250.0, 20.0 ],
                    "text": "Aizawa Solo",
                    "varname": "obj-ac5-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 739.0, 381.0, 22.0 ],
                    "text": "att_sel 0, att_b_sel 1, combine_mode 0, blend_mix 0.5",
                    "varname": "obj-ac6"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac6-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1238.0, 739.0, 250.0, 20.0 ],
                    "text": "Lorenz+Rossler Blend",
                    "varname": "obj-ac6-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 763.0, 381.0, 22.0 ],
                    "text": "att_sel 0, att_b_sel 2, combine_mode 1, mod_depth 0.3",
                    "varname": "obj-ac7"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac7-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1238.0, 763.0, 250.0, 20.0 ],
                    "text": "Lorenz×Chua Modulate",
                    "varname": "obj-ac7-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 787.0, 276.0, 22.0 ],
                    "text": "att_sel 0, att_b_sel 3, combine_mode 2",
                    "varname": "obj-ac8"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac8-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1133.0, 787.0, 250.0, 20.0 ],
                    "text": "Lorenz|Halvorsen Route",
                    "varname": "obj-ac8-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 811.0, 381.0, 22.0 ],
                    "text": "att_sel 1, att_b_sel 4, combine_mode 1, mod_depth 0.7",
                    "varname": "obj-ac9"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac9-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1238.0, 811.0, 250.0, 20.0 ],
                    "text": "Rossler×Aizawa Modulate",
                    "varname": "obj-ac9-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 835.0, 381.0, 22.0 ],
                    "text": "att_sel 3, att_b_sel 4, combine_mode 0, blend_mix 0.3",
                    "varname": "obj-ac10"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-ac10-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1238.0, 835.0, 250.0, 20.0 ],
                    "text": "Halvorsen+Aizawa Blend",
                    "varname": "obj-ac10-l"
                }
            },
            {
                "box": {
                    "id": "obj-ac-label-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 859.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-ac-label-send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-pres-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2.0, 35.0, 200.0, 25.0 ],
                    "text": "CHAOS RESONATOR",
                    "varname": "obj-pres-title"
                }
            },
            {
                "box": {
                    "id": "obj-send-fbL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 312.0, 2485.0, 107.0, 22.0 ],
                    "text": "send~ feedback_L",
                    "varname": "obj-send-fbL"
                }
            },
            {
                "box": {
                    "id": "obj-send-fbR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 427.0, 2485.0, 109.0, 22.0 ],
                    "text": "send~ feedback_R",
                    "varname": "obj-send-fbR"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-osc-comment",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 702.0, 2335.0, 250.0, 34.0 ],
                    "text": "OSC OUTPUT to TouchDesigner\nport 7000 — toggle to enable",
                    "varname": "obj-osc-comment"
                }
            },
            {
                "box": {
                    "id": "obj-osc-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.0, 2375.0, 24.0, 24.0 ],
                    "varname": "obj-osc-toggle"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-osc-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 732.0, 2378.0, 35.0, 20.0 ],
                    "text": "OSC",
                    "varname": "obj-osc-label"
                }
            },
            {
                "box": {
                    "id": "obj-osc-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 702.0, 2415.0, 56.0, 22.0 ],
                    "text": "metro 33",
                    "varname": "obj-osc-metro"
                }
            },
            {
                "box": {
                    "id": "obj-osc-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 702.0, 2440.0, 120.0, 22.0 ],
                    "text": "t b b b b",
                    "varname": "obj-osc-trig"
                }
            },
            {
                "box": {
                    "id": "obj-osc-rcv-x",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 702.0, 2465.0, 102.0, 22.0 ],
                    "text": "receive~ chaos_x",
                    "varname": "obj-osc-rcv-x"
                }
            },
            {
                "box": {
                    "id": "obj-osc-rcv-y",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 822.0, 2465.0, 102.0, 22.0 ],
                    "text": "receive~ chaos_y",
                    "varname": "obj-osc-rcv-y"
                }
            },
            {
                "box": {
                    "id": "obj-osc-rcv-z",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 942.0, 2465.0, 102.0, 22.0 ],
                    "text": "receive~ chaos_z",
                    "varname": "obj-osc-rcv-z"
                }
            },
            {
                "box": {
                    "id": "obj-osc-rcv-L",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1062.0, 2465.0, 120.0, 22.0 ],
                    "text": "receive~ feedback_L",
                    "varname": "obj-osc-rcv-L"
                }
            },
            {
                "box": {
                    "id": "obj-osc-snap-x",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 702.0, 2495.0, 64.0, 22.0 ],
                    "text": "snapshot~",
                    "varname": "obj-osc-snap-x"
                }
            },
            {
                "box": {
                    "id": "obj-osc-snap-y",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 822.0, 2495.0, 64.0, 22.0 ],
                    "text": "snapshot~",
                    "varname": "obj-osc-snap-y"
                }
            },
            {
                "box": {
                    "id": "obj-osc-snap-z",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 942.0, 2495.0, 64.0, 22.0 ],
                    "text": "snapshot~",
                    "varname": "obj-osc-snap-z"
                }
            },
            {
                "box": {
                    "id": "obj-osc-snap-L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1062.0, 2495.0, 64.0, 22.0 ],
                    "text": "snapshot~",
                    "varname": "obj-osc-snap-L"
                }
            },
            {
                "box": {
                    "id": "obj-osc-udp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 802.0, 2565.0, 145.0, 22.0 ],
                    "text": "udpsend localhost 7000",
                    "varname": "obj-osc-udp"
                }
            },
            {
                "box": {
                    "id": "obj-osc-pre-x",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 702.0, 2525.0, 90.0, 22.0 ],
                    "text": "prepend /x",
                    "varname": "obj-osc-pre-x"
                }
            },
            {
                "box": {
                    "id": "obj-osc-pre-y",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 822.0, 2525.0, 90.0, 22.0 ],
                    "text": "prepend /y",
                    "varname": "obj-osc-pre-y"
                }
            },
            {
                "box": {
                    "id": "obj-osc-pre-z",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 942.0, 2525.0, 90.0, 22.0 ],
                    "text": "prepend /z",
                    "varname": "obj-osc-pre-z"
                }
            },
            {
                "box": {
                    "id": "obj-osc-pre-rms",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1062.0, 2525.0, 107.0, 22.0 ],
                    "text": "prepend /loudness",
                    "varname": "obj-osc-pre-rms"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "maxmcpid-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1752.0, 50.0, 200.0, 23.0 ],
                    "text": "MCP BRIDGE",
                    "textcolor": [ 0.2, 0.8, 0.4, 1.0 ],
                    "varname": "maxmcpid-title"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1752.0, 80.0, 195.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 0,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script max_mcp_node.js",
                    "textfile": {
                        "filename": "max_mcp_node.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "maxmcpid-node"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1752.0, 110.0, 200.0, 22.0 ],
                    "text": "route command request port",
                    "varname": "maxmcpid-route"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-handler",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1752.0, 145.0, 130.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "max_mcp.js",
                        "parameter_enable": 0
                    },
                    "text": "js max_mcp.js",
                    "varname": "maxmcpid-handler"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-v8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1892.0, 145.0, 180.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "max_mcp_v8_add_on.js",
                        "parameter_enable": 0
                    },
                    "text": "js max_mcp_v8_add_on.js",
                    "varname": "maxmcpid-v8"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1752.0, 175.0, 320.0, 22.0 ],
                    "text": "\"Server listening on port 5002\"",
                    "varname": "maxmcpid-status"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1752.0, 205.0, 80.0, 22.0 ],
                    "text": "script start",
                    "varname": "maxmcpid-start"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1842.0, 205.0, 75.0, 22.0 ],
                    "text": "script stop",
                    "varname": "maxmcpid-stop"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-auto-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1927.0, 190.0, 70.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "maxmcpid-auto-lb"
                }
            },
            {
                "box": {
                    "id": "maxmcpid-auto-dly",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1927.0, 215.0, 75.0, 22.0 ],
                    "text": "delay 1000",
                    "varname": "maxmcpid-auto-dly"
                }
            },
            {
                "box": {
                    "id": "obj-grid-js",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 188.0, 1780.0, 130.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "grid_bitmask.js",
                        "parameter_enable": 0
                    },
                    "text": "js grid_bitmask.js",
                    "varname": "obj-grid-js"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-rate-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1560.0, 100.0, 19.0 ],
                    "text": "MASTER RATE",
                    "varname": "obj-rate-label"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-grid-bpm-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1722.0, 35.0, 18.0 ],
                    "text": "BPM",
                    "varname": "obj-grid-bpm-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-grid-bpm-n",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 707.0, 1722.0, 50.0, 22.0 ],
                    "varname": "obj-grid-bpm-n"
                }
            },
            {
                "box": {
                    "id": "obj-grid-bpm-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 1722.0, 73.0, 22.0 ],
                    "text": "arp_bpm $1",
                    "varname": "obj-grid-bpm-m"
                }
            },
            {
                "box": {
                    "id": "obj-s-gridbpm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 1746.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-gridbpm"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-spread-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1878.0, 130.0, 19.0 ],
                    "text": "VOICE SPREAD",
                    "varname": "obj-spread-label"
                }
            },
            {
                "box": {
                    "id": "obj-spread-wide",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1037.0, 1955.0, 245.0, 50.0 ],
                    "text": "deg1 0, deg2 1, deg3 2, deg4 3, deg5 4, deg6 0, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 2",
                    "varname": "obj-spread-wide"
                }
            },
            {
                "box": {
                    "id": "obj-spread-med",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1036.0, 2027.0, 247.0, 50.0 ],
                    "text": "deg1 0, deg2 2, deg3 4, deg4 0, deg5 2, deg6 4, oct1 -1, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 0",
                    "varname": "obj-spread-med"
                }
            },
            {
                "box": {
                    "id": "obj-spread-tight",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1037.0, 2101.0, 245.0, 50.0 ],
                    "text": "deg1 0, deg2 1, deg3 2, deg4 3, deg5 4, deg6 0, oct1 -1, oct2 -1, oct3 0, oct4 0, oct5 0, oct6 1",
                    "varname": "obj-spread-tight"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-spread-wide-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1286.0, 1971.0, 50.0, 18.0 ],
                    "text": "WIDE",
                    "varname": "obj-spread-wide-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-spread-med-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1287.0, 2043.0, 50.0, 18.0 ],
                    "text": "MED",
                    "varname": "obj-spread-med-l"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-spread-tight-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1292.0, 2117.0, 50.0, 18.0 ],
                    "text": "TIGHT",
                    "varname": "obj-spread-tight-l"
                }
            },
            {
                "box": {
                    "id": "obj-s-spread",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 777.0, 1823.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-spread"
                }
            },
            {
                "box": {
                    "id": "obj-seq-btn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.0, 1908.0, 80.0, 22.0 ],
                    "text": "arp_mode 20",
                    "varname": "obj-seq-btn"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-seq-btn-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 188.0, 1728.0, 40.0, 19.0 ],
                    "text": "SEQ",
                    "textcolor": [ 0.2, 0.8, 0.3, 1.0 ],
                    "varname": "obj-seq-btn-l"
                }
            },
            {
                "box": {
                    "id": "obj-drone-btn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 369.0, 1908.0, 75.0, 22.0 ],
                    "text": "arp_mode 0",
                    "varname": "obj-drone-btn"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-drone-btn-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 275.0, 1728.0, 50.0, 19.0 ],
                    "text": "DRONE",
                    "textcolor": [ 0.8, 0.4, 0.2, 1.0 ],
                    "varname": "obj-drone-btn-l"
                }
            },
            {
                "box": {
                    "id": "obj-s-mode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 319.0, 1934.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-mode"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-poly-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1772.0, 85.0, 19.0 ],
                    "text": "POLYMETRIC",
                    "textcolor": [ 0.9, 0.6, 0.1, 1.0 ],
                    "varname": "obj-poly-label"
                }
            },
            {
                "box": {
                    "id": "obj-poly-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 757.0, 1772.0, 24.0, 24.0 ],
                    "varname": "obj-poly-tog"
                }
            },
            {
                "box": {
                    "id": "obj-poly-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 784.0, 1772.0, 84.0, 22.0 ],
                    "text": "poly_mode $1",
                    "varname": "obj-poly-msg"
                }
            },
            {
                "box": {
                    "id": "obj-s-poly",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 784.0, 1796.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-poly"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-plen-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1798.0, 230.0, 17.0 ],
                    "text": "v1  v2  v3  v4  v5  v6",
                    "varname": "obj-plen-label"
                }
            },
            {
                "box": {
                    "id": "obj-plen-1",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-1"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len1 $1",
                    "varname": "obj-plen-m-1"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-1"
                }
            },
            {
                "box": {
                    "id": "obj-plen-2",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 708.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-2"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 708.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len2 $1",
                    "varname": "obj-plen-m-2"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 708.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-2"
                }
            },
            {
                "box": {
                    "id": "obj-plen-3",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 746.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-3"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 746.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len3 $1",
                    "varname": "obj-plen-m-3"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 746.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-3"
                }
            },
            {
                "box": {
                    "id": "obj-plen-4",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 784.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-4"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 784.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len4 $1",
                    "varname": "obj-plen-m-4"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 784.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-4"
                }
            },
            {
                "box": {
                    "id": "obj-plen-5",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 822.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-5"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 822.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len5 $1",
                    "varname": "obj-plen-m-5"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 822.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-5"
                }
            },
            {
                "box": {
                    "id": "obj-plen-6",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 860.0, 1816.0, 35.0, 22.0 ],
                    "varname": "obj-plen-6"
                }
            },
            {
                "box": {
                    "id": "obj-plen-m-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 860.0, 1840.0, 80.0, 22.0 ],
                    "text": "poly_len6 $1",
                    "varname": "obj-plen-m-6"
                }
            },
            {
                "box": {
                    "id": "obj-s-plen-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 860.0, 1864.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-plen-6"
                }
            },
            {
                "box": {
                    "id": "obj-plen-pack",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 1890.0, 134.0, 22.0 ],
                    "text": "pack 16 16 16 16 16 16",
                    "varname": "obj-plen-pack"
                }
            },
            {
                "box": {
                    "id": "obj-rate-umenu",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 1580.0, 80.0, 22.0 ],
                    "varname": "obj-rate-umenu"
                }
            },
            {
                "box": {
                    "id": "obj-rate-str",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 1606.0, 38.0, 22.0 ],
                    "text": "0",
                    "varname": "obj-rate-str"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-rate-str-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1628.0, 38.0, 17.0 ],
                    "text": "STR",
                    "varname": "obj-rate-str-l"
                }
            },
            {
                "box": {
                    "id": "obj-rate-trp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 712.0, 1606.0, 38.0, 22.0 ],
                    "text": "1",
                    "varname": "obj-rate-trp"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-rate-trp-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 712.0, 1628.0, 38.0, 17.0 ],
                    "text": "TRP",
                    "varname": "obj-rate-trp-l"
                }
            },
            {
                "box": {
                    "id": "obj-rate-dot",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 754.0, 1606.0, 38.0, 22.0 ],
                    "text": "2",
                    "varname": "obj-rate-dot"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-rate-dot-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 754.0, 1628.0, 38.0, 17.0 ],
                    "text": "DOT",
                    "varname": "obj-rate-dot-l"
                }
            },
            {
                "box": {
                    "id": "obj-rate-js",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 1648.0, 110.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "rate_select.js",
                        "parameter_enable": 0
                    },
                    "text": "js rate_select.js",
                    "varname": "obj-rate-js"
                }
            },
            {
                "box": {
                    "id": "obj-rate-pre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 1672.0, 95.0, 22.0 ],
                    "text": "prepend arp_div",
                    "varname": "obj-rate-pre"
                }
            },
            {
                "box": {
                    "id": "obj-s-rate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1696.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-rate"
                }
            },
            {
                "box": {
                    "id": "obj-rate-lb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 755.0, 1560.0, 22.0, 22.0 ],
                    "text": "3",
                    "varname": "obj-rate-lb"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-1",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1600.0, 50.0, 20.0 ],
                    "textcolor": [ 0.2, 0.9, 0.3, 1.0 ],
                    "varname": "obj-vn-1"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-1",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1600.0, 28.0, 19.0 ],
                    "varname": "obj-vm-1"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-2",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1620.0, 50.0, 20.0 ],
                    "textcolor": [ 0.3, 0.7, 1.0, 1.0 ],
                    "varname": "obj-vn-2"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-2",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1620.0, 28.0, 19.0 ],
                    "varname": "obj-vm-2"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-3",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1640.0, 50.0, 20.0 ],
                    "textcolor": [ 1.0, 0.6, 0.1, 1.0 ],
                    "varname": "obj-vn-3"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-3",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1640.0, 28.0, 19.0 ],
                    "varname": "obj-vm-3"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-4",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1660.0, 50.0, 20.0 ],
                    "textcolor": [ 1.0, 0.3, 0.5, 1.0 ],
                    "varname": "obj-vn-4"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-4",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1660.0, 28.0, 19.0 ],
                    "varname": "obj-vm-4"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-5",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1680.0, 50.0, 20.0 ],
                    "textcolor": [ 0.8, 0.5, 1.0, 1.0 ],
                    "varname": "obj-vn-5"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-5",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1680.0, 28.0, 19.0 ],
                    "varname": "obj-vm-5"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-vn-6",
                    "items": [ "1/1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16", ",", "1/32", ",", "1/64" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 513.0, 1700.0, 50.0, 20.0 ],
                    "textcolor": [ 1.0, 1.0, 0.3, 1.0 ],
                    "varname": "obj-vn-6"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-vm-6",
                    "items": [ "S", ",", "T", ",", "D" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1700.0, 28.0, 19.0 ],
                    "varname": "obj-vm-6"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-lr-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 513.0, 1582.0, 50.0, 18.0 ],
                    "text": "RATE",
                    "varname": "obj-lr-label"
                }
            },
            {
                "box": {
                    "id": "obj-link-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 566.0, 1581.0, 16.0, 16.0 ],
                    "varname": "obj-link-tog"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-link-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 584.0, 1582.0, 40.0, 17.0 ],
                    "text": "LINK",
                    "varname": "obj-link-label"
                }
            },
            {
                "box": {
                    "id": "obj-lr-js",
                    "maxclass": "newobj",
                    "numinlets": 14,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 513.0, 1730.0, 200.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "lane_rate.js",
                        "parameter_enable": 0
                    },
                    "text": "js lane_rate.js",
                    "varname": "obj-lr-js"
                }
            },
            {
                "box": {
                    "id": "obj-s-lr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 513.0, 1755.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-s-lr"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-lr-def-n",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 653.0, 1582.0, 18.0, 19.0 ],
                    "text": "3",
                    "varname": "obj-lr-def-n"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-lr-def-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 673.0, 1582.0, 18.0, 19.0 ],
                    "text": "0",
                    "varname": "obj-lr-def-m"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-lr-def-link",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 693.0, 1582.0, 18.0, 19.0 ],
                    "text": "1",
                    "varname": "obj-lr-def-link"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-pm-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 50.0, 200.0, 20.0 ],
                    "text": "—— PRESETS ——",
                    "varname": "obj-pm-header"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-tuning-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 77.0, 90.0, 19.0 ],
                    "text": "Tuning",
                    "varname": "obj-pm-tuning-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-tuning",
                    "items": [ "Yoruba Pentatonic", ",", "Dundun 3-Tone", ",", "Balafon Equi-Penta", ",", "Equi-Heptatonic 7-TET", ",", "BaAka/Pygmy 5-TET", ",", "Shona Nyamaropa", ",", "Shona Gandanga", ",", "Kora Silaba", ",", "Kora Sauta", ",", "Tizita Major", ",", "Tizita Minor", ",", "Bati", ",", "Ambassel", ",", "Anchihoye", ",", "Amadinda", ",", "Chopi Timbila", ",", "San Musical Bow", ",", "Wagogo Ilimba", ",", "Igbo Pentatonic" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 75.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 456.0, 200.0, 22.0 ],
                    "varname": "obj-pm-tuning"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-pattern-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 102.0, 90.0, 19.0 ],
                    "text": "Pattern",
                    "varname": "obj-pm-pattern-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-pattern",
                    "items": [ "Bembe 12/8", ",", "Shiko", ",", "Poly 3:2", ",", "Call/Response", ",", "Gahu 15-step", ",", "Son Clave 3:2", ",", "Fume Fume", ",", "Kassa", ",", "Kuduro", ",", "Semba", ",", "Kizomba", ",", "Marrabenta" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 100.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 426.0, 200.0, 22.0 ],
                    "varname": "obj-pm-pattern"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-rho-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 127.0, 90.0, 19.0 ],
                    "text": "Rho",
                    "varname": "obj-pm-rho-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-rho",
                    "items": [ "Converging (20)", ",", "Edge (24.74)", ",", "Classic (28)", ",", "Periodic (100)", ",", "Stable (166)", ",", "Bursts (50)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 125.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 325.0, 193.0, 288.0, 22.0 ],
                    "varname": "obj-pm-rho"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-roots-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 152.0, 90.0, 19.0 ],
                    "text": "Root",
                    "varname": "obj-pm-roots-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-roots",
                    "items": [ "Dundun Low (61)", ",", "Iya Ilu (82)", ",", "Dundun Mid (125)", ",", "Dundun High (172)", ",", "Balafon (220)", ",", "Agogo (350)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 150.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 736.0, 531.0, 131.0, 22.0 ],
                    "varname": "obj-pm-roots"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-adsr-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 177.0, 90.0, 19.0 ],
                    "text": "ADSR",
                    "varname": "obj-pm-adsr-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-adsr",
                    "items": [ "Pluck", ",", "Pad", ",", "Swell", ",", "Staccato", ",", "Default" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 175.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 295.0, 522.0, 160.0, 22.0 ],
                    "varname": "obj-pm-adsr"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-chaos-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 202.0, 90.0, 19.0 ],
                    "text": "Chaos",
                    "varname": "obj-pm-chaos-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-chaos",
                    "items": [ "Whisper (0.002)", ",", "Gentle (0.005)", ",", "Balanced (0.01)", ",", "Aggressive (0.03)", ",", "Full (0.1)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 200.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 295.0, 555.0, 160.0, 22.0 ],
                    "varname": "obj-pm-chaos"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-spring-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 227.0, 90.0, 19.0 ],
                    "text": "Spring",
                    "varname": "obj-pm-spring-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-spring",
                    "items": [ "Tight", ",", "Elastic", ",", "Slow", ",", "Latch" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 225.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 736.0, 581.0, 131.0, 22.0 ],
                    "varname": "obj-pm-spring"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-pm-glide-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 852.0, 252.0, 90.0, 19.0 ],
                    "text": "Glide",
                    "varname": "obj-pm-glide-l"
                }
            },
            {
                "box": {
                    "id": "obj-pm-glide",
                    "items": [ "Slow (porta)", ",", "Default", ",", "Fast (snap)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 250.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 295.0, 588.0, 160.0, 22.0 ],
                    "varname": "obj-pm-glide"
                }
            },
            {
                "box": {
                    "id": "obj-pm-js",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 945.0, 285.0, 200.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "preset_menu.js",
                        "parameter_enable": 0
                    },
                    "text": "js preset_menu.js",
                    "varname": "obj-pm-js"
                }
            },
            {
                "box": {
                    "id": "obj-pm-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 945.0, 313.0, 52.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-pm-send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-arpmode-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 1260.0, 75.0, 19.0 ],
                    "text": "Arp Mode",
                    "varname": "obj-arpmode-label"
                }
            },
            {
                "box": {
                    "id": "obj-arpmode-umenu",
                    "items": [ "All On", ",", "Up", ",", "Down", ",", "Up/Down", ",", "Random", ",", "Chord", ",", "Triplet", ",", "Euclidean", ",", "Sequencer" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 1280.0, 150.0, 22.0 ],
                    "varname": "obj-arpmode-umenu"
                }
            },
            {
                "box": {
                    "id": "obj-arpmode-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 1305.0, 270.0, 22.0 ],
                    "text": "expr if($i1<6\\, $i1\\, if($i1==6\\, 7\\, if($i1==7\\, 19\\, 20)))",
                    "varname": "obj-arpmode-expr"
                }
            },
            {
                "box": {
                    "id": "obj-arpmode-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 1335.0, 90.0, 22.0 ],
                    "text": "arp_mode $1",
                    "varname": "obj-arpmode-msg"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-fx-section-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 2470.0, 200.0, 20.0 ],
                    "text": "—— EFFECTS ——",
                    "varname": "obj-fx-section-l"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-rev-wet",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 50.0, 2640.0, 60.0, 22.0 ],
                    "varname": "obj-rev-wet"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-dly-wet",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 2640.0, 60.0, 22.0 ],
                    "varname": "obj-dly-wet"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Canela",
                    "fontsize": 28.0,
                    "id": "obj-819a4950ea",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3510.0, 1070.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 10.0, 1070.0, 34.0 ],
                    "text": "Feedback",
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "title_main"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9763c43509",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3544.0, 1070.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 44.0, 1070.0, 18.0 ],
                    "text": "chaos resonator, 5 attractors, 6 voices, african tunings",
                    "textcolor": [ 0.5, 0.48, 0.45, 1.0 ],
                    "varname": "subtitle_main"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.16, 0.15, 0.14, 1.0 ],
                    "id": "obj-562ec6e448",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3560.0, 1070.0, 4.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 60.0, 1070.0, 4.0 ],
                    "rounded": 0,
                    "varname": "title_underline"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-12ecc5dbbd",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3590.0, 275.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 90.0, 275.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_transport"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-b32c7fe273",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 3596.0, 251.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 96.0, 251.0, 18.0 ],
                    "text": "Transport",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_transport"
                }
            },
            {
                "box": {
                    "id": "obj-7f61a58416",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 3620.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 120.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "play",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "play",
                            "parameter_type": 2
                        }
                    },
                    "varname": "play"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-6119725329",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 25.0, 3654.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 25.0, 154.0, 40.0, 18.0 ],
                    "text": "run",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "play_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-8b80e0c86c",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 75.0, 3625.0, 70.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 125.0, 70.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "bpm"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-09cde8255d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 3650.0, 70.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 150.0, 70.0, 18.0 ],
                    "text": "bpm",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "bpm_l"
                }
            },
            {
                "box": {
                    "id": "obj-b78ffe5fdf",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 160.0, 3620.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 160.0, 120.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "tap",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tap"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-64aca339dd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 155.0, 3654.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 155.0, 154.0, 40.0, 18.0 ],
                    "text": "tap",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "tap_l"
                }
            },
            {
                "box": {
                    "id": "obj-59e2799805",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 3620.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 120.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "mute",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mute",
                            "parameter_type": 2
                        }
                    },
                    "varname": "mute"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-432d2aeed8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 205.0, 3654.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 154.0, 40.0, 18.0 ],
                    "text": "stop",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "mute_l"
                }
            },
            {
                "box": {
                    "id": "obj-538283c4f2",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 255.0, 3620.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 255.0, 120.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "reset",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "reset",
                            "parameter_type": 2
                        }
                    },
                    "varname": "reset"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-8d66ae1931",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 247.0, 3654.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 247.0, 154.0, 50.0, 18.0 ],
                    "text": "reset",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "reset_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-e21b42a4f7",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 305.0, 3590.0, 320.0, 130.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 305.0, 90.0, 320.0, 135.0 ],
                    "rounded": 0,
                    "varname": "panel_engine"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9a1878177d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 317.0, 3596.0, 296.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 317.0, 96.0, 296.0, 18.0 ],
                    "text": "Engine",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_engine"
                }
            },
            {
                "box": {
                    "id": "obj-642ef442fa",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 320.0, 3616.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 320.0, 116.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chaos",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Chaos",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "chaos"
                }
            },
            {
                "box": {
                    "id": "obj-601880ec63",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 380.0, 3616.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 380.0, 116.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 28.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rho",
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 0.5,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Rho",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "rho"
                }
            },
            {
                "box": {
                    "id": "obj-49e7d2a9d8",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 440.0, 3616.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 440.0, 116.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0012 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dt",
                            "parameter_mmax": 0.02,
                            "parameter_mmin": 0.0001,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Time",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dt"
                }
            },
            {
                "box": {
                    "id": "obj-52767afabd",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 500.0, 3616.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 500.0, 116.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flex",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Flex",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "flex"
                }
            },
            {
                "box": {
                    "id": "obj-c41fc2f4b4",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 560.0, 3616.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 560.0, 116.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.7 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "master",
                            "parameter_mmax": 1.5,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Master",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "master"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-bfe83baf93",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 323.0, 3670.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 323.0, 170.0, 50.0, 18.0 ],
                    "text": "chaos",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "chaos_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-611523b3db",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 3670.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 383.0, 170.0, 50.0, 18.0 ],
                    "text": "rho",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "rho_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-b8f72859bb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 443.0, 3670.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 443.0, 170.0, 50.0, 18.0 ],
                    "text": "time",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dt_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-e90c2303c5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 3670.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 503.0, 170.0, 50.0, 18.0 ],
                    "text": "flex",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "flex_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-56fec20f1e",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 563.0, 3670.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 563.0, 170.0, 50.0, 18.0 ],
                    "text": "master",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "master_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-fdbe8e6e0c",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 640.0, 3590.0, 445.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 640.0, 90.0, 445.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_attractor"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9dee824c65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 652.0, 3596.0, 421.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 652.0, 96.0, 421.0, 18.0 ],
                    "text": "Attractor",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_attractor"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color1": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_color2": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-05a231b551",
                    "items": [ "Lorenz", ",", "Rossler", ",", "Chua", ",", "Halvorsen", ",", "Aizawa" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 655.0, 3616.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 655.0, 116.0, 110.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "att_a"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-47c46c2954",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 655.0, 3640.0, 110.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 655.0, 140.0, 110.0, 18.0 ],
                    "text": "primary",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "att_a_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color1": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_color2": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-a4d9c0d887",
                    "items": [ "False", ",", "Lorenz", ",", "Rossler", ",", "Chua", ",", "Halvorsen", ",", "Aizawa" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 775.0, 3616.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 775.0, 116.0, 110.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "att_b"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-0e0f06266b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 775.0, 3640.0, 110.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 775.0, 140.0, 110.0, 18.0 ],
                    "text": "secondary",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "att_b_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color1": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_color2": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-b2e7bb9944",
                    "items": [ "Blend", ",", "Modulate", ",", "Route" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 895.0, 3616.0, 90.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 895.0, 116.0, 90.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "combine"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-3c1dbfcfb2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 895.0, 3640.0, 90.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 895.0, 140.0, 90.0, 18.0 ],
                    "text": "combine mode",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "combine_l"
                }
            },
            {
                "box": {
                    "id": "obj-1113cb479a",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1000.0, 3614.0, 36.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 114.0, 36.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "blend_mix",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Mix",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "blend_mix"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-3ce360704b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 998.0, 3654.0, 36.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 998.0, 154.0, 36.0, 18.0 ],
                    "text": "a",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "blend_l"
                }
            },
            {
                "box": {
                    "id": "obj-59e79317ec",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1040.0, 3614.0, 36.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1040.0, 114.0, 36.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "mod_depth",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Mod",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "mod_depth"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-0339e0f707",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1038.0, 3654.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1038.0, 154.0, 40.0, 18.0 ],
                    "text": "depth",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "mod_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-d685d9c9e1",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3730.0, 240.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 230.0, 240.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_lorenz params"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-a1649fa6b0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 3736.0, 216.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 236.0, 216.0, 18.0 ],
                    "text": "Lorenz params",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_lorenz_params"
                }
            },
            {
                "box": {
                    "id": "obj-d5a9a0abc2",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 10.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sigma",
                            "parameter_mmax": 50.0,
                            "parameter_mmin": 0.1,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Sigma",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "sigma"
                }
            },
            {
                "box": {
                    "id": "obj-933178776a",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 90.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 28.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rho_l_p",
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 0.5,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Rho",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "rho_l_p"
                }
            },
            {
                "box": {
                    "id": "obj-12798f8935",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 150.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 2.667 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "beta",
                            "parameter_mmax": 20.0,
                            "parameter_mmin": 0.1,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Beta",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "beta"
                }
            },
            {
                "box": {
                    "id": "obj-63a334a856",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0012 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "lor_dt",
                            "parameter_mmax": 0.02,
                            "parameter_mmin": 0.0001,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Dt",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "lor_dt"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-87d12a197a",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 3730.0, 180.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 230.0, 180.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_rossler params"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-e89beb0939",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 282.0, 3736.0, 156.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 282.0, 236.0, 156.0, 18.0 ],
                    "text": "Rossler params",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_rossler_params"
                }
            },
            {
                "box": {
                    "id": "obj-e89d47d5ab",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 285.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 285.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.2 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_a",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "A",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "ross_a"
                }
            },
            {
                "box": {
                    "id": "obj-cff0c133ea",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 345.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.2 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_b",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "B",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "ross_b"
                }
            },
            {
                "box": {
                    "id": "obj-9c3435377b",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 405.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 405.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 5.7 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "ross_c",
                            "parameter_mmax": 20.0,
                            "parameter_mmin": 0.5,
                            "parameter_modmode": 3,
                            "parameter_shortname": "C",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "ross_c"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-44bf5a6311",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 465.0, 3730.0, 180.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 465.0, 230.0, 180.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_chua params"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-e772fc9626",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 3736.0, 156.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 477.0, 236.0, 156.0, 18.0 ],
                    "text": "Chua params",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_chua_params"
                }
            },
            {
                "box": {
                    "id": "obj-f68c0d6b73",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 480.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 480.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 15.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_alpha",
                            "parameter_mmax": 30.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Alpha",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "chua_alpha"
                }
            },
            {
                "box": {
                    "id": "obj-3761942f68",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 540.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 28.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_beta",
                            "parameter_mmax": 50.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Beta",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "chua_beta"
                }
            },
            {
                "box": {
                    "id": "obj-4ab31318b8",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 600.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 600.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ -1.143 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "chua_m0",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": -3.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "m0",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "chua_m0"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-98d8279aee",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 3730.0, 120.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 660.0, 230.0, 120.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_halvorsen"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-497d95ab61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 672.0, 3736.0, 96.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 672.0, 236.0, 96.0, 18.0 ],
                    "text": "Halvorsen",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_halvorsen"
                }
            },
            {
                "box": {
                    "id": "obj-d58c15b359",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 675.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 675.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1.89 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "halv_a",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": 0.5,
                            "parameter_modmode": 3,
                            "parameter_shortname": "A",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "halv_a"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-536ca15b05",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 795.0, 3730.0, 290.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 795.0, 230.0, 290.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_aizawa"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-94a31649c9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 807.0, 3736.0, 266.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 807.0, 236.0, 266.0, 18.0 ],
                    "text": "Aizawa",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_aizawa"
                }
            },
            {
                "box": {
                    "id": "obj-97de3a9df9",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 810.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 810.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.95 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_a",
                            "parameter_mmax": 2.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "A",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "aiz_a"
                }
            },
            {
                "box": {
                    "id": "obj-6f28dc6635",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 870.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 870.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.7 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_b",
                            "parameter_mmax": 2.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "B",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "aiz_b"
                }
            },
            {
                "box": {
                    "id": "obj-8f196dc9e6",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 930.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 930.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_c",
                            "parameter_mmax": 2.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "C",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "aiz_c"
                }
            },
            {
                "box": {
                    "id": "obj-943bf053fc",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 990.0, 3756.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 990.0, 256.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 3.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "aiz_d",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "D",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "aiz_d"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-21e9bc7f71",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 3870.0, 490.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 370.0, 490.0, 117.0 ],
                    "rounded": 0,
                    "varname": "panel_pattern"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-135c69c645",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 3876.0, 466.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 376.0, 466.0, 18.0 ],
                    "text": "Pattern",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_pattern"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color1": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_color2": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-48a4754ada",
                    "items": [ "All on", ",", "Up", ",", "Down", ",", "Up down", ",", "Random", ",", "Chord", ",", "Triplet", ",", "Euclidean", ",", "Sequencer" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 3896.0, 200.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 396.0, 200.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "arp_mode"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-5bbafbd8b6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 3898.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 235.0, 398.0, 80.0, 18.0 ],
                    "text": "traversal",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "arp_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-46049485f6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 3928.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 235.0, 428.0, 80.0, 18.0 ],
                    "text": "rhythm",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pattern_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-f0d1cbac1b",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 3896.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 320.0, 396.0, 50.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "arp_div"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-b7a6bb3e1e",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 375.0, 3898.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 375.0, 398.0, 60.0, 18.0 ],
                    "text": "division",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "div_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-a5bb9965ef",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 3926.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 320.0, 426.0, 50.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "transpose"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-1c80f52fde",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 375.0, 3928.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 375.0, 428.0, 80.0, 18.0 ],
                    "text": "transpose",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "trans_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-e7c6b9706a",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 3956.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 320.0, 456.0, 50.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "inversion"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-cdac13b09b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 375.0, 3958.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 375.0, 458.0, 80.0, 18.0 ],
                    "text": "inversion",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "inv_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-92c3359935",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 3958.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 235.0, 458.0, 80.0, 18.0 ],
                    "text": "tuning",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "tuning_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-436f3e4e40",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 505.0, 3870.0, 260.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 505.0, 370.0, 260.0, 117.0 ],
                    "rounded": 0,
                    "varname": "panel_sub bass"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-8b7605ae63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 517.0, 3876.0, 236.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 517.0, 376.0, 236.0, 18.0 ],
                    "text": "Sub bass",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_sub_bass"
                }
            },
            {
                "box": {
                    "id": "obj-859472de60",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 520.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 520.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_amt",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Level",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "sub_amt"
                }
            },
            {
                "box": {
                    "id": "obj-4e7ad90d12",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 580.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 580.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_drive",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Drive",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "sub_drive"
                }
            },
            {
                "box": {
                    "id": "obj-8add3ceb8c",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 640.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 640.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_chaos",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Chaos",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "sub_chaos"
                }
            },
            {
                "box": {
                    "id": "obj-f3fd4684da",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 700.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 700.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ -1.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "sub_oct",
                            "parameter_mmax": 1.0,
                            "parameter_mmin": -3.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Octave",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "sub_oct"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-1c7c6679ac",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 523.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 523.0, 450.0, 50.0, 18.0 ],
                    "text": "level",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "subamt_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-c9efb18593",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 583.0, 450.0, 50.0, 18.0 ],
                    "text": "drive",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "subdrv_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-e907ef91f4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 643.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 643.0, 450.0, 50.0, 18.0 ],
                    "text": "chaos",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "subch_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-aba7a4d3bb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 703.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 703.0, 450.0, 50.0, 18.0 ],
                    "text": "octave",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "suboct_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-da7b6b83c2",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 775.0, 3870.0, 310.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 775.0, 370.0, 310.0, 117.0 ],
                    "rounded": 0,
                    "varname": "panel_effects"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-3004109341",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 787.0, 3876.0, 286.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 787.0, 376.0, 286.0, 18.0 ],
                    "text": "Effects",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_effects"
                }
            },
            {
                "box": {
                    "id": "obj-a493b56788",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 790.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 790.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rev_wet",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Reverb",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "rev_wet"
                }
            },
            {
                "box": {
                    "id": "obj-09b42ea047",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 850.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 850.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.25 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dly_wet",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Delay",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dly_wet"
                }
            },
            {
                "box": {
                    "id": "obj-c118bffe48",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 910.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 910.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 250.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dly_time",
                            "parameter_mmax": 2000.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Time",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dly_time"
                }
            },
            {
                "box": {
                    "id": "obj-e43093a8bd",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 970.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 970.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 6000.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "filter",
                            "parameter_mmax": 18000.0,
                            "parameter_mmin": 50.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Tone",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "filter"
                }
            },
            {
                "box": {
                    "id": "obj-c502c5170f",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1030.0, 3896.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1030.0, 396.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "drive",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Drive",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "drive"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-ba1a5e9309",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 793.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 793.0, 450.0, 50.0, 18.0 ],
                    "text": "reverb",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "rev_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-7ec4558cc2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 853.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 853.0, 450.0, 50.0, 18.0 ],
                    "text": "dly wet",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dly_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-cbc182fffb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 913.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 913.0, 450.0, 50.0, 18.0 ],
                    "text": "dly ms",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dly_time_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-8bb8144065",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 973.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 973.0, 450.0, 50.0, 18.0 ],
                    "text": "tone",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "flt_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9c592e21b2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1033.0, 3950.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1033.0, 450.0, 50.0, 18.0 ],
                    "text": "gain",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "drive_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-4cc6459fad",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4010.0, 275.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 510.0, 463.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_envelope"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-43b413bf94",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4016.0, 251.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 516.0, 251.0, 18.0 ],
                    "text": "Envelope",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_envelope"
                }
            },
            {
                "box": {
                    "id": "obj-7fc2a7d3e2",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 536.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.005 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_a",
                            "parameter_mmax": 5.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Attack",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "env_a"
                }
            },
            {
                "box": {
                    "id": "obj-f5918e3854",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 90.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 536.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.05 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_d",
                            "parameter_mmax": 5.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Decay",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "env_d"
                }
            },
            {
                "box": {
                    "id": "obj-5318af3385",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 150.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.0, 536.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.8 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_s",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Sustain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "env_s"
                }
            },
            {
                "box": {
                    "id": "obj-d8be5938b9",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 536.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.1 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "env_r",
                            "parameter_mmax": 8.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Release",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "env_r"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-d7773236e3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 33.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 33.0, 590.0, 50.0, 18.0 ],
                    "text": "attack",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "enva_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-7030dc798b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 93.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 590.0, 50.0, 18.0 ],
                    "text": "decay",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "envd_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-4cef7f7a06",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 153.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 153.0, 590.0, 50.0, 18.0 ],
                    "text": "sustain",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "envs_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-c3fee97413",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 213.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 213.0, 590.0, 50.0, 18.0 ],
                    "text": "release",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "envr_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-203c578848",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 305.0, 4010.0, 430.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 652.0, 505.0, 430.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_root"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-179dbe1aa2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 317.0, 4016.0, 406.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 664.0, 511.0, 406.0, 18.0 ],
                    "text": "Root",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_root"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-56bf809759",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 4046.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 667.0, 541.0, 60.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "root"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-31423d0d42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 4080.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 667.0, 575.0, 60.0, 18.0 ],
                    "text": "root hz",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "root_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-0e3d6926ec",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 390.0, 4060.0, 130.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 737.0, 555.0, 130.0, 18.0 ],
                    "text": "african root preset",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "rootp_l"
                }
            },
            {
                "box": {
                    "id": "obj-59cae48c7e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 530.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 877.0, 531.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.001 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "glide",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Glide",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "glide"
                }
            },
            {
                "box": {
                    "id": "obj-1e7c29ed64",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 590.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 937.0, 531.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "brightness",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Bright",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "brightness"
                }
            },
            {
                "box": {
                    "id": "obj-7ba14fc212",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 650.0, 4036.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 997.0, 531.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "rootspring",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Spring",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "rootspring"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-62d008413a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 533.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 585.0, 50.0, 18.0 ],
                    "text": "glide",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "glide_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-ef63d475b7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 593.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 940.0, 585.0, 50.0, 18.0 ],
                    "text": "bright",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "bright_l"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-c496e93323",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 4090.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 585.0, 50.0, 18.0 ],
                    "text": "spring",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "spring_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-218990b004",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4150.0, 1070.0, 350.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 650.0, 1070.0, 350.0 ],
                    "rounded": 0,
                    "varname": "panel_sequencer"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-08f1b20ac8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4156.0, 1046.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 656.0, 1046.0, 18.0 ],
                    "text": "Sequencer",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_sequencer"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-f6a8931b8f",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 4180.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 680.0, 50.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "pat_len"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-37ce93ccf6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 4204.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 704.0, 50.0, 18.0 ],
                    "text": "length",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pat_len_l"
                }
            },
            {
                "box": {
                    "id": "obj-686b779b5f",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 95.0, 4172.0, 38.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 95.0, 672.0, 38.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "swing",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Swing",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "swing"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-79bc5e86ae",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 93.0, 4212.0, 42.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 712.0, 42.0, 18.0 ],
                    "text": "swing",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "swing_l"
                }
            },
            {
                "box": {
                    "id": "obj-c05af64fa5",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 145.0, 4172.0, 38.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 145.0, 672.0, 38.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "prob",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Prob",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "prob"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-5311fdb1d5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 137.0, 4212.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 712.0, 60.0, 18.0 ],
                    "text": "probability",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "prob_l"
                }
            },
            {
                "box": {
                    "id": "obj-31c7217357",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 205.0, 4172.0, 38.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 672.0, 38.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "vel_range",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Range",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "vel_range"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-f404f0ed45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 199.0, 4212.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 199.0, 712.0, 50.0, 18.0 ],
                    "text": "velocity",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "vel_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color": [ 0.1, 0.1, 0.11, 1.0 ],
                    "bgfillcolor_color1": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_color2": [ 0.158640689195807, 0.158640642399981, 0.158640654628478, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-16cb665dca",
                    "items": [ "Forward", ",", "Back", ",", "Ping pong", ",", "Random" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 265.0, 4180.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 265.0, 680.0, 110.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "varname": "direction"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-61700a4e1b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 265.0, 4204.0, 110.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 265.0, 704.0, 110.0, 18.0 ],
                    "text": "direction",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dir_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1, 0.1, 0.11, 1.0 ],
                    "format": 6,
                    "id": "obj-fb69b8ad87",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 395.0, 4180.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 395.0, 680.0, 50.0, 22.0 ],
                    "textcolor": [ 0.95, 0.94, 0.91, 1.0 ],
                    "triangle": 0,
                    "varname": "ratchet"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-1f69d84b88",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 395.0, 4204.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 395.0, 704.0, 60.0, 18.0 ],
                    "text": "ratchet",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ratchet_l"
                }
            },
            {
                "box": {
                    "id": "obj-3c698773f9",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 475.0, 4180.0, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 475.0, 680.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_a",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_a",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_a"
                }
            },
            {
                "box": {
                    "id": "obj-b9ed3fdef7",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 503.0, 4180.0, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 503.0, 680.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_b",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_b",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_b"
                }
            },
            {
                "box": {
                    "id": "obj-189f4646cd",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 531.0, 4180.0, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 531.0, 680.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_c",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_c",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_c"
                }
            },
            {
                "box": {
                    "id": "obj-37501ee07f",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 559.0, 4180.0, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 559.0, 680.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_d",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_d",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_d"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-a98d686fc1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 475.0, 4204.0, 110.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 475.0, 704.0, 110.0, 18.0 ],
                    "text": "bank a",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pat_bank_l"
                }
            },
            {
                "box": {
                    "id": "obj-0c50f362a9",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 605.0, 4180.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 605.0, 680.0, 21.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_clear",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_clear",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_clear"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-30621d5cf0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 605.0, 4204.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 605.0, 704.0, 50.0, 18.0 ],
                    "text": "clear",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pat_clear_l"
                }
            },
            {
                "box": {
                    "id": "obj-530c055edb",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 675.0, 4180.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 675.0, 680.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_rand",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_rand",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_rand"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-5dcc642228",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 4204.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 675.0, 704.0, 50.0, 18.0 ],
                    "text": "random",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pat_rand_l"
                }
            },
            {
                "box": {
                    "id": "obj-f33f6c9f8d",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 745.0, 4180.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 745.0, 680.0, 23.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "pat_copy",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pat_copy",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pat_copy"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-ce086548dc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 745.0, 4204.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 745.0, 704.0, 50.0, 18.0 ],
                    "text": "copy",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "pat_copy_l"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.04, 0.04, 0.045, 1.0 ],
                    "columns": 16,
                    "horizontalmargin": 4,
                    "horizontalspacing": 3,
                    "id": "obj-42784304ee",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "list" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 4250.0, 501.0, 191.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 750.0, 501.0, 191.0 ],
                    "rows": 6,
                    "varname": "ugrid",
                    "verticalmargin": 4,
                    "verticalspacing": 3
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.04, 0.04, 0.045, 1.0 ],
                    "columns": 16,
                    "horizontalmargin": 4,
                    "horizontalspacing": 3,
                    "id": "obj-fa59b488bd",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "list" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 4455.0, 501.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 955.0, 501.0, 36.0 ],
                    "rows": 1,
                    "varname": "stepind",
                    "verticalmargin": 4,
                    "verticalspacing": 3
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-12549cace7",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 870.0, 4490.0, 220.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 870.0, 990.0, 220.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_capture"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-37607f8408",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 882.0, 4496.0, 196.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 882.0, 996.0, 196.0, 18.0 ],
                    "text": "Capture",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_capture"
                }
            },
            {
                "box": {
                    "id": "obj-c12b4a8823",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 885.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 885.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "rec_open",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "rec_open",
                            "parameter_type": 2
                        }
                    },
                    "varname": "rec_open"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-487c4777b7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 880.0, 4550.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 1050.0, 50.0, 18.0 ],
                    "text": "open",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "rec_open_l"
                }
            },
            {
                "box": {
                    "id": "obj-82a8b2470f",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 935.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 935.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "rec_arm",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "rec_arm",
                            "parameter_type": 2
                        }
                    },
                    "varname": "rec_arm"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-ddc5028943",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 930.0, 4550.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 930.0, 1050.0, 40.0, 18.0 ],
                    "text": "arm",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "rec_arm_l"
                }
            },
            {
                "box": {
                    "id": "obj-c4dbeccb50",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 980.0, 4516.0, 12.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 980.0, 1016.0, 12.0, 50.0 ],
                    "slidercolor": [ 0.071196037102503, 0.071195997168178, 0.071196007384196, 1.0 ],
                    "varname": "meter_l"
                }
            },
            {
                "box": {
                    "id": "obj-64078c2a39",
                    "maxclass": "live.meter~",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 1000.0, 4516.0, 12.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 1016.0, 12.0, 50.0 ],
                    "slidercolor": [ 0.071196037102503, 0.071195997168178, 0.071196007384196, 1.0 ],
                    "varname": "meter_r"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-d865b33f73",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4490.0, 165.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 990.0, 165.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_drone"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-967c828b48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4496.0, 141.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 996.0, 141.0, 18.0 ],
                    "text": "Drone",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_drone"
                }
            },
            {
                "box": {
                    "id": "obj-2b85c1eb6f",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "dr_root",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dr_root",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dr_root"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-adb20b5388",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 4550.0, 51.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 1050.0, 51.0, 18.0 ],
                    "text": "root drone",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dr_root_l"
                }
            },
            {
                "box": {
                    "id": "obj-d683030f80",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 105.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 105.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "dr_fifth",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dr_fifth",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dr_fifth"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-39662ac0e4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 95.0, 4550.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 95.0, 1050.0, 60.0, 18.0 ],
                    "text": "fifth drone",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "dr_fifth_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-92e1ac5549",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 4490.0, 310.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 195.0, 990.0, 310.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_chord"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-dc3effac10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 207.0, 4496.0, 286.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 207.0, 996.0, 286.0, 18.0 ],
                    "text": "Chord",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_chord"
                }
            },
            {
                "box": {
                    "id": "obj-806fe4ba29",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "cp_yoruba",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "cp_yoruba",
                            "parameter_type": 2
                        }
                    },
                    "varname": "cp_yoruba"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-f0ee16d297",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 4550.0, 70.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 195.0, 1050.0, 70.0, 18.0 ],
                    "text": "yoruba",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "cp_yoruba_l"
                }
            },
            {
                "box": {
                    "id": "obj-543e539b33",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 275.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "cp_cluster",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "cp_cluster",
                            "parameter_type": 2
                        }
                    },
                    "varname": "cp_cluster"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-f1f88c5b55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 265.0, 4550.0, 70.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 265.0, 1050.0, 70.0, 18.0 ],
                    "text": "cluster",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "cp_cluster_l"
                }
            },
            {
                "box": {
                    "id": "obj-cbcc6fbb31",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 345.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "cp_fifths",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "cp_fifths",
                            "parameter_type": 2
                        }
                    },
                    "varname": "cp_fifths"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-c72ee66b96",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 335.0, 4550.0, 70.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 1050.0, 70.0, 18.0 ],
                    "text": "fifths",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "cp_fifths_l"
                }
            },
            {
                "box": {
                    "id": "obj-c263452e44",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 425.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 425.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "cp_subdrone",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "cp_subdrone",
                            "parameter_type": 2
                        }
                    },
                    "varname": "cp_subdrone"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-466ff5f059",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 410.0, 4550.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 410.0, 1050.0, 80.0, 18.0 ],
                    "text": "sub drone",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "cp_subdrone_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-b69a2b06c0",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 520.0, 4490.0, 225.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 520.0, 990.0, 225.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_voice spread"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-10db0bc61d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 532.0, 4496.0, 201.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 532.0, 996.0, 201.0, 18.0 ],
                    "text": "Voice spread",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_voice_spread"
                }
            },
            {
                "box": {
                    "id": "obj-19996fbb2a",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 535.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 535.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "spr_tight",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "spr_tight",
                            "parameter_type": 2
                        }
                    },
                    "varname": "spr_tight"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-b33eaed3c5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 527.0, 4550.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 527.0, 1050.0, 50.0, 18.0 ],
                    "text": "tight",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "spr_tight_l"
                }
            },
            {
                "box": {
                    "id": "obj-39bae18cd5",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 595.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 595.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "spr_med",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "spr_med",
                            "parameter_type": 2
                        }
                    },
                    "varname": "spr_med"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-c7b48ac5de",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 590.0, 4550.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 590.0, 1050.0, 40.0, 18.0 ],
                    "text": "med",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "spr_med_l"
                }
            },
            {
                "box": {
                    "id": "obj-ab4a5bf5ad",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 655.0, 4516.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 655.0, 1016.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "spr_wide",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "spr_wide",
                            "parameter_type": 2
                        }
                    },
                    "varname": "spr_wide"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-6d559188b4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 647.0, 4550.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 647.0, 1050.0, 50.0, 18.0 ],
                    "text": "wide",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "spr_wide_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-46c0469197",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4600.0, 800.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 1100.0, 800.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_voicings"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-34b83c70cc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4606.0, 776.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 1106.0, 776.0, 18.0 ],
                    "text": "Voicings",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_voicings"
                }
            },
            {
                "box": {
                    "id": "obj-08b3f58d44",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_pluck",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_pluck",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_pluck"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9cb375bff1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 22.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 22.0, 1160.0, 50.0, 18.0 ],
                    "text": "pluck",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_pluck_l"
                }
            },
            {
                "box": {
                    "id": "obj-222f6424d6",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 90.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_pad",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_pad",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_pad"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-dbe210544a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 82.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 82.0, 1160.0, 50.0, 18.0 ],
                    "text": "pad",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_pad_l"
                }
            },
            {
                "box": {
                    "id": "obj-a3d136461f",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 150.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_swell",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_swell",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_swell"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-de89e5451a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 142.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 142.0, 1160.0, 50.0, 18.0 ],
                    "text": "swell",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_swell_l"
                }
            },
            {
                "box": {
                    "id": "obj-4efebc926c",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_stab",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_stab",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_stab"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-707cc7f33c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 202.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 1160.0, 50.0, 18.0 ],
                    "text": "stab",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_stab_l"
                }
            },
            {
                "box": {
                    "id": "obj-2b0579a5fa",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 270.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_bell",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_bell",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_bell"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-7633855c3c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 262.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 262.0, 1160.0, 50.0, 18.0 ],
                    "text": "bell",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_bell_l"
                }
            },
            {
                "box": {
                    "id": "obj-a9bc630ec7",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 330.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_swarm",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_swarm",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_swarm"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-2de8f6e3dd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 322.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 322.0, 1160.0, 50.0, 18.0 ],
                    "text": "swarm",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_swarm_l"
                }
            },
            {
                "box": {
                    "id": "obj-3fc7bb8078",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 390.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 390.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_drift",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_drift",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_drift"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-061828907e",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 382.0, 4660.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 382.0, 1160.0, 50.0, 18.0 ],
                    "text": "drift",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_drift_l"
                }
            },
            {
                "box": {
                    "id": "obj-300ddd7a95",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 450.0, 4626.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 450.0, 1126.0, 30.0, 30.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "voice_sus",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "voice_sus",
                            "parameter_type": 2
                        }
                    },
                    "varname": "voice_sus"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-3f58be3d55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 4660.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 440.0, 1160.0, 60.0, 18.0 ],
                    "text": "sustain",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "voice_sus_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-55951a9382",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4710.0, 1070.0, 90.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 1210.0, 1070.0, 90.0 ],
                    "rounded": 0,
                    "varname": "panel_combos"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-3509bc49e5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4716.0, 1046.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 1216.0, 1046.0, 18.0 ],
                    "text": "Combos",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_combos"
                }
            },
            {
                "box": {
                    "id": "obj-ac2a8db298",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_lorenz",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_lorenz",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_lorenz"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-735c84bff2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 4766.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 1266.0, 50.0, 18.0 ],
                    "text": "lorenz",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_lorenz_l"
                }
            },
            {
                "box": {
                    "id": "obj-4c3c95e2e1",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 85.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 85.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_rossler",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_rossler",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_rossler"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-15e22b5d05",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 4766.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 1266.0, 50.0, 18.0 ],
                    "text": "rossler",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_rossler_l"
                }
            },
            {
                "box": {
                    "id": "obj-1f595f90e8",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 145.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 145.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_chua",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_chua",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_chua"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-919e261b22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 137.0, 4766.0, 45.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 1266.0, 45.0, 18.0 ],
                    "text": "chua",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_chua_l"
                }
            },
            {
                "box": {
                    "id": "obj-e35c9c9e79",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 200.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 200.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_halvorsen",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_halvorsen",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_halvorsen"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-1d8ad8f4f2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 185.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 1266.0, 60.0, 18.0 ],
                    "text": "halvorsen",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_halvorsen_l"
                }
            },
            {
                "box": {
                    "id": "obj-f7e99efbdf",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 260.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 260.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_aizawa",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_aizawa",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_aizawa"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-b91a39fcb6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 4766.0, 50.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 250.0, 1266.0, 50.0, 18.0 ],
                    "text": "aizawa",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_aizawa_l"
                }
            },
            {
                "box": {
                    "id": "obj-081196ed93",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 335.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_lr_blend",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_lr_blend",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_lr_blend"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-4cf5f11ad7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 320.0, 1266.0, 60.0, 18.0 ],
                    "text": "l + r",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_lr_blend_l"
                }
            },
            {
                "box": {
                    "id": "obj-86329d8e1f",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 395.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 395.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_lc_mod",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_lc_mod",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_lc_mod"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-f70aec1d65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 380.0, 1266.0, 60.0, 18.0 ],
                    "text": "l x c",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_lc_mod_l"
                }
            },
            {
                "box": {
                    "id": "obj-791be0f64d",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 455.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 455.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_lh_route",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_lh_route",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_lh_route"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-f017b80181",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 440.0, 1266.0, 60.0, 18.0 ],
                    "text": "l to h",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_lh_route_l"
                }
            },
            {
                "box": {
                    "id": "obj-e51de16c24",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 515.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 515.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_ra_mod",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_ra_mod",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_ra_mod"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-9a55acc5d8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 500.0, 1266.0, 60.0, 18.0 ],
                    "text": "r x a",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_ra_mod_l"
                }
            },
            {
                "box": {
                    "id": "obj-f68a214e9b",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 575.0, 4736.0, 26.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 575.0, 1236.0, 26.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ac_ha_blend",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ac_ha_blend",
                            "parameter_type": 2
                        }
                    },
                    "varname": "ac_ha_blend"
                }
            },
            {
                "box": {
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-e52f59c0ed",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 4766.0, 60.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 560.0, 1266.0, 60.0, 18.0 ],
                    "text": "h + a",
                    "textcolor": [ 0.32, 0.3, 0.28, 1.0 ],
                    "varname": "ac_ha_blend_l"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-0f032afff2",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 4820.0, 810.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 1320.0, 810.0, 110.0 ],
                    "rounded": 0,
                    "varname": "panel_macros"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Söhne",
                    "fontsize": 9.0,
                    "id": "obj-a0e5f46154",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 4826.0, 786.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 1326.0, 786.0, 18.0 ],
                    "text": "Macros",
                    "textcolor": [ 0.4, 0.45, 0.62, 1.0 ],
                    "varname": "label_macros"
                }
            },
            {
                "box": {
                    "id": "obj-d499a54229",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_melt",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Melt",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_melt"
                }
            },
            {
                "box": {
                    "id": "obj-dac01f4f2a",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 90.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_ritual",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Ritual",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_ritual"
                }
            },
            {
                "box": {
                    "id": "obj-85b64623db",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 150.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_mouth",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Mouth",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_mouth"
                }
            },
            {
                "box": {
                    "id": "obj-fc9ee5e17e",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_ghost",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Ghost",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_ghost"
                }
            },
            {
                "box": {
                    "id": "obj-9e0d31611c",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 270.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_choir",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Choir",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_choir"
                }
            },
            {
                "box": {
                    "id": "obj-44607863c6",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 330.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_recall",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Recall",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_recall"
                }
            },
            {
                "box": {
                    "id": "obj-63aae3ac5c",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 390.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 390.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_heat",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Heat",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_heat"
                }
            },
            {
                "box": {
                    "id": "obj-de790885a4",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 450.0, 4846.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 450.0, 1346.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m_split",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "Split",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "m_split"
                }
            },
            {
                "box": {
                    "id": "obj-83c24ca31b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 50.0, 4450.0, 60.0, 22.0 ],
                    "text": "- 1",
                    "varname": "obj-att-b-offset"
                }
            },
            {
                "box": {
                    "id": "obj-dd12297a74",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 4450.0, 140.0, 22.0 ],
                    "text": "pak att_b_sel 0.",
                    "varname": "obj-pak-att-b"
                }
            },
            {
                "box": {
                    "id": "obj-b0f09d95fc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 4450.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-att-b"
                }
            },
            {
                "box": {
                    "id": "obj-c0c1ec7ab5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4500.0, 140.0, 22.0 ],
                    "text": "pak chaos_gain 0.",
                    "varname": "obj-pak-chaos"
                }
            },
            {
                "box": {
                    "id": "obj-22204b5d58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4500.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-chaos"
                }
            },
            {
                "box": {
                    "id": "obj-0015a7cb98",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4530.0, 140.0, 22.0 ],
                    "text": "pak rho 0.",
                    "varname": "obj-pak-rho"
                }
            },
            {
                "box": {
                    "id": "obj-ea0578832a",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4530.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-rho"
                }
            },
            {
                "box": {
                    "id": "obj-5718f31920",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4560.0, 140.0, 22.0 ],
                    "text": "pak lorenz_dt 0.",
                    "varname": "obj-pak-dt"
                }
            },
            {
                "box": {
                    "id": "obj-c11da9b54f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4560.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-dt"
                }
            },
            {
                "box": {
                    "id": "obj-2546119e57",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4590.0, 140.0, 22.0 ],
                    "text": "pak flex 0.",
                    "varname": "obj-pak-flex"
                }
            },
            {
                "box": {
                    "id": "obj-b72e71ec8d",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4590.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-flex"
                }
            },
            {
                "box": {
                    "id": "obj-3b93d52eeb",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4620.0, 140.0, 22.0 ],
                    "text": "pak master_gain 0.",
                    "varname": "obj-pak-master"
                }
            },
            {
                "box": {
                    "id": "obj-4e2ad0afc2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4620.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-master"
                }
            },
            {
                "box": {
                    "id": "obj-c36d8d40bb",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4650.0, 140.0, 22.0 ],
                    "text": "pak arp_bpm 0.",
                    "varname": "obj-pak-bpm"
                }
            },
            {
                "box": {
                    "id": "obj-f3dcb2d9c1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4650.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-bpm"
                }
            },
            {
                "box": {
                    "id": "obj-dbddc0370a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4680.0, 140.0, 22.0 ],
                    "text": "pak mute 0.",
                    "varname": "obj-pak-mute"
                }
            },
            {
                "box": {
                    "id": "obj-5a4b9bfe2f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4680.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-mute"
                }
            },
            {
                "box": {
                    "id": "obj-be27a1b854",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4710.0, 140.0, 22.0 ],
                    "text": "pak arp_div 0.",
                    "varname": "obj-pak-arp_div"
                }
            },
            {
                "box": {
                    "id": "obj-781d93b34a",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4710.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-arp_div"
                }
            },
            {
                "box": {
                    "id": "obj-9ad1745859",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4740.0, 140.0, 22.0 ],
                    "text": "pak transpose 0.",
                    "varname": "obj-pak-transpose"
                }
            },
            {
                "box": {
                    "id": "obj-3cbbc473f1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4740.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-transpose"
                }
            },
            {
                "box": {
                    "id": "obj-083b3ec941",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4770.0, 140.0, 22.0 ],
                    "text": "pak inversion 0.",
                    "varname": "obj-pak-inversion"
                }
            },
            {
                "box": {
                    "id": "obj-02cd39d52b",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4770.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-inversion"
                }
            },
            {
                "box": {
                    "id": "obj-a89f29b043",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4800.0, 140.0, 22.0 ],
                    "text": "pak flex 0.",
                    "varname": "obj-pak-m_melt"
                }
            },
            {
                "box": {
                    "id": "obj-4e6909e2c8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4800.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_melt"
                }
            },
            {
                "box": {
                    "id": "obj-b759daa5ff",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4830.0, 140.0, 22.0 ],
                    "text": "pak glide 0.",
                    "varname": "obj-pak-m_ritual"
                }
            },
            {
                "box": {
                    "id": "obj-6dda27f9b1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4830.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_ritual"
                }
            },
            {
                "box": {
                    "id": "obj-e14adfb77a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4860.0, 140.0, 22.0 ],
                    "text": "pak brightness 0.",
                    "varname": "obj-pak-m_mouth"
                }
            },
            {
                "box": {
                    "id": "obj-fb8aa95699",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4860.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_mouth"
                }
            },
            {
                "box": {
                    "id": "obj-bda05beca1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4890.0, 140.0, 22.0 ],
                    "text": "pak register 0.",
                    "varname": "obj-pak-m_ghost"
                }
            },
            {
                "box": {
                    "id": "obj-2db251b4e2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4890.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_ghost"
                }
            },
            {
                "box": {
                    "id": "obj-1fd6635700",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4920.0, 140.0, 22.0 ],
                    "text": "pak bass_oct 0.",
                    "varname": "obj-pak-m_choir"
                }
            },
            {
                "box": {
                    "id": "obj-219ca6816b",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4920.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_choir"
                }
            },
            {
                "box": {
                    "id": "obj-f223706aaa",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4950.0, 140.0, 22.0 ],
                    "text": "pak treble_oct 0.",
                    "varname": "obj-pak-m_recall"
                }
            },
            {
                "box": {
                    "id": "obj-37ad565dd8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4950.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_recall"
                }
            },
            {
                "box": {
                    "id": "obj-bb42643dec",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 4980.0, 140.0, 22.0 ],
                    "text": "pak smooth_speed 0.",
                    "varname": "obj-pak-m_heat"
                }
            },
            {
                "box": {
                    "id": "obj-6f6906333f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 4980.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_heat"
                }
            },
            {
                "box": {
                    "id": "obj-cc00cf8ae2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5010.0, 140.0, 22.0 ],
                    "text": "pak sub_drive 0.",
                    "varname": "obj-pak-m_split"
                }
            },
            {
                "box": {
                    "id": "obj-bdb9921bda",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5010.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-m_split"
                }
            },
            {
                "box": {
                    "id": "obj-7eaa99639a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5040.0, 140.0, 22.0 ],
                    "text": "pak env_attack 0.",
                    "varname": "obj-pak-env_a"
                }
            },
            {
                "box": {
                    "id": "obj-cdda1f3dd9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5040.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-env_a"
                }
            },
            {
                "box": {
                    "id": "obj-575e2c286d",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5070.0, 140.0, 22.0 ],
                    "text": "pak env_decay 0.",
                    "varname": "obj-pak-env_d"
                }
            },
            {
                "box": {
                    "id": "obj-1ff363bb2f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5070.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-env_d"
                }
            },
            {
                "box": {
                    "id": "obj-7127279253",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5100.0, 140.0, 22.0 ],
                    "text": "pak env_sustain 0.",
                    "varname": "obj-pak-env_s"
                }
            },
            {
                "box": {
                    "id": "obj-2320c9c9ba",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5100.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-env_s"
                }
            },
            {
                "box": {
                    "id": "obj-3f4f469cee",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5130.0, 140.0, 22.0 ],
                    "text": "pak env_release 0.",
                    "varname": "obj-pak-env_r"
                }
            },
            {
                "box": {
                    "id": "obj-a506bdef52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5130.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-env_r"
                }
            },
            {
                "box": {
                    "id": "obj-0d43617b51",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5160.0, 140.0, 22.0 ],
                    "text": "pak root 0.",
                    "varname": "obj-pak-root"
                }
            },
            {
                "box": {
                    "id": "obj-a87e0a5450",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5160.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-root"
                }
            },
            {
                "box": {
                    "id": "obj-5c1341f43b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5190.0, 140.0, 22.0 ],
                    "text": "pak glide 0.",
                    "varname": "obj-pak-glide"
                }
            },
            {
                "box": {
                    "id": "obj-29e6a72e27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5190.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-glide"
                }
            },
            {
                "box": {
                    "id": "obj-cc25f46c57",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5220.0, 140.0, 22.0 ],
                    "text": "pak brightness 0.",
                    "varname": "obj-pak-brightness"
                }
            },
            {
                "box": {
                    "id": "obj-736939a5d8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5220.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-brightness"
                }
            },
            {
                "box": {
                    "id": "obj-db22eaea55",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5250.0, 140.0, 22.0 ],
                    "text": "pak rootspring 0.",
                    "varname": "obj-pak-rootspring"
                }
            },
            {
                "box": {
                    "id": "obj-ff40645df9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 5250.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-rootspring"
                }
            },
            {
                "box": {
                    "id": "obj-8fbd9d2f7b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4500.0, 140.0, 22.0 ],
                    "text": "pak sub_oct 0.",
                    "varname": "obj-pak-sub_oct"
                }
            },
            {
                "box": {
                    "id": "obj-2b2e1879f7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4500.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-sub_oct"
                }
            },
            {
                "box": {
                    "id": "obj-4dfeadc081",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4530.0, 140.0, 22.0 ],
                    "text": "pak att_sel 0.",
                    "varname": "obj-pak-att_a"
                }
            },
            {
                "box": {
                    "id": "obj-ca34350842",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4530.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-att_a"
                }
            },
            {
                "box": {
                    "id": "obj-dd016b91e4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4560.0, 140.0, 22.0 ],
                    "text": "pak combine_mode 0.",
                    "varname": "obj-pak-combine"
                }
            },
            {
                "box": {
                    "id": "obj-503316c7d7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4560.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-combine"
                }
            },
            {
                "box": {
                    "id": "obj-22673fd57d",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4590.0, 140.0, 22.0 ],
                    "text": "pak blend_mix 0.",
                    "varname": "obj-pak-blend_mix"
                }
            },
            {
                "box": {
                    "id": "obj-a6009fe803",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4590.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-blend_mix"
                }
            },
            {
                "box": {
                    "id": "obj-a2effc8e5a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4620.0, 140.0, 22.0 ],
                    "text": "pak mod_depth 0.",
                    "varname": "obj-pak-mod_depth"
                }
            },
            {
                "box": {
                    "id": "obj-07c2070ac7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4620.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-mod_depth"
                }
            },
            {
                "box": {
                    "id": "obj-a1ea8cbd47",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4650.0, 140.0, 22.0 ],
                    "text": "pak sigma 0.",
                    "varname": "obj-pak-sigma"
                }
            },
            {
                "box": {
                    "id": "obj-159b30a6fe",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4650.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-sigma"
                }
            },
            {
                "box": {
                    "id": "obj-b45e7730f2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4680.0, 140.0, 22.0 ],
                    "text": "pak beta 0.",
                    "varname": "obj-pak-beta"
                }
            },
            {
                "box": {
                    "id": "obj-d2f4de05fc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4680.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-beta"
                }
            },
            {
                "box": {
                    "id": "obj-79942f7be6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4710.0, 140.0, 22.0 ],
                    "text": "pak ross_a 0.",
                    "varname": "obj-pak-ross_a"
                }
            },
            {
                "box": {
                    "id": "obj-2d3737cea9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4710.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-ross_a"
                }
            },
            {
                "box": {
                    "id": "obj-bd5ccc402c",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4740.0, 140.0, 22.0 ],
                    "text": "pak ross_b 0.",
                    "varname": "obj-pak-ross_b"
                }
            },
            {
                "box": {
                    "id": "obj-275babd901",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4740.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-ross_b"
                }
            },
            {
                "box": {
                    "id": "obj-7f3a514c11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4770.0, 140.0, 22.0 ],
                    "text": "pak ross_c 0.",
                    "varname": "obj-pak-ross_c"
                }
            },
            {
                "box": {
                    "id": "obj-d4c1cdfdea",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4770.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-ross_c"
                }
            },
            {
                "box": {
                    "id": "obj-47007d425e",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4800.0, 140.0, 22.0 ],
                    "text": "pak chua_alpha 0.",
                    "varname": "obj-pak-chua_alpha"
                }
            },
            {
                "box": {
                    "id": "obj-514a417c5e",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4800.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-chua_alpha"
                }
            },
            {
                "box": {
                    "id": "obj-9776f2161f",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4830.0, 140.0, 22.0 ],
                    "text": "pak chua_beta 0.",
                    "varname": "obj-pak-chua_beta"
                }
            },
            {
                "box": {
                    "id": "obj-869a4536ef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4830.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-chua_beta"
                }
            },
            {
                "box": {
                    "id": "obj-2faa80ab7b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4860.0, 140.0, 22.0 ],
                    "text": "pak chua_m0 0.",
                    "varname": "obj-pak-chua_m0"
                }
            },
            {
                "box": {
                    "id": "obj-1d49e67204",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4860.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-chua_m0"
                }
            },
            {
                "box": {
                    "id": "obj-a84dbf90e7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4890.0, 140.0, 22.0 ],
                    "text": "pak halv_a 0.",
                    "varname": "obj-pak-halv_a"
                }
            },
            {
                "box": {
                    "id": "obj-081b41b024",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4890.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-halv_a"
                }
            },
            {
                "box": {
                    "id": "obj-79fc59c5d9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4920.0, 140.0, 22.0 ],
                    "text": "pak aiz_a 0.",
                    "varname": "obj-pak-aiz_a"
                }
            },
            {
                "box": {
                    "id": "obj-9d9aeff2df",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4920.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-aiz_a"
                }
            },
            {
                "box": {
                    "id": "obj-7d69da17ee",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4950.0, 140.0, 22.0 ],
                    "text": "pak aiz_b 0.",
                    "varname": "obj-pak-aiz_b"
                }
            },
            {
                "box": {
                    "id": "obj-d636406d2f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4950.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-aiz_b"
                }
            },
            {
                "box": {
                    "id": "obj-3f04f38866",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 4980.0, 140.0, 22.0 ],
                    "text": "pak aiz_c 0.",
                    "varname": "obj-pak-aiz_c"
                }
            },
            {
                "box": {
                    "id": "obj-1eae2f93a4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 4980.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-aiz_c"
                }
            },
            {
                "box": {
                    "id": "obj-3acc7ca796",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5010.0, 140.0, 22.0 ],
                    "text": "pak aiz_d 0.",
                    "varname": "obj-pak-aiz_d"
                }
            },
            {
                "box": {
                    "id": "obj-d69fc85302",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5010.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-aiz_d"
                }
            },
            {
                "box": {
                    "id": "obj-45e53bb3eb",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5040.0, 140.0, 22.0 ],
                    "text": "pak sub_amt 0.",
                    "varname": "obj-pak-sub_amt"
                }
            },
            {
                "box": {
                    "id": "obj-419af1c049",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5040.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-sub_amt"
                }
            },
            {
                "box": {
                    "id": "obj-7eb8e47716",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5070.0, 140.0, 22.0 ],
                    "text": "pak sub_drive 0.",
                    "varname": "obj-pak-sub_drive"
                }
            },
            {
                "box": {
                    "id": "obj-ed372b4af2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5070.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-sub_drive"
                }
            },
            {
                "box": {
                    "id": "obj-1d8e1b08d6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5100.0, 140.0, 22.0 ],
                    "text": "pak sub_chaos 0.",
                    "varname": "obj-pak-sub_chaos"
                }
            },
            {
                "box": {
                    "id": "obj-f4bb7b1433",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5100.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-sub_chaos"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.07, 0.07, 0.08, 1.0 ],
                    "id": "obj-2",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 790.0, 3885.0, 310.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1151.0, 370.0, 281.0, 266.0 ],
                    "rounded": 0,
                    "varname": "panel_effects[1]"
                }
            },
            {
                "box": {
                    "id": "obj-83f2852ebe",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5130.0, 140.0, 22.0 ],
                    "text": "pak arp_mode 0.",
                    "varname": "obj-pak-pattern"
                }
            },
            {
                "box": {
                    "id": "obj-91b8089f70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5130.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-pattern"
                }
            },
            {
                "box": {
                    "id": "obj-ce6eff68e1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5160.0, 140.0, 22.0 ],
                    "text": "pak arp_mode 0.",
                    "varname": "obj-pak-arp_mode"
                }
            },
            {
                "box": {
                    "id": "obj-c5993e07fb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5160.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-arp_mode"
                }
            },
            {
                "box": {
                    "id": "obj-e56fbe38c8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 5190.0, 140.0, 22.0 ],
                    "text": "pak tuning_system 0.",
                    "varname": "obj-pak-tuning"
                }
            },
            {
                "box": {
                    "id": "obj-92520d949f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 5190.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-stogen-tuning"
                }
            },
            {
                "box": {
                    "id": "obj-52292ca86c",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5200.0, 360.0, 36.0 ],
                    "text": "arp_mode 1, arp_div 1, arp_bpm 90, env_attack 0.002, env_decay 0.22, env_sustain 0, env_release 0.35",
                    "varname": "obj-voice-msg-voice_pluck"
                }
            },
            {
                "box": {
                    "id": "obj-b39a549279",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5200.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_pluck"
                }
            },
            {
                "box": {
                    "id": "obj-b97584cf54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5230.0, 411.0, 22.0 ],
                    "text": "arp_mode 0, env_attack 1.5, env_decay 1, env_sustain 0.85, env_release 3",
                    "varname": "obj-voice-msg-voice_pad"
                }
            },
            {
                "box": {
                    "id": "obj-df47f37642",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5230.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_pad"
                }
            },
            {
                "box": {
                    "id": "obj-c6e4a1ceea",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5260.0, 401.0, 22.0 ],
                    "text": "arp_mode 0, env_attack 3, env_decay 1, env_sustain 0.75, env_release 5",
                    "varname": "obj-voice-msg-voice_swell"
                }
            },
            {
                "box": {
                    "id": "obj-a4bf5ad1b2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5260.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_swell"
                }
            },
            {
                "box": {
                    "id": "obj-8c3f197d7b",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5290.0, 360.0, 36.0 ],
                    "text": "arp_mode 5, arp_div 4, arp_bpm 110, env_attack 0.002, env_decay 0.08, env_sustain 0, env_release 0.12",
                    "varname": "obj-voice-msg-voice_stab"
                }
            },
            {
                "box": {
                    "id": "obj-9fd5355be5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5290.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_stab"
                }
            },
            {
                "box": {
                    "id": "obj-237f5c16e9",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5320.0, 360.0, 36.0 ],
                    "text": "arp_mode 1, arp_div 2, arp_bpm 100, env_attack 0.001, env_decay 1.2, env_sustain 0, env_release 2.5",
                    "varname": "obj-voice-msg-voice_bell"
                }
            },
            {
                "box": {
                    "id": "obj-060f399db9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5320.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_bell"
                }
            },
            {
                "box": {
                    "id": "obj-0b87b592d9",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5350.0, 360.0, 36.0 ],
                    "text": "arp_mode 4, arp_div 4, arp_bpm 120, env_attack 0.01, env_decay 0.15, env_sustain 0.4, env_release 0.5",
                    "varname": "obj-voice-msg-voice_swarm"
                }
            },
            {
                "box": {
                    "id": "obj-bb397d2157",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5350.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_swarm"
                }
            },
            {
                "box": {
                    "id": "obj-07a0b999e3",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5380.0, 360.0, 36.0 ],
                    "text": "arp_mode 4, arp_div 1, arp_bpm 70, env_attack 0.5, env_decay 0.4, env_sustain 0.6, env_release 2.5, glide 0.1",
                    "varname": "obj-voice-msg-voice_drift"
                }
            },
            {
                "box": {
                    "id": "obj-ccac93c893",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5380.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_drift"
                }
            },
            {
                "box": {
                    "id": "obj-a1c14db9ac",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 5410.0, 477.0, 22.0 ],
                    "text": "arp_mode 0, arp_div 1, env_attack 0.05, env_decay 0.1, env_sustain 1, env_release 0.5",
                    "varname": "obj-voice-msg-voice_sus"
                }
            },
            {
                "box": {
                    "id": "obj-1dbcae46cb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 5410.0, 70.0, 22.0 ],
                    "text": "s toGen",
                    "varname": "obj-voice-send-voice_sus"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "maxmcpid-start", 0 ],
                    "source": [ "maxmcpid-auto-dly", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-auto-dly", 0 ],
                    "source": [ "maxmcpid-auto-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-node", 0 ],
                    "source": [ "maxmcpid-handler", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-v8", 0 ],
                    "source": [ "maxmcpid-handler", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-route", 0 ],
                    "source": [ "maxmcpid-node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-handler", 0 ],
                    "source": [ "maxmcpid-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-handler", 0 ],
                    "source": [ "maxmcpid-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-status", 1 ],
                    "source": [ "maxmcpid-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-node", 0 ],
                    "source": [ "maxmcpid-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-node", 0 ],
                    "source": [ "maxmcpid-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "maxmcpid-node", 0 ],
                    "source": [ "maxmcpid-v8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ea0578832a", 0 ],
                    "source": [ "obj-0015a7cb98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4dfeadc081", 1 ],
                    "source": [ "obj-05a231b551", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ccac93c893", 0 ],
                    "source": [ "obj-07a0b999e3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac6", 0 ],
                    "source": [ "obj-081196ed93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-02cd39d52b", 0 ],
                    "source": [ "obj-083b3ec941", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52292ca86c", 0 ],
                    "source": [ "obj-08b3f58d44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-l", 1 ],
                    "order": 1,
                    "source": [ "obj-09b42ea047", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-r", 1 ],
                    "order": 0,
                    "source": [ "obj-09b42ea047", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bb397d2157", 0 ],
                    "source": [ "obj-0b87b592d9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a87e0a5450", 0 ],
                    "source": [ "obj-0d43617b51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-smooth-sel", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22673fd57d", 1 ],
                    "source": [ "obj-1113cb479a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b45e7730f2", 1 ],
                    "source": [ "obj-12798f8935", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spread-tight", 0 ],
                    "source": [ "obj-19996fbb2a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-f4bb7b1433", 0 ],
                    "source": [ "obj-1d8e1b08d6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc25f46c57", 1 ],
                    "source": [ "obj-1e7c29ed64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac3", 0 ],
                    "source": [ "obj-1f595f90e8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-219ca6816b", 0 ],
                    "source": [ "obj-1fd6635700", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b97584cf54", 0 ],
                    "source": [ "obj-222f6424d6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a6009fe803", 0 ],
                    "source": [ "obj-22673fd57d", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-060f399db9", 0 ],
                    "source": [ "obj-237f5c16e9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b72e71ec8d", 0 ],
                    "source": [ "obj-2546119e57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-237f5c16e9", 0 ],
                    "source": [ "obj-2b0579a5fa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dr1", 0 ],
                    "source": [ "obj-2b85c1eb6f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1d49e67204", 0 ],
                    "source": [ "obj-2faa80ab7b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a1c14db9ac", 0 ],
                    "source": [ "obj-300ddd7a95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9776f2161f", 1 ],
                    "source": [ "obj-3761942f68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spread-med", 0 ],
                    "source": [ "obj-39bae18cd5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-d69fc85302", 0 ],
                    "source": [ "obj-3acc7ca796", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4e2ad0afc2", 0 ],
                    "source": [ "obj-3b93d52eeb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1eae2f93a4", 0 ],
                    "source": [ "obj-3f04f38866", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a506bdef52", 0 ],
                    "source": [ "obj-3f4f469cee", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-07a0b999e3", 0 ],
                    "source": [ "obj-3fc7bb8078", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-f223706aaa", 1 ],
                    "source": [ "obj-44607863c6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-419af1c049", 0 ],
                    "source": [ "obj-45e53bb3eb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-514a417c5e", 0 ],
                    "source": [ "obj-47007d425e", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ce6eff68e1", 1 ],
                    "source": [ "obj-48a4754ada", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5718f31920", 1 ],
                    "source": [ "obj-49e7d2a9d8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2faa80ab7b", 1 ],
                    "source": [ "obj-4ab31318b8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac2", 0 ],
                    "source": [ "obj-4c3c95e2e1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ca34350842", 0 ],
                    "source": [ "obj-4dfeadc081", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7eb8e47716", 1 ],
                    "source": [ "obj-4e7ad90d12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8c3f197d7b", 0 ],
                    "source": [ "obj-4efebc926c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b39a549279", 0 ],
                    "source": [ "obj-52292ca86c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2546119e57", 1 ],
                    "source": [ "obj-52767afabd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7127279253", 1 ],
                    "source": [ "obj-5318af3385", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-btn", 0 ],
                    "source": [ "obj-538283c4f2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp2", 0 ],
                    "source": [ "obj-543e539b33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-0d43617b51", 1 ],
                    "source": [ "obj-56bf809759", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c11da9b54f", 0 ],
                    "source": [ "obj-5718f31920", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1ff363bb2f", 0 ],
                    "source": [ "obj-575e2c286d", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5c1341f43b", 1 ],
                    "source": [ "obj-59cae48c7e", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dbddc0370a", 1 ],
                    "source": [ "obj-59e2799805", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a2effc8e5a", 1 ],
                    "source": [ "obj-59e79317ec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29e6a72e27", 0 ],
                    "source": [ "obj-5c1341f43b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-0015a7cb98", 1 ],
                    "source": [ "obj-601880ec63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bb42643dec", 1 ],
                    "source": [ "obj-63aae3ac5c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c0c1ec7ab5", 1 ],
                    "source": [ "obj-642ef442fa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7d69da17ee", 1 ],
                    "source": [ "obj-6f28dc6635", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2320c9c9ba", 0 ],
                    "source": [ "obj-7127279253", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac8", 0 ],
                    "source": [ "obj-791be0f64d", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2d3737cea9", 0 ],
                    "source": [ "obj-79942f7be6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9d9aeff2df", 0 ],
                    "source": [ "obj-79fc59c5d9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-db22eaea55", 1 ],
                    "source": [ "obj-7ba14fc212", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-d636406d2f", 0 ],
                    "source": [ "obj-7d69da17ee", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cdda1f3dd9", 0 ],
                    "source": [ "obj-7eaa99639a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ed372b4af2", 0 ],
                    "source": [ "obj-7eb8e47716", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-d4c1cdfdea", 0 ],
                    "source": [ "obj-7f3a514c11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7eaa99639a", 1 ],
                    "source": [ "obj-7fc2a7d3e2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp1", 0 ],
                    "source": [ "obj-806fe4ba29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec", 0 ],
                    "source": [ "obj-82a8b2470f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dd12297a74", 1 ],
                    "source": [ "obj-83c24ca31b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91b8089f70", 0 ],
                    "source": [ "obj-83f2852ebe", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45e53bb3eb", 1 ],
                    "source": [ "obj-859472de60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-e14adfb77a", 1 ],
                    "source": [ "obj-85b64623db", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac7", 0 ],
                    "source": [ "obj-86329d8e1f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1d8e1b08d6", 1 ],
                    "source": [ "obj-8add3ceb8c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c36d8d40bb", 1 ],
                    "source": [ "obj-8b80e0c86c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9fd5355be5", 0 ],
                    "source": [ "obj-8c3f197d7b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3f04f38866", 1 ],
                    "source": [ "obj-8f196dc9e6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2b2e1879f7", 0 ],
                    "source": [ "obj-8fbd9d2f7b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3acc7ca796", 1 ],
                    "source": [ "obj-943bf053fc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-869a4536ef", 0 ],
                    "source": [ "obj-9776f2161f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79fc59c5d9", 1 ],
                    "source": [ "obj-97de3a9df9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3cbbc473f1", 0 ],
                    "source": [ "obj-9ad1745859", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7f3a514c11", 1 ],
                    "source": [ "obj-9c3435377b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1fd6635700", 1 ],
                    "source": [ "obj-9e0d31611c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1dbcae46cb", 0 ],
                    "source": [ "obj-a1c14db9ac", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159b30a6fe", 0 ],
                    "source": [ "obj-a1ea8cbd47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-07c2070ac7", 0 ],
                    "source": [ "obj-a2effc8e5a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c6e4a1ceea", 0 ],
                    "source": [ "obj-a3d136461f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-l", 1 ],
                    "order": 1,
                    "source": [ "obj-a493b56788", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-r", 1 ],
                    "order": 0,
                    "source": [ "obj-a493b56788", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83c24ca31b", 0 ],
                    "source": [ "obj-a4d9c0d887", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9ad1745859", 1 ],
                    "source": [ "obj-a5bb9965ef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-081b41b024", 0 ],
                    "source": [ "obj-a84dbf90e7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4e6909e2c8", 0 ],
                    "source": [ "obj-a89f29b043", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-0b87b592d9", 0 ],
                    "source": [ "obj-a9bc630ec7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spread-wide", 0 ],
                    "source": [ "obj-ab4a5bf5ad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac1", 0 ],
                    "source": [ "obj-ac2a8db298", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac-label-send", 0 ],
                    "source": [ "obj-ac9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 1 ],
                    "source": [ "obj-adc-clk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-aizc-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizc-m", 0 ],
                    "source": [ "obj-aizc-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-aizd-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizd-m", 0 ],
                    "source": [ "obj-aizd-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-arpmode-msg", 0 ],
                    "source": [ "obj-arpmode-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-arp", 0 ],
                    "source": [ "obj-arpmode-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-arpmode-expr", 0 ],
                    "source": [ "obj-arpmode-umenu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-arp", 0 ],
                    "source": [ "obj-arpr-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-arpr-m", 0 ],
                    "source": [ "obj-arpr-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-adsr", 0 ],
                    "source": [ "obj-atk-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-atk-m", 0 ],
                    "source": [ "obj-atk-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-a-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-a-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-a-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-a-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-a-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b--1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-att-b-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dd016b91e4", 1 ],
                    "source": [ "obj-b2e7bb9944", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-d2f4de05fc", 0 ],
                    "source": [ "obj-b45e7730f2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6dda27f9b1", 0 ],
                    "source": [ "obj-b759daa5ff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-df47f37642", 0 ],
                    "source": [ "obj-b97584cf54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6f6906333f", 0 ],
                    "source": [ "obj-bb42643dec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-275babd901", 0 ],
                    "source": [ "obj-bd5ccc402c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2db251b4e2", 0 ],
                    "source": [ "obj-bda05beca1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-781d93b34a", 0 ],
                    "source": [ "obj-be27a1b854", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lor", 0 ],
                    "source": [ "obj-beta-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-beta-m", 0 ],
                    "source": [ "obj-beta-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-bmix-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bmix-m", 0 ],
                    "source": [ "obj-bmix-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-boct-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-boct-m", 0 ],
                    "source": [ "obj-boct-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-arp", 0 ],
                    "source": [ "obj-bpm-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bpm-m", 0 ],
                    "order": 0,
                    "source": [ "obj-bpm-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-render-p", 1 ],
                    "order": 1,
                    "source": [ "obj-bpm-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-brt-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-brt-m", 0 ],
                    "source": [ "obj-brt-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22204b5d58", 0 ],
                    "source": [ "obj-c0c1ec7ab5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-open-msg", 0 ],
                    "source": [ "obj-c12b4a8823", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp4", 0 ],
                    "source": [ "obj-c263452e44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-f3dcb2d9c1", 0 ],
                    "source": [ "obj-c36d8d40bb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3b93d52eeb", 1 ],
                    "source": [ "obj-c41fc2f4b4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-boost-l", 1 ],
                    "order": 1,
                    "source": [ "obj-c502c5170f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-boost-r", 1 ],
                    "order": 0,
                    "source": [ "obj-c502c5170f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a4bf5ad1b2", 0 ],
                    "source": [ "obj-c6e4a1ceea", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-camac-cgm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-camac-scg", 0 ],
                    "order": 0,
                    "source": [ "obj-camac-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-camac-srho", 0 ],
                    "order": 1,
                    "source": [ "obj-camac-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-camac-rhom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-camac-cgm", 0 ],
                    "source": [ "obj-camac-scg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-camac-rhom", 0 ],
                    "source": [ "obj-camac-srho", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp3", 0 ],
                    "source": [ "obj-cbcc6fbb31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bdb9921bda", 0 ],
                    "source": [ "obj-cc00cf8ae2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-736939a5d8", 0 ],
                    "source": [ "obj-cc25f46c57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c5993e07fb", 0 ],
                    "source": [ "obj-ce6eff68e1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bd5ccc402c", 1 ],
                    "source": [ "obj-cff0c133ea", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lor", 0 ],
                    "source": [ "obj-cg-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cg-m", 0 ],
                    "source": [ "obj-cg-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-chua_a-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chua_a-m", 0 ],
                    "source": [ "obj-chua_a-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-clk", 0 ],
                    "source": [ "obj-clk-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-clk-m", 0 ],
                    "source": [ "obj-clk-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-cm-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-cm-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-cm-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp-label-send", 0 ],
                    "source": [ "obj-cp1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp-label-send", 0 ],
                    "source": [ "obj-cp2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp-label-send", 0 ],
                    "source": [ "obj-cp3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cp-label-send", 0 ],
                    "source": [ "obj-cp4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a89f29b043", 1 ],
                    "source": [ "obj-d499a54229", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a84dbf90e7", 1 ],
                    "source": [ "obj-d58c15b359", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-a1ea8cbd47", 1 ],
                    "source": [ "obj-d5a9a0abc2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dr2", 0 ],
                    "source": [ "obj-d683030f80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3f4f469cee", 1 ],
                    "source": [ "obj-d8be5938b9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b759daa5ff", 1 ],
                    "source": [ "obj-dac01f4f2a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ff40645df9", 0 ],
                    "source": [ "obj-db22eaea55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5a4b9bfe2f", 0 ],
                    "source": [ "obj-dbddc0370a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-503316c7d7", 0 ],
                    "source": [ "obj-dd016b91e4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-b0f09d95fc", 0 ],
                    "source": [ "obj-dd12297a74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc00cf8ae2", 1 ],
                    "source": [ "obj-de790885a4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-adsr", 0 ],
                    "source": [ "obj-dec-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dec-m", 0 ],
                    "source": [ "obj-dec-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-mix-l", 1 ],
                    "source": [ "obj-dly-fb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-mix-r", 1 ],
                    "source": [ "obj-dly-fb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-tapin-l", 0 ],
                    "source": [ "obj-dly-mix-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-tapin-r", 0 ],
                    "source": [ "obj-dly-mix-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-tapout-l", 0 ],
                    "source": [ "obj-dly-tapin-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-tapout-r", 0 ],
                    "source": [ "obj-dly-tapin-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-fb-l", 0 ],
                    "order": 1,
                    "source": [ "obj-dly-tapout-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-l", 0 ],
                    "order": 0,
                    "source": [ "obj-dly-tapout-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-fb-r", 0 ],
                    "order": 1,
                    "source": [ "obj-dly-tapout-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-r", 0 ],
                    "order": 0,
                    "source": [ "obj-dly-tapout-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-l", 1 ],
                    "order": 1,
                    "source": [ "obj-dly-wet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-wet-r", 1 ],
                    "order": 0,
                    "source": [ "obj-dly-wet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-dly-wet-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 1 ],
                    "source": [ "obj-dly-wet-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dr-label-send", 0 ],
                    "source": [ "obj-dr1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dr-label-send", 0 ],
                    "source": [ "obj-dr2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-mode", 0 ],
                    "source": [ "obj-drone-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-sub", 0 ],
                    "source": [ "obj-drv-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drv-m", 0 ],
                    "source": [ "obj-drv-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lor", 0 ],
                    "source": [ "obj-dt-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dt-m", 0 ],
                    "source": [ "obj-dt-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fb8aa95699", 0 ],
                    "source": [ "obj-e14adfb77a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac4", 0 ],
                    "source": [ "obj-e35c9c9e79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-l", 1 ],
                    "order": 1,
                    "source": [ "obj-e43093a8bd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-r", 1 ],
                    "order": 0,
                    "source": [ "obj-e43093a8bd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac9", 0 ],
                    "source": [ "obj-e51de16c24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92520d949f", 0 ],
                    "source": [ "obj-e56fbe38c8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-083b3ec941", 1 ],
                    "source": [ "obj-e7c6b9706a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79942f7be6", 1 ],
                    "source": [ "obj-e89d47d5ab", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-arp", 0 ],
                    "source": [ "obj-ep-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ep-m", 0 ],
                    "source": [ "obj-ep-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-arp", 0 ],
                    "source": [ "obj-es-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-es-m", 0 ],
                    "source": [ "obj-es-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-be27a1b854", 1 ],
                    "source": [ "obj-f0d1cbac1b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37ad565dd8", 0 ],
                    "source": [ "obj-f223706aaa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8fbd9d2f7b", 1 ],
                    "source": [ "obj-f3fd4684da", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-575e2c286d", 1 ],
                    "source": [ "obj-f5918e3854", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac10", 0 ],
                    "source": [ "obj-f68a214e9b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47007d425e", 1 ],
                    "source": [ "obj-f68c0d6b73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ac5", 0 ],
                    "source": [ "obj-f7e99efbdf", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bda05beca1", 1 ],
                    "source": [ "obj-fc9ee5e17e", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-flex-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flex-m", 0 ],
                    "source": [ "obj-flex-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-l", 1 ],
                    "order": 1,
                    "source": [ "obj-flt-cutoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-r", 1 ],
                    "order": 0,
                    "source": [ "obj-flt-cutoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-flt-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 1 ],
                    "source": [ "obj-flt-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-tanh-l", 0 ],
                    "source": [ "obj-fx-boost-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-tanh-r", 0 ],
                    "source": [ "obj-fx-boost-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-c4dbeccb50", 0 ],
                    "order": 0,
                    "source": [ "obj-fx-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-mix-l", 0 ],
                    "order": 1,
                    "source": [ "obj-fx-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-l", 0 ],
                    "order": 2,
                    "source": [ "obj-fx-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec", 1 ],
                    "order": 4,
                    "source": [ "obj-fx-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-mix-l", 0 ],
                    "order": 3,
                    "source": [ "obj-fx-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64078c2a39", 0 ],
                    "order": 0,
                    "source": [ "obj-fx-tanh-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dly-mix-r", 0 ],
                    "order": 1,
                    "source": [ "obj-fx-tanh-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flt-r", 0 ],
                    "order": 3,
                    "source": [ "obj-fx-tanh-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-mix-r", 0 ],
                    "order": 2,
                    "source": [ "obj-fx-tanh-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-boost-l", 0 ],
                    "order": 1,
                    "source": [ "obj-gain-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-meter-l", 0 ],
                    "order": 0,
                    "source": [ "obj-gain-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fx-boost-r", 0 ],
                    "order": 1,
                    "source": [ "obj-gain-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-meter-r", 0 ],
                    "order": 0,
                    "source": [ "obj-gain-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chaos-sx", 0 ],
                    "source": [ "obj-gen", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chaos-sy", 0 ],
                    "source": [ "obj-gen", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chaos-sz", 0 ],
                    "source": [ "obj-gen", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-l", 0 ],
                    "order": 2,
                    "source": [ "obj-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-r", 0 ],
                    "order": 2,
                    "source": [ "obj-gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope-l", 0 ],
                    "order": 1,
                    "source": [ "obj-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope-r", 0 ],
                    "order": 1,
                    "source": [ "obj-gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-fbL", 0 ],
                    "order": 0,
                    "source": [ "obj-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-fbR", 0 ],
                    "order": 0,
                    "source": [ "obj-gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind-snap", 0 ],
                    "source": [ "obj-gen", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-glide-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-glide-m", 0 ],
                    "source": [ "obj-glide-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-gridbpm", 0 ],
                    "source": [ "obj-grid-bpm-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-grid-bpm-m", 0 ],
                    "source": [ "obj-grid-bpm-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-grid", 0 ],
                    "source": [ "obj-grid-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-halv_a-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-halv_a-m", 0 ],
                    "source": [ "obj-halv_a-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-init-msg", 0 ],
                    "source": [ "obj-init-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-init", 0 ],
                    "source": [ "obj-init-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-inv-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-inv-m", 0 ],
                    "source": [ "obj-inv-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 12 ],
                    "source": [ "obj-link-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-init-delay", 0 ],
                    "order": 5,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-def-link", 0 ],
                    "order": 1,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-def-m", 0 ],
                    "order": 2,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-def-n", 0 ],
                    "order": 3,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-lb", 0 ],
                    "order": 0,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-startdsp", 0 ],
                    "order": 4,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-link-tog", 0 ],
                    "source": [ "obj-lr-def-link", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-1", 0 ],
                    "order": 5,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-2", 0 ],
                    "order": 4,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-3", 0 ],
                    "order": 3,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-4", 0 ],
                    "order": 2,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-5", 0 ],
                    "order": 1,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vm-6", 0 ],
                    "order": 0,
                    "source": [ "obj-lr-def-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-1", 0 ],
                    "order": 5,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-2", 0 ],
                    "order": 4,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-3", 0 ],
                    "order": 3,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-4", 0 ],
                    "order": 2,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-5", 0 ],
                    "order": 1,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vn-6", 0 ],
                    "order": 0,
                    "source": [ "obj-lr-def-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lr", 0 ],
                    "source": [ "obj-lr-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-mdep-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mdep-m", 0 ],
                    "source": [ "obj-mdep-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-mg-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mg-m", 0 ],
                    "source": [ "obj-mg-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ml-p", 1 ],
                    "source": [ "obj-ml-menu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-ml", 0 ],
                    "source": [ "obj-ml-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ml-p", 0 ],
                    "source": [ "obj-ml-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-mute", 0 ],
                    "source": [ "obj-mute-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mute-m", 0 ],
                    "source": [ "obj-mute-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-trig", 0 ],
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-udp", 0 ],
                    "source": [ "obj-osc-pre-rms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-udp", 0 ],
                    "source": [ "obj-osc-pre-x", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-udp", 0 ],
                    "source": [ "obj-osc-pre-y", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-udp", 0 ],
                    "source": [ "obj-osc-pre-z", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-L", 0 ],
                    "source": [ "obj-osc-rcv-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-x", 0 ],
                    "source": [ "obj-osc-rcv-x", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-y", 0 ],
                    "source": [ "obj-osc-rcv-y", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-z", 0 ],
                    "source": [ "obj-osc-rcv-z", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-pre-rms", 0 ],
                    "source": [ "obj-osc-snap-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-pre-x", 0 ],
                    "source": [ "obj-osc-snap-x", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-pre-y", 0 ],
                    "source": [ "obj-osc-snap-y", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-pre-z", 0 ],
                    "source": [ "obj-osc-snap-z", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-metro", 0 ],
                    "source": [ "obj-osc-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-L", 1 ],
                    "source": [ "obj-osc-trig", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-x", 1 ],
                    "source": [ "obj-osc-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-y", 1 ],
                    "source": [ "obj-osc-trig", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-snap-z", 1 ],
                    "source": [ "obj-osc-trig", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-1", 0 ],
                    "order": 1,
                    "source": [ "obj-plen-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-2", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 1 ],
                    "order": 1,
                    "source": [ "obj-plen-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-3", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 2 ],
                    "order": 1,
                    "source": [ "obj-plen-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-4", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 3 ],
                    "order": 1,
                    "source": [ "obj-plen-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-5", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 4 ],
                    "order": 1,
                    "source": [ "obj-plen-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-m-6", 0 ],
                    "order": 0,
                    "source": [ "obj-plen-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-plen-pack", 5 ],
                    "order": 1,
                    "source": [ "obj-plen-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-1", 0 ],
                    "source": [ "obj-plen-m-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-2", 0 ],
                    "source": [ "obj-plen-m-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-3", 0 ],
                    "source": [ "obj-plen-m-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-4", 0 ],
                    "source": [ "obj-plen-m-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-5", 0 ],
                    "source": [ "obj-plen-m-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-plen-6", 0 ],
                    "source": [ "obj-plen-m-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 4 ],
                    "source": [ "obj-pm-adsr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 5 ],
                    "source": [ "obj-pm-chaos", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 7 ],
                    "source": [ "obj-pm-glide", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-send", 0 ],
                    "source": [ "obj-pm-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 1 ],
                    "source": [ "obj-pm-pattern", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 2 ],
                    "source": [ "obj-pm-rho", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 3 ],
                    "source": [ "obj-pm-roots", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 6 ],
                    "source": [ "obj-pm-spring", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pm-js", 0 ],
                    "source": [ "obj-pm-tuning", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-poly", 0 ],
                    "source": [ "obj-poly-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-poly-msg", 0 ],
                    "source": [ "obj-poly-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-r-toGen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-js", 1 ],
                    "source": [ "obj-rate-dot", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 13 ],
                    "order": 0,
                    "source": [ "obj-rate-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-pre", 0 ],
                    "order": 1,
                    "source": [ "obj-rate-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-umenu", 0 ],
                    "source": [ "obj-rate-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-rate", 0 ],
                    "source": [ "obj-rate-pre", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-js", 1 ],
                    "source": [ "obj-rate-str", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-js", 1 ],
                    "source": [ "obj-rate-trp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-js", 0 ],
                    "source": [ "obj-rate-umenu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rcc-scl", 0 ],
                    "source": [ "obj-rcc-ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-rcc-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rcc-prep", 0 ],
                    "order": 0,
                    "source": [ "obj-rcc-scl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-roff-n", 0 ],
                    "order": 1,
                    "source": [ "obj-rcc-scl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-open-msg", 0 ],
                    "source": [ "obj-rec-open-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec", 0 ],
                    "source": [ "obj-rec-open-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-reg-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reg-m", 0 ],
                    "source": [ "obj-reg-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-adsr", 0 ],
                    "source": [ "obj-rel-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rel-m", 0 ],
                    "source": [ "obj-rel-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-render-p", 0 ],
                    "source": [ "obj-render-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-render-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-res-def", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-del", 0 ],
                    "order": 0,
                    "source": [ "obj-reset-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-on", 0 ],
                    "order": 1,
                    "source": [ "obj-reset-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-off", 0 ],
                    "source": [ "obj-reset-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-reset", 0 ],
                    "source": [ "obj-reset-off", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-reset", 0 ],
                    "source": [ "obj-reset-on", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-mix-r", 1 ],
                    "source": [ "obj-rev-fb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-mix-l", 1 ],
                    "source": [ "obj-rev-fb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-tapin-l", 0 ],
                    "source": [ "obj-rev-mix-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-tapin-r", 0 ],
                    "source": [ "obj-rev-mix-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-tapout-l", 0 ],
                    "source": [ "obj-rev-tapin-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-tapout-r", 0 ],
                    "source": [ "obj-rev-tapin-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-fb-l", 0 ],
                    "order": 1,
                    "source": [ "obj-rev-tapout-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-l", 0 ],
                    "order": 0,
                    "source": [ "obj-rev-tapout-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-fb-r", 0 ],
                    "order": 1,
                    "source": [ "obj-rev-tapout-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-r", 0 ],
                    "order": 0,
                    "source": [ "obj-rev-tapout-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-l", 1 ],
                    "order": 1,
                    "source": [ "obj-rev-wet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rev-wet-r", 1 ],
                    "order": 0,
                    "source": [ "obj-rev-wet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-rev-wet-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 1 ],
                    "source": [ "obj-rev-wet-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lor", 0 ],
                    "source": [ "obj-rho-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rho-m", 0 ],
                    "source": [ "obj-rho-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-rmod-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rmod-m", 0 ],
                    "source": [ "obj-rmod-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-roff-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-roff-m", 0 ],
                    "source": [ "obj-roff-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-res", 0 ],
                    "source": [ "obj-root-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-root-m", 0 ],
                    "source": [ "obj-root-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-att", 0 ],
                    "source": [ "obj-ross_c-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ross_c-m", 0 ],
                    "source": [ "obj-ross_c-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-rret-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rret-m", 0 ],
                    "source": [ "obj-rret-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-sub", 0 ],
                    "source": [ "obj-sch-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sch-m", 0 ],
                    "source": [ "obj-sch-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-sub", 0 ],
                    "source": [ "obj-sdr-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sdr-m", 0 ],
                    "source": [ "obj-sdr-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-mode", 0 ],
                    "source": [ "obj-seq-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-lor", 0 ],
                    "source": [ "obj-sigma-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sigma-m", 0 ],
                    "source": [ "obj-sigma-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-smooth", 0 ],
                    "source": [ "obj-sm-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-smooth", 0 ],
                    "source": [ "obj-sm-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-smooth", 0 ],
                    "source": [ "obj-sm-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-smooth", 0 ],
                    "source": [ "obj-sm-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-smooth-send", 0 ],
                    "source": [ "obj-smooth-off", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-smooth-send", 0 ],
                    "source": [ "obj-smooth-on", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-smooth-off", 0 ],
                    "source": [ "obj-smooth-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-smooth-on", 0 ],
                    "source": [ "obj-smooth-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-sub", 0 ],
                    "source": [ "obj-soct-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-soct-m", 0 ],
                    "source": [ "obj-soct-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-spread", 0 ],
                    "source": [ "obj-spread-med", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-spread", 0 ],
                    "source": [ "obj-spread-tight", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-spread", 0 ],
                    "source": [ "obj-spread-wide", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-startdsp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind-trig", 0 ],
                    "source": [ "obj-stepind-change", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind", 0 ],
                    "source": [ "obj-stepind-clear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind", 0 ],
                    "source": [ "obj-stepind-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind-change", 0 ],
                    "source": [ "obj-stepind-snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind-clear", 0 ],
                    "source": [ "obj-stepind-trig", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stepind-pak", 0 ],
                    "source": [ "obj-stepind-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-sub", 0 ],
                    "source": [ "obj-sub-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sub-m", 0 ],
                    "source": [ "obj-sub-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-adsr", 0 ],
                    "source": [ "obj-sus-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sus-m", 0 ],
                    "source": [ "obj-sus-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-t", 0 ],
                    "source": [ "obj-tap-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-grid-bpm-n", 0 ],
                    "source": [ "obj-tap-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-timer", 1 ],
                    "source": [ "obj-tap-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-timer", 0 ],
                    "source": [ "obj-tap-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-expr", 0 ],
                    "source": [ "obj-tap-timer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-toct-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toct-m", 0 ],
                    "source": [ "obj-toct-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-trn-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-trn-m", 0 ],
                    "source": [ "obj-trn-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-tun", 0 ],
                    "source": [ "obj-ts-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ts-m", 0 ],
                    "source": [ "obj-ts-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-grid-js", 0 ],
                    "source": [ "obj-ugrid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-grid", 0 ],
                    "source": [ "obj-ugrid-act", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-grid", 0 ],
                    "source": [ "obj-upl-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-upl-m", 0 ],
                    "source": [ "obj-upl-n", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 6 ],
                    "source": [ "obj-vm-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 7 ],
                    "source": [ "obj-vm-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 8 ],
                    "source": [ "obj-vm-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 9 ],
                    "source": [ "obj-vm-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 10 ],
                    "source": [ "obj-vm-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 11 ],
                    "source": [ "obj-vm-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 0 ],
                    "source": [ "obj-vn-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 1 ],
                    "source": [ "obj-vn-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 2 ],
                    "source": [ "obj-vn-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 3 ],
                    "source": [ "obj-vn-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 4 ],
                    "source": [ "obj-vn-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lr-js", 5 ],
                    "source": [ "obj-vn-6", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-081196ed93": [ "ac_lr_blend", "ac_lr_blend", 0 ],
            "obj-08b3f58d44": [ "voice_pluck", "voice_pluck", 0 ],
            "obj-09b42ea047": [ "dly_wet", "Delay", 0 ],
            "obj-0c50f362a9": [ "pat_clear", "pat_clear", 0 ],
            "obj-1113cb479a": [ "blend_mix", "Mix", 0 ],
            "obj-12798f8935": [ "beta", "Beta", 0 ],
            "obj-189f4646cd": [ "pat_c", "pat_c", 0 ],
            "obj-19996fbb2a": [ "spr_tight", "spr_tight", 0 ],
            "obj-1e7c29ed64": [ "brightness", "Bright", 0 ],
            "obj-1f595f90e8": [ "ac_chua", "ac_chua", 0 ],
            "obj-222f6424d6": [ "voice_pad", "voice_pad", 0 ],
            "obj-2b0579a5fa": [ "voice_bell", "voice_bell", 0 ],
            "obj-2b85c1eb6f": [ "dr_root", "dr_root", 0 ],
            "obj-300ddd7a95": [ "voice_sus", "voice_sus", 0 ],
            "obj-31c7217357": [ "vel_range", "Range", 0 ],
            "obj-37501ee07f": [ "pat_d", "pat_d", 0 ],
            "obj-3761942f68": [ "chua_beta", "Beta", 0 ],
            "obj-39bae18cd5": [ "spr_med", "spr_med", 0 ],
            "obj-3c698773f9": [ "pat_a", "pat_a", 0 ],
            "obj-3fc7bb8078": [ "voice_drift", "voice_drift", 0 ],
            "obj-44607863c6": [ "m_recall", "Recall", 0 ],
            "obj-49e7d2a9d8": [ "dt", "Time", 0 ],
            "obj-4ab31318b8": [ "chua_m0", "m0", 0 ],
            "obj-4c3c95e2e1": [ "ac_rossler", "ac_rossler", 0 ],
            "obj-4e7ad90d12": [ "sub_drive", "Drive", 0 ],
            "obj-4efebc926c": [ "voice_stab", "voice_stab", 0 ],
            "obj-52767afabd": [ "flex", "Flex", 0 ],
            "obj-530c055edb": [ "pat_rand", "pat_rand", 0 ],
            "obj-5318af3385": [ "env_s", "Sustain", 0 ],
            "obj-538283c4f2": [ "reset", "reset", 0 ],
            "obj-543e539b33": [ "cp_cluster", "cp_cluster", 0 ],
            "obj-59cae48c7e": [ "glide", "Glide", 0 ],
            "obj-59e2799805": [ "mute", "mute", 0 ],
            "obj-59e79317ec": [ "mod_depth", "Mod", 0 ],
            "obj-601880ec63": [ "rho", "Rho", 0 ],
            "obj-63a334a856": [ "lor_dt", "Dt", 0 ],
            "obj-63aae3ac5c": [ "m_heat", "Heat", 0 ],
            "obj-642ef442fa": [ "chaos", "Chaos", 0 ],
            "obj-686b779b5f": [ "swing", "Swing", 0 ],
            "obj-6f28dc6635": [ "aiz_b", "B", 0 ],
            "obj-791be0f64d": [ "ac_lh_route", "ac_lh_route", 0 ],
            "obj-7ba14fc212": [ "rootspring", "Spring", 0 ],
            "obj-7f61a58416": [ "play", "play", 0 ],
            "obj-7fc2a7d3e2": [ "env_a", "Attack", 0 ],
            "obj-806fe4ba29": [ "cp_yoruba", "cp_yoruba", 0 ],
            "obj-82a8b2470f": [ "rec_arm", "rec_arm", 0 ],
            "obj-859472de60": [ "sub_amt", "Level", 0 ],
            "obj-85b64623db": [ "m_mouth", "Mouth", 0 ],
            "obj-86329d8e1f": [ "ac_lc_mod", "ac_lc_mod", 0 ],
            "obj-8add3ceb8c": [ "sub_chaos", "Chaos", 0 ],
            "obj-8f196dc9e6": [ "aiz_c", "C", 0 ],
            "obj-933178776a": [ "rho_l_p", "Rho", 0 ],
            "obj-943bf053fc": [ "aiz_d", "D", 0 ],
            "obj-97de3a9df9": [ "aiz_a", "A", 0 ],
            "obj-9c3435377b": [ "ross_c", "C", 0 ],
            "obj-9e0d31611c": [ "m_choir", "Choir", 0 ],
            "obj-a3d136461f": [ "voice_swell", "voice_swell", 0 ],
            "obj-a493b56788": [ "rev_wet", "Reverb", 0 ],
            "obj-a9bc630ec7": [ "voice_swarm", "voice_swarm", 0 ],
            "obj-ab4a5bf5ad": [ "spr_wide", "spr_wide", 0 ],
            "obj-ac2a8db298": [ "ac_lorenz", "ac_lorenz", 0 ],
            "obj-b78ffe5fdf": [ "tap", "tap", 0 ],
            "obj-b9ed3fdef7": [ "pat_b", "pat_b", 0 ],
            "obj-c05af64fa5": [ "prob", "Prob", 0 ],
            "obj-c118bffe48": [ "dly_time", "Time", 0 ],
            "obj-c12b4a8823": [ "rec_open", "rec_open", 0 ],
            "obj-c263452e44": [ "cp_subdrone", "cp_subdrone", 0 ],
            "obj-c41fc2f4b4": [ "master", "Master", 0 ],
            "obj-c502c5170f": [ "drive", "Drive", 0 ],
            "obj-cbcc6fbb31": [ "cp_fifths", "cp_fifths", 0 ],
            "obj-cff0c133ea": [ "ross_b", "B", 0 ],
            "obj-d499a54229": [ "m_melt", "Melt", 0 ],
            "obj-d58c15b359": [ "halv_a", "A", 0 ],
            "obj-d5a9a0abc2": [ "sigma", "Sigma", 0 ],
            "obj-d683030f80": [ "dr_fifth", "dr_fifth", 0 ],
            "obj-d8be5938b9": [ "env_r", "Release", 0 ],
            "obj-dac01f4f2a": [ "m_ritual", "Ritual", 0 ],
            "obj-de790885a4": [ "m_split", "Split", 0 ],
            "obj-e35c9c9e79": [ "ac_halvorsen", "ac_halvorsen", 0 ],
            "obj-e43093a8bd": [ "filter", "Tone", 0 ],
            "obj-e51de16c24": [ "ac_ra_mod", "ac_ra_mod", 0 ],
            "obj-e89d47d5ab": [ "ross_a", "A", 0 ],
            "obj-f33f6c9f8d": [ "pat_copy", "pat_copy", 0 ],
            "obj-f3fd4684da": [ "sub_oct", "Octave", 0 ],
            "obj-f5918e3854": [ "env_d", "Decay", 0 ],
            "obj-f68a214e9b": [ "ac_ha_blend", "ac_ha_blend", 0 ],
            "obj-f68c0d6b73": [ "chua_alpha", "Alpha", 0 ],
            "obj-f7e99efbdf": [ "ac_aizawa", "ac_aizawa", 0 ],
            "obj-fc9ee5e17e": [ "m_ghost", "Ghost", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}