{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 6,
			"revision": 0,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			34,
			76,
			1400,
			900
		],
		"bglocked": 0,
		"openinpresentation": 1,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "FEEDBACK \u2014 VEVE TOPOLOGY INSTRUMENT\n\nKuramoto coupled oscillators with veve adjacency matrices\ndrive 6 heterogeneous Karplus-Strong resonators.\n19 African tuning systems. OSC \u2192 TouchDesigner (port 7000).\n\n1. Turn on ezdac~\n2. Select veve preset (topology)\n3. Adjust K (coupling) \u2014 sweet spot 0.3-0.7\n4. Adjust Root, Tuning, Drive",
					"patching_rect": [
						15,
						15,
						420,
						150
					],
					"fontsize": 12.0,
					"linecount": 10,
					"varname": "obj-title"
				}
			},
			{
				"box": {
					"id": "obj-ezdac",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						15,
						180,
						45,
						45
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						10,
						45,
						45
					],
					"varname": "obj-ezdac"
				}
			},
			{
				"box": {
					"id": "obj-loadbang",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "loadbang",
					"patching_rect": [
						200,
						180,
						55,
						22
					],
					"varname": "obj-loadbang"
				}
			},
			{
				"box": {
					"id": "obj-startdsp",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "startwindow",
					"patching_rect": [
						200,
						210,
						75,
						22
					],
					"varname": "obj-startdsp"
				}
			},
			{
				"box": {
					"id": "obj-dac-msg",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "dac~",
					"patching_rect": [
						200,
						240,
						35,
						22
					],
					"varname": "obj-dac-msg"
				}
			},
			{
				"box": {
					"id": "obj-comment-veve",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 VEVE TOPOLOGY (adjacency matrix) \u2500\u2500",
					"patching_rect": [
						15,
						275,
						350,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-comment-veve"
				}
			},
			{
				"box": {
					"id": "obj-veve-buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ veve_adj 6 6",
					"patching_rect": [
						15,
						305,
						130,
						22
					],
					"varname": "obj-veve-buf"
				}
			},
			{
				"box": {
					"id": "obj-veve-loader",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"text": "js veve_loader.js",
					"patching_rect": [
						160,
						305,
						110,
						22
					],
					"varname": "obj-veve-loader"
				}
			},
			{
				"box": {
					"id": "obj-veve-menu",
					"maxclass": "umenu",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"",
						""
					],
					"patching_rect": [
						290,
						305,
						140,
						22
					],
					"items": [
						"All-to-all",
						",",
						"Legba Carrefour",
						",",
						"Carrefour Diamond",
						",",
						"Ferraille",
						",",
						"Ogou Bhathalah",
						",",
						"Legba co-sou",
						",",
						"Marassa"
					],
					"presentation": 1,
					"presentation_rect": [
						70,
						10,
						140,
						22
					],
					"varname": "obj-veve-menu"
				}
			},
			{
				"box": {
					"id": "obj-veve-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Veve:",
					"patching_rect": [
						290,
						288,
						40,
						18
					],
					"fontsize": 11.0,
					"varname": "obj-veve-label"
				}
			},
			{
				"box": {
					"id": "obj-veve-init",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "init",
					"patching_rect": [
						160,
						280,
						35,
						22
					],
					"varname": "obj-veve-init"
				}
			},
			{
				"box": {
					"id": "obj-veve-status",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "",
					"patching_rect": [
						160,
						335,
						180,
						22
					],
					"varname": "obj-veve-status"
				}
			},
			{
				"box": {
					"id": "obj-comment-kuramoto",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 KURAMOTO COUPLED RHYTHM ENGINE \u2500\u2500",
					"patching_rect": [
						15,
						370,
						400,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-comment-kuramoto"
				}
			},
			{
				"box": {
					"id": "obj-K",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15,
						400,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "K",
							"parameter_shortname": "K",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						10,
						50,
						50,
						48
					],
					"varname": "obj-K"
				}
			},
			{
				"box": {
					"id": "obj-tempo",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						80,
						400,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Tempo",
							"parameter_shortname": "Tempo",
							"parameter_type": 0,
							"parameter_mmin": 30.0,
							"parameter_mmax": 300.0,
							"parameter_initial": [
								120
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 4
						}
					},
					"presentation": 1,
					"presentation_rect": [
						70,
						50,
						50,
						48
					],
					"varname": "obj-tempo"
				}
			},
			{
				"box": {
					"id": "obj-trigwidth",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						145,
						400,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "TrigWidth",
							"parameter_shortname": "Trig",
							"parameter_type": 0,
							"parameter_mmin": 0.0001,
							"parameter_mmax": 0.05,
							"parameter_initial": [
								0.001
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						130,
						50,
						50,
						48
					],
					"varname": "obj-trigwidth"
				}
			},
			{
				"box": {
					"id": "obj-K-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend K",
					"patching_rect": [
						15,
						455,
						63,
						22
					],
					"varname": "obj-K-prep"
				}
			},
			{
				"box": {
					"id": "obj-tempo-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend tempo",
					"patching_rect": [
						80,
						455,
						91,
						22
					],
					"varname": "obj-tempo-prep"
				}
			},
			{
				"box": {
					"id": "obj-trig-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend trig_width",
					"patching_rect": [
						145,
						455,
						126,
						22
					],
					"varname": "obj-trig-prep"
				}
			},
			{
				"box": {
					"id": "obj-kuramoto",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 14,
					"outlettype": [
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal"
					],
					"text": "gen~ @gen kuramoto_veve",
					"patching_rect": [
						15,
						490,
						560,
						22
					],
					"varname": "obj-kuramoto"
				}
			},
			{
				"box": {
					"id": "obj-comment-resonator",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 RESONATOR ENSEMBLE (6 voices, 19 tuning systems) \u2500\u2500",
					"patching_rect": [
						15,
						525,
						450,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-comment-resonator"
				}
			},
			{
				"box": {
					"id": "obj-root",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15,
						555,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Root",
							"parameter_shortname": "Root",
							"parameter_type": 0,
							"parameter_mmin": 20.0,
							"parameter_mmax": 880.0,
							"parameter_initial": [
								110
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 3
						}
					},
					"presentation": 1,
					"presentation_rect": [
						10,
						110,
						50,
						48
					],
					"varname": "obj-root"
				}
			},
			{
				"box": {
					"id": "obj-flex",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						80,
						555,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Flex",
							"parameter_shortname": "Flex",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						70,
						110,
						50,
						48
					],
					"varname": "obj-flex"
				}
			},
			{
				"box": {
					"id": "obj-tuning",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						145,
						555,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Tuning",
							"parameter_shortname": "Tuning",
							"parameter_type": 1,
							"parameter_mmin": 0,
							"parameter_mmax": 18,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					},
					"presentation": 1,
					"presentation_rect": [
						130,
						110,
						50,
						48
					],
					"varname": "obj-tuning"
				}
			},
			{
				"box": {
					"id": "obj-drive",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						210,
						555,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Drive",
							"parameter_shortname": "Drive",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						190,
						110,
						50,
						48
					],
					"varname": "obj-drive"
				}
			},
			{
				"box": {
					"id": "obj-root-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend root",
					"patching_rect": [
						15,
						610,
						84,
						22
					],
					"varname": "obj-root-prep"
				}
			},
			{
				"box": {
					"id": "obj-flex-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend flex",
					"patching_rect": [
						80,
						610,
						84,
						22
					],
					"varname": "obj-flex-prep"
				}
			},
			{
				"box": {
					"id": "obj-tuning-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend tuning_system",
					"patching_rect": [
						145,
						610,
						147,
						22
					],
					"varname": "obj-tuning-prep"
				}
			},
			{
				"box": {
					"id": "obj-drive-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend drive",
					"patching_rect": [
						210,
						610,
						91,
						22
					],
					"varname": "obj-drive-prep"
				}
			},
			{
				"box": {
					"id": "obj-resonator",
					"maxclass": "newobj",
					"numinlets": 6,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"text": "gen~",
					"patching_rect": [
						15,
						645,
						560,
						22
					],
					"patcher": {
						"fileversion": 1,
						"appversion": {
							"major": 8,
							"minor": 6,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "dsp.gen",
						"rect": [
							0,
							0,
							900,
							700
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12.0,
						"default_fontface": 0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15.0,
							15.0
						],
						"gridsnaponopen": 1,
						"objectsnaponopen": 1,
						"statusbarvisible": 2,
						"toolbarvisible": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-codebox",
									"maxclass": "codebox",
									"numinlets": 6,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										150.0,
										150.0,
										600.0,
										400.0
									],
									"code": "Param root(110);\nParam flex(0.5);              \nParam tuning_system(0);       \nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);    \nParam deg4(4);\nParam deg5(0);    \nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam drive(0.5);\nParam decay(0.3);\nData tuning_table(190);\nHistory init_done(0);\nHistory r1_pt(0);\nHistory r1_ec(0);\nHistory r1_pd(0);\nHistory r2_pt(0);\nHistory r2_ec(0);\nHistory r2_pd(0);\nHistory r3_pt(0);\nHistory r3_ec(0);\nHistory r3_pd(0);\nHistory r4_pt(0);\nHistory r4_ec(0);\nHistory r4_pd(0);\nHistory r5_pt(0);\nHistory r5_ec(0);\nHistory r5_pd(0);\nHistory r6_pt(0);\nHistory r6_ec(0);\nHistory r6_pd(0);\nHistory r1_vel(1);\nHistory r2_vel(1);\nHistory r3_vel(1);\nHistory r4_vel(1);\nHistory r5_vel(1);\nHistory r6_vel(1);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\nif (init_done < 0.5) {\n    poke(tuning_table, 5, 0, 0);\n    poke(tuning_table, 1.0, 1, 0);\n    poke(tuning_table, 1.125, 2, 0);\n    poke(tuning_table, 1.265625, 3, 0);\n    poke(tuning_table, 1.5, 4, 0);\n    poke(tuning_table, 1.6875, 5, 0);\n    poke(tuning_table, 3, 10, 0);\n    poke(tuning_table, 1.0, 11, 0);\n    poke(tuning_table, 1.12246, 12, 0);\n    poke(tuning_table, 1.25992, 13, 0);\n    poke(tuning_table, 5, 20, 0);\n    poke(tuning_table, 1.0, 21, 0);\n    poke(tuning_table, 1.13534, 22, 0);\n    poke(tuning_table, 1.30486, 23, 0);\n    poke(tuning_table, 1.49180, 24, 0);\n    poke(tuning_table, 1.71002, 25, 0);\n    poke(tuning_table, 7, 30, 0);\n    poke(tuning_table, 1.0, 31, 0);\n    poke(tuning_table, 1.10409, 32, 0);\n    poke(tuning_table, 1.21901, 33, 0);\n    poke(tuning_table, 1.34590, 34, 0);\n    poke(tuning_table, 1.48599, 35, 0);\n    poke(tuning_table, 1.64059, 36, 0);\n    poke(tuning_table, 1.81145, 37, 0);\n    poke(tuning_table, 5, 40, 0);\n    poke(tuning_table, 1.0, 41, 0);\n    poke(tuning_table, 1.14870, 42, 0);\n    poke(tuning_table, 1.31951, 43, 0);\n    poke(tuning_table, 1.51572, 44, 0);\n    poke(tuning_table, 1.74110, 45, 0);\n    poke(tuning_table, 7, 50, 0);\n    poke(tuning_table, 1.0, 51, 0);\n    poke(tuning_table, 1.10957, 52, 0);\n    poke(tuning_table, 1.24574, 53, 0);\n    poke(tuning_table, 1.33484, 54, 0);\n    poke(tuning_table, 1.49831, 55, 0);\n    poke(tuning_table, 1.65948, 56, 0);\n    poke(tuning_table, 1.86121, 57, 0);\n    poke(tuning_table, 7, 60, 0);\n    poke(tuning_table, 1.0, 61, 0);\n    poke(tuning_table, 1.05946, 62, 0);\n    poke(tuning_table, 1.18921, 63, 0);\n    poke(tuning_table, 1.33484, 64, 0);\n    poke(tuning_table, 1.49831, 65, 0);\n    poke(tuning_table, 1.58740, 66, 0);\n    poke(tuning_table, 1.78180, 67, 0);\n    poke(tuning_table, 7, 70, 0);\n    poke(tuning_table, 1.0, 71, 0);\n    poke(tuning_table, 1.12246, 72, 0);\n    poke(tuning_table, 1.24915, 73, 0);\n    poke(tuning_table, 1.33484, 74, 0);\n    poke(tuning_table, 1.49831, 75, 0);\n    poke(tuning_table, 1.68179, 76, 0);\n    poke(tuning_table, 1.86459, 77, 0);\n    poke(tuning_table, 7, 80, 0);\n    poke(tuning_table, 1.0, 81, 0);\n    poke(tuning_table, 1.11278, 82, 0);\n    poke(tuning_table, 1.26330, 83, 0);\n    poke(tuning_table, 1.41747, 84, 0);\n    poke(tuning_table, 1.49831, 85, 0);\n    poke(tuning_table, 1.66230, 86, 0);\n    poke(tuning_table, 1.88800, 87, 0);\n    poke(tuning_table, 5, 90, 0);\n    poke(tuning_table, 1.0, 91, 0);\n    poke(tuning_table, 1.12246, 92, 0);\n    poke(tuning_table, 1.25992, 93, 0);\n    poke(tuning_table, 1.49831, 94, 0);\n    poke(tuning_table, 1.68179, 95, 0);\n    poke(tuning_table, 5, 100, 0);\n    poke(tuning_table, 1.0, 101, 0);\n    poke(tuning_table, 1.12246, 102, 0);\n    poke(tuning_table, 1.18921, 103, 0);\n    poke(tuning_table, 1.49831, 104, 0);\n    poke(tuning_table, 1.58740, 105, 0);\n    poke(tuning_table, 5, 110, 0);\n    poke(tuning_table, 1.0, 111, 0);\n    poke(tuning_table, 1.12246, 112, 0);\n    poke(tuning_table, 1.33484, 113, 0);\n    poke(tuning_table, 1.49831, 114, 0);\n    poke(tuning_table, 1.68179, 115, 0);\n    poke(tuning_table, 5, 120, 0);\n    poke(tuning_table, 1.0, 121, 0);\n    poke(tuning_table, 1.12246, 122, 0);\n    poke(tuning_table, 1.25992, 123, 0);\n    poke(tuning_table, 1.49831, 124, 0);\n    poke(tuning_table, 1.58740, 125, 0);\n    poke(tuning_table, 5, 130, 0);\n    poke(tuning_table, 1.0, 131, 0);\n    poke(tuning_table, 1.05946, 132, 0);\n    poke(tuning_table, 1.33484, 133, 0);\n    poke(tuning_table, 1.41421, 134, 0);\n    poke(tuning_table, 1.68179, 135, 0);\n    poke(tuning_table, 5, 140, 0);\n    poke(tuning_table, 1.0, 141, 0);\n    poke(tuning_table, 1.14870, 142, 0);\n    poke(tuning_table, 1.31951, 143, 0);\n    poke(tuning_table, 1.51572, 144, 0);\n    poke(tuning_table, 1.74110, 145, 0);\n    poke(tuning_table, 7, 150, 0);\n    poke(tuning_table, 1.0, 151, 0);\n    poke(tuning_table, 1.10653, 152, 0);\n    poke(tuning_table, 1.22082, 153, 0);\n    poke(tuning_table, 1.34890, 154, 0);\n    poke(tuning_table, 1.48160, 155, 0);\n    poke(tuning_table, 1.63720, 156, 0);\n    poke(tuning_table, 1.80699, 157, 0);\n    poke(tuning_table, 6, 160, 0);\n    poke(tuning_table, 1.0, 161, 0);\n    poke(tuning_table, 1.12246, 162, 0);\n    poke(tuning_table, 1.24984, 163, 0);\n    poke(tuning_table, 1.33322, 164, 0);\n    poke(tuning_table, 1.50000, 165, 0);\n    poke(tuning_table, 1.66212, 166, 0);\n    poke(tuning_table, 6, 170, 0);\n    poke(tuning_table, 1.0, 171, 0);\n    poke(tuning_table, 1.25, 172, 0);\n    poke(tuning_table, 1.5, 173, 0);\n    poke(tuning_table, 1.75, 174, 0);\n    poke(tuning_table, 2.0, 175, 0);\n    poke(tuning_table, 2.25, 176, 0);\n    poke(tuning_table, 5, 180, 0);\n    poke(tuning_table, 1.0, 181, 0);\n    poke(tuning_table, 1.12246, 182, 0);\n    poke(tuning_table, 1.24984, 183, 0);\n    poke(tuning_table, 1.50000, 184, 0);\n    poke(tuning_table, 1.66212, 185, 0);\n    init_done = 1;\n}\nts = clamp(floor(tuning_system), 0, 18);\nts_base = ts * 10;\nts_size = peek(tuning_table, ts_base, 0);\nts_size = max(ts_size, 1);\nj0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;\ndc = clamp(decay, 0, 1);\nd1_damp = 0.5 + dc * 0.4995;     \nd2_damp = 0.4 + dc * 0.598;      \nd3_damp = 0.3 + dc * 0.696;      \nd4_damp = 0.2 + dc * 0.77;       \nd5_damp = 0.4 + dc * 0.5998;     \nd6_damp = 0.3 + dc * 0.694;      \ndeg1_w = mod(floor(deg1), ts_size);\noct1_x = floor(deg1 / ts_size);\nr1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);\nr1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;\nr1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;\nr1_freq = root * r1_rat * pow(2.0, oct1 + oct1_x);\nr1_dlen = samplerate / max(r1_freq, 20);\nr1_trig = (in1 > 0.05) * (r1_pt <= 0.05);\nr1_vel = r1_trig ? in1 : r1_vel;\nr1_pt = in1;\nr1_ec = r1_trig ? r1_dlen : max(r1_ec - 1, 0);\nr1_exc = (r1_ec > 0) ? noise() * drive * r1_vel : 0;\nr1_del = r1_d.read(r1_dlen);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_filt = r1_del * 0.2 + r1_avg * 0.8;    \nr1_out = r1_filt * d1_damp;\nr1_d.write(r1_exc + r1_out);\ndeg2_w = mod(floor(deg2), ts_size);\noct2_x = floor(deg2 / ts_size);\nr2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);\nr2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;\nr2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;\nr2_freq = root * r2_rat * pow(2.0, oct2 + oct2_x);\nr2_dlen = samplerate / max(r2_freq, 20);\nr2_trig = (in2 > 0.05) * (r2_pt <= 0.05);\nr2_vel = r2_trig ? in2 : r2_vel;\nr2_pt = in2;\nr2_ec = r2_trig ? r2_dlen : max(r2_ec - 1, 0);\nr2_exc = (r2_ec > 0) ? noise() * drive * r2_vel : 0;\nr2_del = r2_d.read(r2_dlen);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_filt = r2_del * 0.4 + r2_avg * 0.6;    \nr2_out = r2_filt * d2_damp;\nr2_d.write(r2_exc + r2_out);\ndeg3_w = mod(floor(deg3), ts_size);\noct3_x = floor(deg3 / ts_size);\nr3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);\nr3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;\nr3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;\nr3_freq = root * r3_rat * pow(2.0, oct3 + oct3_x);\nr3_dlen = samplerate / max(r3_freq, 20);\nr3_trig = (in3 > 0.05) * (r3_pt <= 0.05);\nr3_vel = r3_trig ? in3 : r3_vel;\nr3_pt = in3;\nr3_ec = r3_trig ? r3_dlen : max(r3_ec - 1, 0);\nr3_exc = (r3_ec > 0) ? noise() * drive * r3_vel : 0;\nr3_del = r3_d.read(r3_dlen);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_filt = r3_del * 0.85 + r3_avg * 0.15;  \nr3_out = r3_filt * d3_damp;\nr3_d.write(r3_exc + r3_out);\ndeg4_w = mod(floor(deg4), ts_size);\noct4_x = floor(deg4 / ts_size);\nr4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);\nr4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;\nr4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;\nr4_freq = root * r4_rat * pow(2.0, oct4 + oct4_x);\nr4_dlen = samplerate / max(r4_freq, 20);\nr4_trig = (in4 > 0.05) * (r4_pt <= 0.05);\nr4_vel = r4_trig ? in4 : r4_vel;\nr4_pt = in4;\nr4_ec = r4_trig ? r4_dlen : max(r4_ec - 1, 0);\nr4_exc = (r4_ec > 0) ? noise() * drive * 1.2 * r4_vel : 0;\nr4_del = r4_d.read(r4_dlen);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_filt = r4_del * 0.9 + r4_avg * 0.1;    \nr4_out = r4_filt * d4_damp;\nr4_d.write(r4_exc + r4_out);\ndeg5_w = mod(floor(deg5), ts_size);\noct5_x = floor(deg5 / ts_size);\nr5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);\nr5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;\nr5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;\nr5_freq = root * r5_rat * pow(2.0, oct5 + oct5_x);\nr5_dlen = samplerate / max(r5_freq, 20);\nr5_trig = (in5 > 0.05) * (r5_pt <= 0.05);\nr5_vel = r5_trig ? in5 : r5_vel;\nr5_pt = in5;\nr5_ec = r5_trig ? r5_dlen : max(r5_ec - 1, 0);\nr5_exc = (r5_ec > 0) ? noise() * drive * 0.7 * r5_vel : 0;\nr5_del = r5_d.read(r5_dlen);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_filt = r5_del * 0.3 + r5_avg * 0.7;    \nr5_out = r5_filt * d5_damp;\nr5_d.write(r5_exc + r5_out);\ndeg6_w = mod(floor(deg6), ts_size);\noct6_x = floor(deg6 / ts_size);\nr6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);\nr6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;\nr6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;\nr6_freq = root * r6_rat * pow(2.0, oct6 + oct6_x);\nr6_dlen = samplerate / max(r6_freq, 20);\nr6_trig = (in6 > 0.05) * (r6_pt <= 0.05);\nr6_vel = r6_trig ? in6 : r6_vel;\nr6_pt = in6;\nr6_ec = r6_trig ? r6_dlen : max(r6_ec - 1, 0);\nr6_exc = (r6_ec > 0) ? noise() * drive * r6_vel : 0;\nr6_del = r6_d.read(r6_dlen);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_filt = r6_del * 0.95 + r6_avg * 0.05;  \nr6_out = r6_filt * d6_damp;\nr6_d.write(r6_exc + r6_out);\nleft  = r1_out * 0.6 + r2_out * 0.35 + r3_out * 0.65\n      + r4_out * 0.4 + r5_out * 0.55 + r6_out * 0.45;\nright = r1_out * 0.4 + r2_out * 0.65 + r3_out * 0.35\n      + r4_out * 0.6 + r5_out * 0.45 + r6_out * 0.55;\nout1 = left * master_gain;\nout2 = right * master_gain;"
								}
							},
							{
								"box": {
									"id": "obj-in1",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 1",
									"patching_rect": [
										150.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-in2",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 2",
									"patching_rect": [
										230.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-in3",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 3",
									"patching_rect": [
										310.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-in4",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 4",
									"patching_rect": [
										390.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-in5",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 5",
									"patching_rect": [
										470.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-in6",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"text": "in 6",
									"patching_rect": [
										550.0,
										50.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-out1",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"text": "out 1",
									"patching_rect": [
										150.0,
										600.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-out2",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"text": "out 2",
									"patching_rect": [
										200.0,
										600.0,
										35.0,
										22.0
									]
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"obj-in1",
										0
									],
									"destination": [
										"obj-codebox",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-in2",
										0
									],
									"destination": [
										"obj-codebox",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-in3",
										0
									],
									"destination": [
										"obj-codebox",
										2
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-in4",
										0
									],
									"destination": [
										"obj-codebox",
										3
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-in5",
										0
									],
									"destination": [
										"obj-codebox",
										4
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-in6",
										0
									],
									"destination": [
										"obj-codebox",
										5
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-codebox",
										0
									],
									"destination": [
										"obj-out1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-codebox",
										1
									],
									"destination": [
										"obj-out2",
										0
									]
								}
							}
						]
					},
					"varname": "obj-resonator"
				}
			},
			{
				"box": {
					"id": "obj-comment-output",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 OUTPUT \u2500\u2500",
					"patching_rect": [
						15,
						680,
						200,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-comment-output"
				}
			},
			{
				"box": {
					"id": "obj-master",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15,
						710,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Master",
							"parameter_shortname": "Vol",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.7
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						10,
						170,
						50,
						48
					],
					"varname": "obj-master"
				}
			},
			{
				"box": {
					"id": "obj-gain-L",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.7",
					"patching_rect": [
						15,
						770,
						45,
						22
					],
					"varname": "obj-gain-L"
				}
			},
			{
				"box": {
					"id": "obj-gain-R",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.7",
					"patching_rect": [
						115,
						770,
						45,
						22
					],
					"varname": "obj-gain-R"
				}
			},
			{
				"box": {
					"id": "obj-output-dac",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"text": "dac~ 1 2",
					"patching_rect": [
						15,
						810,
						55,
						22
					],
					"varname": "obj-output-dac"
				}
			},
			{
				"box": {
					"id": "obj-meter-L",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						15,
						845,
						200,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						230,
						200,
						20
					],
					"varname": "obj-meter-L"
				}
			},
			{
				"box": {
					"id": "obj-meter-R",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						230,
						845,
						200,
						20
					],
					"presentation": 1,
					"presentation_rect": [
						220,
						230,
						200,
						20
					],
					"varname": "obj-meter-R"
				}
			},
			{
				"box": {
					"id": "obj-comment-osc",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 OSC \u2192 TOUCHDESIGNER (port 7000) \u2500\u2500",
					"patching_rect": [
						700,
						370,
						350,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-comment-osc"
				}
			},
			{
				"box": {
					"id": "obj-osc-metro",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "metro 50",
					"patching_rect": [
						700,
						415,
						55,
						22
					],
					"varname": "obj-osc-metro"
				}
			},
			{
				"box": {
					"id": "obj-r-snap",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						700,
						435,
						72,
						22
					],
					"varname": "obj-r-snap"
				}
			},
			{
				"box": {
					"id": "obj-r-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend kuramoto_r",
					"patching_rect": [
						700,
						465,
						110,
						22
					],
					"varname": "obj-r-prep"
				}
			},
			{
				"box": {
					"id": "obj-r-display",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						820,
						435,
						55,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						250,
						55,
						55,
						22
					],
					"varname": "obj-r-display"
				}
			},
			{
				"box": {
					"id": "obj-r-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "r:",
					"patching_rect": [
						820,
						418,
						20,
						18
					],
					"fontsize": 11.0,
					"presentation": 1,
					"presentation_rect": [
						235,
						57,
						20,
						18
					],
					"varname": "obj-r-label"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap1",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						700,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap1"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						770,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap2"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap3",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						840,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap3"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap4",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						910,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap4"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap5",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						980,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap5"
				}
			},
			{
				"box": {
					"id": "obj-phase-snap6",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1050,
						500,
						65,
						22
					],
					"varname": "obj-phase-snap6"
				}
			},
			{
				"box": {
					"id": "obj-phase-pak",
					"maxclass": "newobj",
					"numinlets": 6,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "pak 0. 0. 0. 0. 0. 0.",
					"patching_rect": [
						700,
						535,
						200,
						22
					],
					"varname": "obj-phase-pak"
				}
			},
			{
				"box": {
					"id": "obj-phase-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend kuramoto_phases",
					"patching_rect": [
						700,
						565,
						140,
						22
					],
					"varname": "obj-phase-prep"
				}
			},
			{
				"box": {
					"id": "obj-veve-snap",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						700,
						600,
						72,
						22
					],
					"varname": "obj-veve-snap"
				}
			},
			{
				"box": {
					"id": "obj-veve-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend veve_preset",
					"patching_rect": [
						700,
						630,
						110,
						22
					],
					"varname": "obj-veve-prep"
				}
			},
			{
				"box": {
					"id": "obj-osc-node",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"text": "node.script osc_send.js",
					"patching_rect": [
						700,
						670,
						140,
						22
					],
					"varname": "obj-osc-node"
				}
			},
			{
				"box": {
					"id": "obj-osc-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "delay 1000",
					"patching_rect": [
						700,
						385,
						65,
						22
					],
					"varname": "obj-osc-delay"
				}
			},
			{
				"box": {
					"id": "obj-mcp-comment",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 MCP BRIDGE (Claude \u2194 Max) \u2500\u2500",
					"patching_rect": [
						1000,
						15,
						300,
						20
					],
					"fontface": 1,
					"fontsize": 14.0,
					"varname": "obj-mcp-comment"
				}
			},
			{
				"box": {
					"id": "obj-mcp-node",
					"varname": "maxmcpid-node",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"text": "node.script max_mcp_node.js",
					"patching_rect": [
						1000,
						50,
						170,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-route",
					"varname": "maxmcpid-route",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"",
						"",
						""
					],
					"text": "route command request port",
					"patching_rect": [
						1000,
						85,
						190,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-handler",
					"varname": "maxmcpid-handler",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"text": "js max_mcp.js",
					"patching_rect": [
						1000,
						120,
						85,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-v8",
					"varname": "maxmcpid-v8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"text": "js max_mcp_v8_add_on.js",
					"patching_rect": [
						1180,
						120,
						145,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-status",
					"varname": "maxmcpid-status",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "",
					"patching_rect": [
						1000,
						160,
						200,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-start",
					"varname": "maxmcpid-start",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "script start",
					"patching_rect": [
						1000,
						190,
						75,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-npm",
					"varname": "maxmcpid-npm",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "script npm install",
					"patching_rect": [
						1090,
						190,
						110,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mcp-stop",
					"varname": "maxmcpid-stop",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "script stop",
					"patching_rect": [
						1210,
						190,
						70,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-decay",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						280,
						555,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Decay",
							"parameter_shortname": "Decay",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.5,
							"parameter_initial": [
								0.3
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					},
					"presentation": 1,
					"presentation_rect": [
						250,
						110,
						50,
						48
					],
					"varname": "obj-decay"
				}
			},
			{
				"box": {
					"id": "obj-decay-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend decay",
					"patching_rect": [
						280,
						610,
						98,
						22
					],
					"varname": "obj-decay-prep"
				}
			},
			{
				"box": {
					"id": "obj-decay-osc-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend resonator_decay",
					"patching_rect": [
						350,
						610,
						148,
						22
					],
					"varname": "obj-decay-osc-prep"
				}
			},
			{
				"box": {
					"id": "obj-root-osc-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend root_freq",
					"patching_rect": [
						850,
						620,
						100,
						22
					],
					"varname": "obj-root-osc-prep"
				}
			},
			{
				"box": {
					"id": "obj-phase-reset",
					"maxclass": "live.button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						380,
						400,
						30,
						30
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "PhaseReset",
							"parameter_shortname": "Reset",
							"parameter_type": 2,
							"parameter_mmax": 1.0
						}
					},
					"presentation": 1,
					"presentation_rect": [
						220,
						15,
						25,
						25
					],
					"varname": "obj-phase-reset"
				}
			},
			{
				"box": {
					"id": "obj-phase-reset-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Reset",
					"patching_rect": [
						415,
						405,
						40,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						215,
						40,
						40,
						18
					],
					"fontsize": 10.0,
					"varname": "obj-phase-reset-label"
				}
			},
			{
				"box": {
					"id": "obj-phase-reset-trig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"text": "t 1 0",
					"patching_rect": [
						380,
						440,
						40,
						22
					],
					"varname": "obj-phase-reset-trig"
				}
			},
			{
				"box": {
					"id": "obj-phase-reset-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend phase_reset",
					"patching_rect": [
						380,
						470,
						130,
						22
					],
					"varname": "obj-phase-reset-prep"
				}
			},
			{
				"box": {
					"id": "obj-reset-release",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						460,
						400,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Release",
							"parameter_shortname": "Release",
							"parameter_type": 0,
							"parameter_mmin": 100.0,
							"parameter_mmax": 5000.0,
							"parameter_initial": [
								1000
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 2
						}
					},
					"presentation": 1,
					"presentation_rect": [
						250,
						10,
						50,
						48
					],
					"varname": "obj-reset-release"
				}
			},
			{
				"box": {
					"id": "obj-reset-release-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend reset_release",
					"patching_rect": [
						460,
						455,
						140,
						22
					],
					"varname": "obj-reset-release-prep"
				}
			},
			{
				"box": {
					"id": "obj-reset-attack",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						540,
						400,
						50.0,
						48.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Attack",
							"parameter_shortname": "Attack",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 3000.0,
							"parameter_initial": [
								200
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 2
						}
					},
					"presentation": 1,
					"presentation_rect": [
						310,
						10,
						50,
						48
					],
					"varname": "obj-reset-attack"
				}
			},
			{
				"box": {
					"id": "obj-reset-attack-prep",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend reset_attack",
					"patching_rect": [
						540,
						455,
						135,
						22
					],
					"varname": "obj-reset-attack-prep"
				}
			},
			{
				"box": {
					"id": "obj-osc-start",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "script start",
					"patching_rect": [
						700,
						640,
						75,
						22
					],
					"varname": "obj-osc-start"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-startdsp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-startdsp",
						0
					],
					"destination": [
						"obj-dac-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-veve-init",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-init",
						0
					],
					"destination": [
						"obj-veve-loader",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-menu",
						0
					],
					"destination": [
						"obj-veve-loader",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-loader",
						0
					],
					"destination": [
						"obj-veve-status",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-K",
						0
					],
					"destination": [
						"obj-K-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tempo",
						0
					],
					"destination": [
						"obj-tempo-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trigwidth",
						0
					],
					"destination": [
						"obj-trig-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-K-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tempo-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root",
						0
					],
					"destination": [
						"obj-root-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex",
						0
					],
					"destination": [
						"obj-flex-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tuning",
						0
					],
					"destination": [
						"obj-tuning-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drive",
						0
					],
					"destination": [
						"obj-drive-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						1
					],
					"destination": [
						"obj-resonator",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						2
					],
					"destination": [
						"obj-resonator",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						3
					],
					"destination": [
						"obj-resonator",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						4
					],
					"destination": [
						"obj-resonator",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						5
					],
					"destination": [
						"obj-resonator",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-prep",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-prep",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tuning-prep",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drive-prep",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-resonator",
						0
					],
					"destination": [
						"obj-gain-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-resonator",
						1
					],
					"destination": [
						"obj-gain-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-master",
						0
					],
					"destination": [
						"obj-gain-L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-master",
						0
					],
					"destination": [
						"obj-gain-R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-L",
						0
					],
					"destination": [
						"obj-output-dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-R",
						0
					],
					"destination": [
						"obj-output-dac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-L",
						0
					],
					"destination": [
						"obj-ezdac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-R",
						0
					],
					"destination": [
						"obj-ezdac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-L",
						0
					],
					"destination": [
						"obj-meter-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-R",
						0
					],
					"destination": [
						"obj-meter-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						6
					],
					"destination": [
						"obj-r-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-r-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-snap",
						0
					],
					"destination": [
						"obj-r-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-snap",
						0
					],
					"destination": [
						"obj-r-display",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						7
					],
					"destination": [
						"obj-phase-snap1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						8
					],
					"destination": [
						"obj-phase-snap2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						9
					],
					"destination": [
						"obj-phase-snap3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						10
					],
					"destination": [
						"obj-phase-snap4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						11
					],
					"destination": [
						"obj-phase-snap5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						12
					],
					"destination": [
						"obj-phase-snap6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-phase-snap6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap1",
						0
					],
					"destination": [
						"obj-phase-pak",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap2",
						0
					],
					"destination": [
						"obj-phase-pak",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap3",
						0
					],
					"destination": [
						"obj-phase-pak",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap4",
						0
					],
					"destination": [
						"obj-phase-pak",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap5",
						0
					],
					"destination": [
						"obj-phase-pak",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap6",
						0
					],
					"destination": [
						"obj-phase-pak",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-pak",
						0
					],
					"destination": [
						"obj-phase-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						13
					],
					"destination": [
						"obj-veve-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-metro",
						0
					],
					"destination": [
						"obj-veve-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-snap",
						0
					],
					"destination": [
						"obj-veve-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-prep",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-prep",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-prep",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-veve-loader",
						2
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-osc-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-delay",
						0
					],
					"destination": [
						"obj-osc-metro",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-decay",
						0
					],
					"destination": [
						"obj-decay-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-decay",
						0
					],
					"destination": [
						"obj-decay-osc-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-decay-osc-prep",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-decay-prep",
						0
					],
					"destination": [
						"obj-resonator",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root",
						0
					],
					"destination": [
						"obj-root-osc-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-osc-prep",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-reset",
						0
					],
					"destination": [
						"obj-phase-reset-trig",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-reset-trig",
						0
					],
					"destination": [
						"obj-phase-reset-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-reset-trig",
						1
					],
					"destination": [
						"obj-phase-reset-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-reset-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-release",
						0
					],
					"destination": [
						"obj-reset-release-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-release-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-attack",
						0
					],
					"destination": [
						"obj-reset-attack-prep",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-attack-prep",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-delay",
						0
					],
					"destination": [
						"obj-osc-start",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-start",
						0
					],
					"destination": [
						"obj-osc-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-node",
						0
					],
					"destination": [
						"obj-mcp-route",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-route",
						0
					],
					"destination": [
						"obj-mcp-handler",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-route",
						1
					],
					"destination": [
						"obj-mcp-handler",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-handler",
						0
					],
					"destination": [
						"obj-mcp-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-handler",
						1
					],
					"destination": [
						"obj-mcp-v8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-v8",
						0
					],
					"destination": [
						"obj-mcp-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-handler",
						2
					],
					"destination": [
						"obj-mcp-status",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-node",
						1
					],
					"destination": [
						"obj-mcp-status",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-start",
						0
					],
					"destination": [
						"obj-mcp-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-npm",
						0
					],
					"destination": [
						"obj-mcp-node",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mcp-stop",
						0
					],
					"destination": [
						"obj-mcp-node",
						0
					]
				}
			}
		]
	}
}