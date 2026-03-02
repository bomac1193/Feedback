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
			20,
			50,
			1120,
			1100
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
					"id": "obj-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "CHAOS RESONATOR v3\n\nLorenz attractor → 6 waveguide resonators.\n19 African tuning systems. Arpeggiator.\nADSR envelope. Continuous chaos.\n\n1. Turn on ezdac\n2. Sweep rho: orbits ↔ chaos\n3. Tuning system: 0-18\n4. Arp mode: cycle voices\n5. ADSR: shape the notes",
					"patching_rect": [
						15.0,
						15.0,
						280.0,
						175.0
					],
					"fontsize": 12.0,
					"linecount": 11
				}
			},
			{
				"box": {
					"id": "obj-ezdac",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						200.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-btn",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						15.0,
						260.0,
						30.0,
						30.0
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-reset-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "RESET",
					"patching_rect": [
						50.0,
						265.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-reset-on",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "reset 1",
					"patching_rect": [
						15.0,
						298.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-del",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "delay 100",
					"patching_rect": [
						75.0,
						298.0,
						65.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-off",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "reset 0",
					"patching_rect": [
						75.0,
						325.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-voices",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "VOICES (chaos routing):\n1 Sub Bass (iya ilu) ← X\n2 Body (omele) ← Y\n3 Metallic (ogene) ← Z\n4 Transient (gudugudu) ← X\n5 Drone ← Y\n6 Crystalline (shekere) ← Z",
					"patching_rect": [
						15.0,
						360.0,
						260.0,
						105.0
					],
					"fontsize": 11.0,
					"linecount": 7
				}
			},
			{
				"box": {
					"id": "obj-lc-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— LORENZ ——",
					"patching_rect": [
						310.0,
						15.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sigma",
					"patching_rect": [
						310,
						35.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						310,
						55.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 50
				}
			},
			{
				"box": {
					"id": "obj-sigma-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sigma $1",
					"patching_rect": [
						310,
						80.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "rho",
					"patching_rect": [
						375,
						35.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rho-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						375,
						55.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 200
				}
			},
			{
				"box": {
					"id": "obj-rho-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho $1",
					"patching_rect": [
						375,
						80.0,
						45,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-beta-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "beta",
					"patching_rect": [
						430,
						35.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-beta-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						430,
						55.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 20
				}
			},
			{
				"box": {
					"id": "obj-beta-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "beta $1",
					"patching_rect": [
						430,
						80.0,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dt-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "dt",
					"patching_rect": [
						495,
						35.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dt-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						495,
						55.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0003,
					"maximum": 0.004
				}
			},
			{
				"box": {
					"id": "obj-dt-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "lorenz_dt $1",
					"patching_rect": [
						495,
						80.0,
						78,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "chaos",
					"patching_rect": [
						585,
						35.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cg-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						585,
						55.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 0.5
				}
			},
			{
				"box": {
					"id": "obj-cg-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain $1",
					"patching_rect": [
						585,
						80.0,
						85,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rc-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RESONATORS ——",
					"patching_rect": [
						310.0,
						110.0,
						150.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "root",
					"patching_rect": [
						310,
						130.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						310,
						150.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 20,
					"maximum": 500
				}
			},
			{
				"box": {
					"id": "obj-root-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root $1",
					"patching_rect": [
						310,
						175.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-flex-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "flex",
					"patching_rect": [
						375,
						130.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						375,
						150.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "flex $1",
					"patching_rect": [
						375,
						175.0,
						48,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mg-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "master",
					"patching_rect": [
						435,
						130.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-mg-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						435,
						150.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 1.5
				}
			},
			{
				"box": {
					"id": "obj-mg-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "master_gain $1",
					"patching_rect": [
						435,
						175.0,
						95,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-glide-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "glide",
					"patching_rect": [
						545,
						130.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-glide-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						545,
						150.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0001,
					"maximum": 0.05
				}
			},
			{
				"box": {
					"id": "obj-glide-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide $1",
					"patching_rect": [
						545,
						175.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ts-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— TUNING ——",
					"patching_rect": [
						310.0,
						205.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ts-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "system (0-18)",
					"patching_rect": [
						310.0,
						225.0,
						90.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ts-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						310.0,
						245.0,
						45.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 18
				}
			},
			{
				"box": {
					"id": "obj-ts-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system $1",
					"patching_rect": [
						310.0,
						270.0,
						105.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-inv-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "inversion (0-2)",
					"patching_rect": [
						430.0,
						225.0,
						100.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-inv-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						430.0,
						245.0,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 2
				}
			},
			{
				"box": {
					"id": "obj-inv-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "inversion $1",
					"patching_rect": [
						430.0,
						270.0,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ARPEGGIATOR ——",
					"patching_rect": [
						310.0,
						300.0,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-arp-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 0",
					"patching_rect": [
						310,
						322.0,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 1",
					"patching_rect": [
						365,
						322.0,
						40,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 2",
					"patching_rect": [
						410,
						322.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 3",
					"patching_rect": [
						470,
						322.0,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 4",
					"patching_rect": [
						535,
						322.0,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 5",
					"patching_rect": [
						590,
						322.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arpr-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "rate Hz",
					"patching_rect": [
						310.0,
						350.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-arpr-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						370.0,
						350.0,
						50.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.1,
					"maximum": 20.0
				}
			},
			{
				"box": {
					"id": "obj-arpr-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_rate $1",
					"patching_rect": [
						370.0,
						375.0,
						68.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-adsr-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ADSR ENVELOPE ——",
					"patching_rect": [
						310.0,
						405.0,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-atk-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "attack",
					"patching_rect": [
						310,
						427.0,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-atk-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						310,
						447.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 2.0
				}
			},
			{
				"box": {
					"id": "obj-atk-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack $1",
					"patching_rect": [
						310,
						472.0,
						85,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dec-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "decay",
					"patching_rect": [
						405,
						427.0,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dec-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						405,
						447.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 2.0
				}
			},
			{
				"box": {
					"id": "obj-dec-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_decay $1",
					"patching_rect": [
						405,
						472.0,
						80,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sus-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sustain",
					"patching_rect": [
						495,
						427.0,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sus-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						495,
						447.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-sus-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_sustain $1",
					"patching_rect": [
						495,
						472.0,
						92,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rel-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "release",
					"patching_rect": [
						597,
						427.0,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rel-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						597,
						447.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 5.0
				}
			},
			{
				"box": {
					"id": "obj-rel-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_release $1",
					"patching_rect": [
						597,
						472.0,
						90,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gen",
					"maxclass": "newobj",
					"text": "gen~",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						100.0,
						530.0,
						200.0,
						22.0
					],
					"outlettype": [
						"signal",
						"signal"
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
						"rect": [
							100,
							100,
							950,
							750
						],
						"editing_bgcolor": [
							0.65,
							0.65,
							0.65,
							1.0
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12.0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15.0,
							15.0
						],
						"gridsnaponopen": 1,
						"toolbarvisible": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-gin1",
									"maxclass": "newobj",
									"text": "in 1",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										50.0,
										15.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gcb",
									"maxclass": "codebox",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										50.0,
										55.0,
										800.0,
										600.0
									],
									"code": "// CHAOS RESONATOR — Lorenz -> 6 Waveguide Resonators\n// 19 African tuning systems. Arpeggiator. ADSR envelope.\n// tanh() in feedback = self-limiting.\n\n// === Declarations ===\nParam sigma(10);\nParam rho(28);\nParam beta(2.667);\nParam lorenz_dt(0.0012);\nParam chaos_gain(0.01);\nParam root(110);\nParam flex(0.5);\nParam tuning_system(0);\nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam glide(0.001);\nParam reset(0);\nParam arp_mode(0);\nParam arp_rate(2);\nParam inversion(0);\nParam env_attack(0.005);\nParam env_decay(0.05);\nParam env_sustain(0.8);\nParam env_release(0.1);\nData tuning_table(190);\nHistory init_done(0);\nHistory lx(0.1);\nHistory ly(0);\nHistory lz(0);\nHistory r1_pd(0);\nHistory r2_pd(0);\nHistory r3_pd(0);\nHistory r4_pd(0);\nHistory r5_pd(0);\nHistory r6_pd(0);\nHistory r1_sdl(0);\nHistory r2_sdl(0);\nHistory r3_sdl(0);\nHistory r4_sdl(0);\nHistory r5_sdl(0);\nHistory r6_sdl(0);\nHistory arp_phase(0);\nHistory arp_step(0);\nHistory arp_dir(1);\nHistory v_amp1(0);\nHistory v_amp2(0);\nHistory v_amp3(0);\nHistory v_amp4(0);\nHistory v_amp5(0);\nHistory v_amp6(0);\nHistory pk1(0);\nHistory pk2(0);\nHistory pk3(0);\nHistory pk4(0);\nHistory pk5(0);\nHistory pk6(0);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\n\n// === TUNING TABLE INIT (runs once) ===\nif (init_done < 0.5) {\n    // 0: Yoruba Pentatonic (Pythagorean base, flex at runtime)\n    poke(tuning_table, 5, 0, 0);\n    poke(tuning_table, 1.0, 1, 0);\n    poke(tuning_table, 1.125, 2, 0);\n    poke(tuning_table, 1.265625, 3, 0);\n    poke(tuning_table, 1.5, 4, 0);\n    poke(tuning_table, 1.6875, 5, 0);\n    // 1: Dundun 3-Tone (0, 200, 400c)\n    poke(tuning_table, 3, 10, 0);\n    poke(tuning_table, 1.0, 11, 0);\n    poke(tuning_table, 1.12246, 12, 0);\n    poke(tuning_table, 1.25992, 13, 0);\n    // 2: Balafon Equi-Pentatonic (0, 220, 460, 690, 930c)\n    poke(tuning_table, 5, 20, 0);\n    poke(tuning_table, 1.0, 21, 0);\n    poke(tuning_table, 1.13534, 22, 0);\n    poke(tuning_table, 1.30486, 23, 0);\n    poke(tuning_table, 1.49180, 24, 0);\n    poke(tuning_table, 1.71002, 25, 0);\n    // 3: Equi-Heptatonic 7-TET\n    poke(tuning_table, 7, 30, 0);\n    poke(tuning_table, 1.0, 31, 0);\n    poke(tuning_table, 1.10409, 32, 0);\n    poke(tuning_table, 1.21901, 33, 0);\n    poke(tuning_table, 1.34590, 34, 0);\n    poke(tuning_table, 1.48599, 35, 0);\n    poke(tuning_table, 1.64059, 36, 0);\n    poke(tuning_table, 1.81145, 37, 0);\n    // 4: BaAka/Pygmy 5-TET (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 40, 0);\n    poke(tuning_table, 1.0, 41, 0);\n    poke(tuning_table, 1.14870, 42, 0);\n    poke(tuning_table, 1.31951, 43, 0);\n    poke(tuning_table, 1.51572, 44, 0);\n    poke(tuning_table, 1.74110, 45, 0);\n    // 5: Shona Nyamaropa (0, 180, 380, 500, 700, 880, 1080c)\n    poke(tuning_table, 7, 50, 0);\n    poke(tuning_table, 1.0, 51, 0);\n    poke(tuning_table, 1.10957, 52, 0);\n    poke(tuning_table, 1.24574, 53, 0);\n    poke(tuning_table, 1.33484, 54, 0);\n    poke(tuning_table, 1.49831, 55, 0);\n    poke(tuning_table, 1.65948, 56, 0);\n    poke(tuning_table, 1.86121, 57, 0);\n    // 6: Shona Gandanga (0, 100, 300, 500, 700, 800, 1000c)\n    poke(tuning_table, 7, 60, 0);\n    poke(tuning_table, 1.0, 61, 0);\n    poke(tuning_table, 1.05946, 62, 0);\n    poke(tuning_table, 1.18921, 63, 0);\n    poke(tuning_table, 1.33484, 64, 0);\n    poke(tuning_table, 1.49831, 65, 0);\n    poke(tuning_table, 1.58740, 66, 0);\n    poke(tuning_table, 1.78180, 67, 0);\n    // 7: Kora Silaba (0, 200, 385, 500, 700, 900, 1085c)\n    poke(tuning_table, 7, 70, 0);\n    poke(tuning_table, 1.0, 71, 0);\n    poke(tuning_table, 1.12246, 72, 0);\n    poke(tuning_table, 1.24915, 73, 0);\n    poke(tuning_table, 1.33484, 74, 0);\n    poke(tuning_table, 1.49831, 75, 0);\n    poke(tuning_table, 1.68179, 76, 0);\n    poke(tuning_table, 1.86459, 77, 0);\n    // 8: Kora Sauta (0, 185, 405, 605, 700, 885, 1105c)\n    poke(tuning_table, 7, 80, 0);\n    poke(tuning_table, 1.0, 81, 0);\n    poke(tuning_table, 1.11278, 82, 0);\n    poke(tuning_table, 1.26330, 83, 0);\n    poke(tuning_table, 1.41747, 84, 0);\n    poke(tuning_table, 1.49831, 85, 0);\n    poke(tuning_table, 1.66230, 86, 0);\n    poke(tuning_table, 1.88800, 87, 0);\n    // 9: Ethiopian Tizita Major (0, 200, 400, 700, 900c)\n    poke(tuning_table, 5, 90, 0);\n    poke(tuning_table, 1.0, 91, 0);\n    poke(tuning_table, 1.12246, 92, 0);\n    poke(tuning_table, 1.25992, 93, 0);\n    poke(tuning_table, 1.49831, 94, 0);\n    poke(tuning_table, 1.68179, 95, 0);\n    // 10: Ethiopian Tizita Minor (0, 200, 300, 700, 800c)\n    poke(tuning_table, 5, 100, 0);\n    poke(tuning_table, 1.0, 101, 0);\n    poke(tuning_table, 1.12246, 102, 0);\n    poke(tuning_table, 1.18921, 103, 0);\n    poke(tuning_table, 1.49831, 104, 0);\n    poke(tuning_table, 1.58740, 105, 0);\n    // 11: Ethiopian Bati (0, 200, 500, 700, 900c)\n    poke(tuning_table, 5, 110, 0);\n    poke(tuning_table, 1.0, 111, 0);\n    poke(tuning_table, 1.12246, 112, 0);\n    poke(tuning_table, 1.33484, 113, 0);\n    poke(tuning_table, 1.49831, 114, 0);\n    poke(tuning_table, 1.68179, 115, 0);\n    // 12: Ethiopian Ambassel (0, 200, 400, 700, 800c)\n    poke(tuning_table, 5, 120, 0);\n    poke(tuning_table, 1.0, 121, 0);\n    poke(tuning_table, 1.12246, 122, 0);\n    poke(tuning_table, 1.25992, 123, 0);\n    poke(tuning_table, 1.49831, 124, 0);\n    poke(tuning_table, 1.58740, 125, 0);\n    // 13: Ethiopian Anchihoye (0, 100, 500, 600, 900c)\n    poke(tuning_table, 5, 130, 0);\n    poke(tuning_table, 1.0, 131, 0);\n    poke(tuning_table, 1.05946, 132, 0);\n    poke(tuning_table, 1.33484, 133, 0);\n    poke(tuning_table, 1.41421, 134, 0);\n    poke(tuning_table, 1.68179, 135, 0);\n    // 14: Bugandan Amadinda (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 140, 0);\n    poke(tuning_table, 1.0, 141, 0);\n    poke(tuning_table, 1.14870, 142, 0);\n    poke(tuning_table, 1.31951, 143, 0);\n    poke(tuning_table, 1.51572, 144, 0);\n    poke(tuning_table, 1.74110, 145, 0);\n    // 15: Chopi Timbila (0, 175, 346, 519, 681, 854, 1025c)\n    poke(tuning_table, 7, 150, 0);\n    poke(tuning_table, 1.0, 151, 0);\n    poke(tuning_table, 1.10653, 152, 0);\n    poke(tuning_table, 1.22082, 153, 0);\n    poke(tuning_table, 1.34890, 154, 0);\n    poke(tuning_table, 1.48160, 155, 0);\n    poke(tuning_table, 1.63720, 156, 0);\n    poke(tuning_table, 1.80699, 157, 0);\n    // 16: San Musical Bow (0, 200, 386, 498, 702, 884c)\n    poke(tuning_table, 6, 160, 0);\n    poke(tuning_table, 1.0, 161, 0);\n    poke(tuning_table, 1.12246, 162, 0);\n    poke(tuning_table, 1.24984, 163, 0);\n    poke(tuning_table, 1.33322, 164, 0);\n    poke(tuning_table, 1.50000, 165, 0);\n    poke(tuning_table, 1.66212, 166, 0);\n    // 17: Wagogo Ilimba — harmonics 4-9\n    poke(tuning_table, 6, 170, 0);\n    poke(tuning_table, 1.0, 171, 0);\n    poke(tuning_table, 1.25, 172, 0);\n    poke(tuning_table, 1.5, 173, 0);\n    poke(tuning_table, 1.75, 174, 0);\n    poke(tuning_table, 2.0, 175, 0);\n    poke(tuning_table, 2.25, 176, 0);\n    // 18: Igbo Pentatonic (0, 200, 386, 702, 884c)\n    poke(tuning_table, 5, 180, 0);\n    poke(tuning_table, 1.0, 181, 0);\n    poke(tuning_table, 1.12246, 182, 0);\n    poke(tuning_table, 1.24984, 183, 0);\n    poke(tuning_table, 1.50000, 184, 0);\n    poke(tuning_table, 1.66212, 185, 0);\n    init_done = 1;\n}\n\n// === TUNING SETUP ===\nts = clamp(floor(tuning_system), 0, 18);\nts_base = ts * 10;\nts_size = max(peek(tuning_table, ts_base, 0), 1);\nj0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;\n\n// === INVERSION ===\ninv_off = floor(clamp(inversion, 0, 2));\n\n// === LORENZ ATTRACTOR (4 unrolled steps) ===\nrho_mod = rho + in1;\ntx = lx; ty = ly; tz = lz;\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\nlx = (reset > 0.5) ? 0.1 : clamp(tx, -100, 100) + noise() * 0.01;\nly = (reset > 0.5) ? 0.0 : clamp(ty, -100, 100) + noise() * 0.01;\nlz = (reset > 0.5) ? 0.0 : clamp(tz, -100, 100) + noise() * 0.01;\ncx = lx * 0.05;\ncy = ly * 0.04;\ncz = (lz - 25) * 0.04;\n\n// === ARPEGGIATOR ===\narp_ph_new = arp_phase + arp_rate / samplerate;\narp_trig_flag = (arp_ph_new >= 1.0);\narp_phase = arp_ph_new - floor(arp_ph_new);\nup_s = mod(arp_step + 1, 6);\ndn_s = mod(arp_step + 5, 6);\npp_next = arp_step + arp_dir;\npp_rev_hi = (pp_next > 5);\npp_rev_lo = (pp_next < 0);\npp_new_dir = pp_rev_hi ? -1 : (pp_rev_lo ? 1 : arp_dir);\npp_s = pp_rev_hi ? 4 : (pp_rev_lo ? 1 : clamp(pp_next, 0, 5));\nrnd_s = clamp(floor(abs(noise()) * 6), 0, 5);\nnew_s = (arp_mode > 3.5) ? rnd_s : (arp_mode > 2.5) ? pp_s : (arp_mode > 1.5) ? dn_s : (arp_mode > 0.5) ? up_s : arp_step;\nnew_d = (arp_mode > 2.5 && arp_mode < 3.5) ? pp_new_dir : arp_dir;\narp_step = arp_trig_flag ? new_s : arp_step;\narp_dir = arp_trig_flag ? new_d : arp_dir;\ncur = floor(arp_step);\narp_active = (arp_mode > 0.5 && arp_mode < 4.5);\nt1 = arp_active ? (abs(cur) < 0.5 ? 1.0 : 0.0) : 1.0;\nt2 = arp_active ? (abs(cur - 1) < 0.5 ? 1.0 : 0.0) : 1.0;\nt3 = arp_active ? (abs(cur - 2) < 0.5 ? 1.0 : 0.0) : 1.0;\nt4 = arp_active ? (abs(cur - 3) < 0.5 ? 1.0 : 0.0) : 1.0;\nt5 = arp_active ? (abs(cur - 4) < 0.5 ? 1.0 : 0.0) : 1.0;\nt6 = arp_active ? (abs(cur - 5) < 0.5 ? 1.0 : 0.0) : 1.0;\n\n// === ADSR ENVELOPE (replaces one-pole smooth) ===\n// Attack: linear ramp 0->1. Decay: exp 1->sustain. Release: exp ->0.\n// Retrigger: starts attack from current level (smooth).\na_rate = 1.0 / max(env_attack * samplerate, 1);\nd_coeff = 1.0 - exp(-4.0 / max(env_decay * samplerate, 1));\nr_coeff = 1.0 - exp(-4.0 / max(env_release * samplerate, 1));\n\n// Voice 1 ADSR\ngate1 = t1 > 0.5;\natk_ph1 = gate1 * (1.0 - pk1);\npk1 = gate1 ? min(pk1 + (v_amp1 >= 0.999), 1.0) : 0.0;\nv_amp1 = atk_ph1 ? min(v_amp1 + a_rate, 1.0) : (gate1 ? (v_amp1 + (env_sustain - v_amp1) * d_coeff) : (v_amp1 + (0.0 - v_amp1) * r_coeff));\n\n// Voice 2 ADSR\ngate2 = t2 > 0.5;\natk_ph2 = gate2 * (1.0 - pk2);\npk2 = gate2 ? min(pk2 + (v_amp2 >= 0.999), 1.0) : 0.0;\nv_amp2 = atk_ph2 ? min(v_amp2 + a_rate, 1.0) : (gate2 ? (v_amp2 + (env_sustain - v_amp2) * d_coeff) : (v_amp2 + (0.0 - v_amp2) * r_coeff));\n\n// Voice 3 ADSR\ngate3 = t3 > 0.5;\natk_ph3 = gate3 * (1.0 - pk3);\npk3 = gate3 ? min(pk3 + (v_amp3 >= 0.999), 1.0) : 0.0;\nv_amp3 = atk_ph3 ? min(v_amp3 + a_rate, 1.0) : (gate3 ? (v_amp3 + (env_sustain - v_amp3) * d_coeff) : (v_amp3 + (0.0 - v_amp3) * r_coeff));\n\n// Voice 4 ADSR\ngate4 = t4 > 0.5;\natk_ph4 = gate4 * (1.0 - pk4);\npk4 = gate4 ? min(pk4 + (v_amp4 >= 0.999), 1.0) : 0.0;\nv_amp4 = atk_ph4 ? min(v_amp4 + a_rate, 1.0) : (gate4 ? (v_amp4 + (env_sustain - v_amp4) * d_coeff) : (v_amp4 + (0.0 - v_amp4) * r_coeff));\n\n// Voice 5 ADSR\ngate5 = t5 > 0.5;\natk_ph5 = gate5 * (1.0 - pk5);\npk5 = gate5 ? min(pk5 + (v_amp5 >= 0.999), 1.0) : 0.0;\nv_amp5 = atk_ph5 ? min(v_amp5 + a_rate, 1.0) : (gate5 ? (v_amp5 + (env_sustain - v_amp5) * d_coeff) : (v_amp5 + (0.0 - v_amp5) * r_coeff));\n\n// Voice 6 ADSR\ngate6 = t6 > 0.5;\natk_ph6 = gate6 * (1.0 - pk6);\npk6 = gate6 ? min(pk6 + (v_amp6 >= 0.999), 1.0) : 0.0;\nv_amp6 = atk_ph6 ? min(v_amp6 + a_rate, 1.0) : (gate6 ? (v_amp6 + (env_sustain - v_amp6) * d_coeff) : (v_amp6 + (0.0 - v_amp6) * r_coeff));\n\n// === Voice 1: Sub Bass (iya ilu) bright=0.2 ===\neff_oct1 = oct1 + (oct1 < 0) * inv_off;\ndeg1_w = mod(floor(deg1), ts_size);\noct1_x = floor(deg1 / ts_size);\nr1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);\nr1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;\nr1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;\nr1_freq = root * r1_rat * pow(2.0, eff_oct1 + oct1_x);\nr1_target = samplerate / max(r1_freq, 20);\nr1_sdl = (r1_sdl < 1) ? r1_target : r1_sdl + (r1_target - r1_sdl) * glide;\nexc1 = cx * chaos_gain * v_amp1;\nr1_del = r1_d.read(r1_sdl);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_filt = r1_del * 0.2 + r1_avg * 0.8;\nr1_out = tanh(r1_filt) * 0.9995;\nr1_d.write(exc1 + r1_out);\n\n// === Voice 2: Body (omele) bright=0.4 ===\neff_oct2 = oct2 + (oct2 < 0) * inv_off;\ndeg2_w = mod(floor(deg2), ts_size);\noct2_x = floor(deg2 / ts_size);\nr2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);\nr2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;\nr2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;\nr2_freq = root * r2_rat * pow(2.0, eff_oct2 + oct2_x);\nr2_target = samplerate / max(r2_freq, 20);\nr2_sdl = (r2_sdl < 1) ? r2_target : r2_sdl + (r2_target - r2_sdl) * glide;\nexc2 = cy * chaos_gain * v_amp2;\nr2_del = r2_d.read(r2_sdl);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_filt = r2_del * 0.4 + r2_avg * 0.6;\nr2_out = tanh(r2_filt) * 0.998;\nr2_d.write(exc2 + r2_out);\n\n// === Voice 3: Metallic (ogene) bright=0.85 ===\neff_oct3 = oct3 + (oct3 < 0) * inv_off;\ndeg3_w = mod(floor(deg3), ts_size);\noct3_x = floor(deg3 / ts_size);\nr3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);\nr3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;\nr3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;\nr3_freq = root * r3_rat * pow(2.0, eff_oct3 + oct3_x);\nr3_target = samplerate / max(r3_freq, 20);\nr3_sdl = (r3_sdl < 1) ? r3_target : r3_sdl + (r3_target - r3_sdl) * glide;\nexc3 = cz * chaos_gain * v_amp3;\nr3_del = r3_d.read(r3_sdl);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_filt = r3_del * 0.85 + r3_avg * 0.15;\nr3_out = tanh(r3_filt) * 0.996;\nr3_d.write(exc3 + r3_out);\n\n// === Voice 4: Transient (gudugudu) bright=0.9 ===\neff_oct4 = oct4 + (oct4 < 0) * inv_off;\ndeg4_w = mod(floor(deg4), ts_size);\noct4_x = floor(deg4 / ts_size);\nr4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);\nr4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;\nr4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;\nr4_freq = root * r4_rat * pow(2.0, eff_oct4 + oct4_x);\nr4_target = samplerate / max(r4_freq, 20);\nr4_sdl = (r4_sdl < 1) ? r4_target : r4_sdl + (r4_target - r4_sdl) * glide;\nexc4 = cx * chaos_gain * v_amp4;\nr4_del = r4_d.read(r4_sdl);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_filt = r4_del * 0.9 + r4_avg * 0.1;\nr4_out = tanh(r4_filt) * 0.97;\nr4_d.write(exc4 + r4_out);\n\n// === Voice 5: Drone bright=0.3 ===\neff_oct5 = oct5 + (oct5 < 0) * inv_off;\ndeg5_w = mod(floor(deg5), ts_size);\noct5_x = floor(deg5 / ts_size);\nr5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);\nr5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;\nr5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;\nr5_freq = root * r5_rat * pow(2.0, eff_oct5 + oct5_x);\nr5_target = samplerate / max(r5_freq, 20);\nr5_sdl = (r5_sdl < 1) ? r5_target : r5_sdl + (r5_target - r5_sdl) * glide;\nexc5 = cy * chaos_gain * v_amp5;\nr5_del = r5_d.read(r5_sdl);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_filt = r5_del * 0.3 + r5_avg * 0.7;\nr5_out = tanh(r5_filt) * 0.9998;\nr5_d.write(exc5 + r5_out);\n\n// === Voice 6: Crystalline (shekere) bright=0.95 ===\neff_oct6 = oct6 + (oct6 < 0) * inv_off;\ndeg6_w = mod(floor(deg6), ts_size);\noct6_x = floor(deg6 / ts_size);\nr6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);\nr6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;\nr6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;\nr6_freq = root * r6_rat * pow(2.0, eff_oct6 + oct6_x);\nr6_target = samplerate / max(r6_freq, 20);\nr6_sdl = (r6_sdl < 1) ? r6_target : r6_sdl + (r6_target - r6_sdl) * glide;\nexc6 = cz * chaos_gain * v_amp6;\nr6_del = r6_d.read(r6_sdl);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_filt = r6_del * 0.95 + r6_avg * 0.05;\nr6_out = tanh(r6_filt) * 0.994;\nr6_d.write(exc6 + r6_out);\n\n// === STEREO MIX (outputs gated by ADSR amplitude) ===\nleft = r1_out*v_amp1*0.7 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.2 + r4_out*v_amp4*0.4 + r5_out*v_amp5*0.6 + r6_out*v_amp6*0.3;\nright = r1_out*v_amp1*0.3 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.8 + r4_out*v_amp4*0.6 + r5_out*v_amp5*0.4 + r6_out*v_amp6*0.7;\nout1 = tanh(left) * master_gain;\nout2 = tanh(right) * master_gain;"
								}
							},
							{
								"box": {
									"id": "obj-gout1",
									"maxclass": "newobj",
									"text": "out 1",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										50.0,
										675.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gout2",
									"maxclass": "newobj",
									"text": "out 2",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										250.0,
										675.0,
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
										"obj-gin1",
										0
									],
									"destination": [
										"obj-gcb",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gcb",
										0
									],
									"destination": [
										"obj-gout1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gcb",
										1
									],
									"destination": [
										"obj-gout2",
										0
									]
								}
							}
						]
					}
				}
			},
			{
				"box": {
					"id": "obj-r-toGen",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "r toGen",
					"patching_rect": [
						100.0,
						507.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-l",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.8",
					"patching_rect": [
						100.0,
						560.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-r",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.8",
					"patching_rect": [
						180.0,
						560.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dac",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"text": "dac~",
					"patching_rect": [
						100.0,
						640.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-l",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						310.0,
						530.0,
						160.0,
						50.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-r",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						310.0,
						585.0,
						160.0,
						50.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "L",
					"patching_rect": [
						475.0,
						530.0,
						20.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sr",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "R",
					"patching_rect": [
						475.0,
						585.0,
						20.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-meter-l",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						310.0,
						640.0,
						160.0,
						16.0
					]
				}
			},
			{
				"box": {
					"id": "obj-meter-r",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						310.0,
						660.0,
						160.0,
						16.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RECORD ——",
					"patching_rect": [
						100.0,
						675.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rec-open",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "open",
					"patching_rect": [
						100.0,
						695.0,
						40.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						150.0,
						695.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "record",
					"patching_rect": [
						178.0,
						698.0,
						50.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-sfrecord",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "sfrecord~ 2",
					"patching_rect": [
						100.0,
						725.0,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RHO PRESETS ——",
					"patching_rect": [
						700,
						15,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 20",
					"patching_rect": [
						700,
						37,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "converging (quiet)",
					"patching_rect": [
						757,
						37,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 24.74",
					"patching_rect": [
						700,
						61,
						73,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "onset of chaos (edge)",
					"patching_rect": [
						778,
						61,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 28",
					"patching_rect": [
						700,
						85,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "classic chaos",
					"patching_rect": [
						757,
						85,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 100",
					"patching_rect": [
						700,
						109,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "periodic orbit (pitched!)",
					"patching_rect": [
						764,
						109,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 166",
					"patching_rect": [
						700,
						133,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "stable periodic",
					"patching_rect": [
						764,
						133,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 50",
					"patching_rect": [
						700,
						157,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "intermittent bursts",
					"patching_rect": [
						757,
						157,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						181,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— CHAOS GAIN ——",
					"patching_rect": [
						700,
						209,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cgp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.002",
					"patching_rect": [
						700,
						231,
						122,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "whisper",
					"patching_rect": [
						827,
						231,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.005",
					"patching_rect": [
						700,
						255,
						122,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "gentle",
					"patching_rect": [
						827,
						255,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.01",
					"patching_rect": [
						700,
						279,
						115,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "balanced (default)",
					"patching_rect": [
						820,
						279,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.03",
					"patching_rect": [
						700,
						303,
						115,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "aggressive",
					"patching_rect": [
						820,
						303,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.1",
					"patching_rect": [
						700,
						327,
						108,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "full distortion",
					"patching_rect": [
						813,
						327,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						351,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— GLIDE ——",
					"patching_rect": [
						700,
						379,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-gp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.0002",
					"patching_rect": [
						700,
						401,
						94,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "slow (portamento)",
					"patching_rect": [
						799,
						401,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.001",
					"patching_rect": [
						700,
						425,
						87,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "default (~22ms)",
					"patching_rect": [
						792,
						425,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.01",
					"patching_rect": [
						700,
						449,
						80,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "fast (snap)",
					"patching_rect": [
						785,
						449,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						473,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ADSR PRESETS ——",
					"patching_rect": [
						700,
						501,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ep1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.001, env_decay 0.08, env_sustain 0.0, env_release 0.05",
					"patching_rect": [
						700,
						523,
						479,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Pluck",
					"patching_rect": [
						1184,
						523,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.3, env_decay 0.2, env_sustain 0.9, env_release 1.0",
					"patching_rect": [
						700,
						547,
						451,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Pad",
					"patching_rect": [
						1156,
						547,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 1.0, env_decay 0.5, env_sustain 0.7, env_release 2.0",
					"patching_rect": [
						700,
						571,
						451,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Swell",
					"patching_rect": [
						1156,
						571,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.001, env_decay 0.02, env_sustain 0.0, env_release 0.01",
					"patching_rect": [
						700,
						595,
						479,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Staccato",
					"patching_rect": [
						1184,
						595,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.005, env_decay 0.05, env_sustain 0.8, env_release 0.1",
					"patching_rect": [
						700,
						619,
						472,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Default",
					"patching_rect": [
						1177,
						619,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						643,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— AFRICAN ROOTS ——",
					"patching_rect": [
						700,
						671,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ar0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 61",
					"patching_rect": [
						700,
						693,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar0-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun Low (Akinbo 2019: 61.4 Hz)",
					"patching_rect": [
						764,
						693,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 82",
					"patching_rect": [
						700,
						717,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Iya Ilu — bata mother drum",
					"patching_rect": [
						764,
						717,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 125",
					"patching_rect": [
						700,
						741,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun Mid (Akinbo 2019: 124.8 Hz)",
					"patching_rect": [
						771,
						741,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 172",
					"patching_rect": [
						700,
						765,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun High (Akinbo 2019: 172.3 Hz)",
					"patching_rect": [
						771,
						765,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 220",
					"patching_rect": [
						700,
						789,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Balafon — West African xylophone",
					"patching_rect": [
						771,
						789,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 350",
					"patching_rect": [
						700,
						813,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Agogo — Yoruba double bell",
					"patching_rect": [
						771,
						813,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						837,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— CHORD PRESETS ——",
					"patching_rect": [
						700,
						865,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1",
					"patching_rect": [
						700,
						887,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Yoruba Spread",
					"patching_rect": [
						1305,
						887,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1",
					"patching_rect": [
						700,
						911,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Root Cluster",
					"patching_rect": [
						1305,
						911,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1",
					"patching_rect": [
						700,
						935,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Open Fifths",
					"patching_rect": [
						1305,
						935,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1",
					"patching_rect": [
						700,
						959,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Sub Drone",
					"patching_rect": [
						1305,
						959,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						983,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— DRONE PRESETS ——",
					"patching_rect": [
						700,
						1011,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dr1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
					"patching_rect": [
						700,
						1033,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Root Drone",
					"patching_rect": [
						1305,
						1033,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-dr2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
					"patching_rect": [
						700,
						1057,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Fifth Drone",
					"patching_rect": [
						1305,
						1057,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-dr-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						1081,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— TUNING SYSTEMS ——",
					"patching_rect": [
						700,
						1109,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsr-wes",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "West African",
					"patching_rect": [
						700,
						1131,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 0",
					"patching_rect": [
						700,
						1151,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-0-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Yoruba Pentatonic",
					"patching_rect": [
						805,
						1151,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 1",
					"patching_rect": [
						700,
						1175,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun 3-Tone",
					"patching_rect": [
						805,
						1175,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 2",
					"patching_rect": [
						700,
						1199,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Balafon Equi-Penta",
					"patching_rect": [
						805,
						1199,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 3",
					"patching_rect": [
						700,
						1223,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Equi-Heptatonic 7-TET",
					"patching_rect": [
						805,
						1223,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-18",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 18",
					"patching_rect": [
						700,
						1247,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-18-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Igbo Pentatonic",
					"patching_rect": [
						805,
						1247,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-man",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Mandinka / Senegambia",
					"patching_rect": [
						700,
						1277,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 7",
					"patching_rect": [
						700,
						1297,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-7-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Kora Silaba",
					"patching_rect": [
						805,
						1297,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-8",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 8",
					"patching_rect": [
						700,
						1321,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-8-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Kora Sauta",
					"patching_rect": [
						805,
						1321,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-cen",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Central African",
					"patching_rect": [
						700,
						1351,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 4",
					"patching_rect": [
						700,
						1371,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "BaAka/Pygmy 5-TET",
					"patching_rect": [
						805,
						1371,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-eas",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "East African",
					"patching_rect": [
						700,
						1401,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 9",
					"patching_rect": [
						700,
						1421,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-9-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Tizita Major",
					"patching_rect": [
						805,
						1421,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-10",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 10",
					"patching_rect": [
						700,
						1445,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-10-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Tizita Minor",
					"patching_rect": [
						805,
						1445,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-11",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 11",
					"patching_rect": [
						700,
						1469,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-11-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Bati",
					"patching_rect": [
						805,
						1469,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-12",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 12",
					"patching_rect": [
						700,
						1493,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-12-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Ambassel",
					"patching_rect": [
						805,
						1493,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-13",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 13",
					"patching_rect": [
						700,
						1517,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-13-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Anchihoye",
					"patching_rect": [
						805,
						1517,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-14",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 14",
					"patching_rect": [
						700,
						1541,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-14-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Amadinda",
					"patching_rect": [
						805,
						1541,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-17",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 17",
					"patching_rect": [
						700,
						1565,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-17-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Wagogo Ilimba",
					"patching_rect": [
						805,
						1565,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-sou",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Southern African",
					"patching_rect": [
						700,
						1595,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 5",
					"patching_rect": [
						700,
						1615,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Shona Nyamaropa",
					"patching_rect": [
						805,
						1615,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 6",
					"patching_rect": [
						700,
						1639,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Shona Gandanga",
					"patching_rect": [
						805,
						1639,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-15",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 15",
					"patching_rect": [
						700,
						1663,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-15-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Chopi Timbila",
					"patching_rect": [
						805,
						1663,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-16",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 16",
					"patching_rect": [
						700,
						1687,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-16-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "San Musical Bow",
					"patching_rect": [
						805,
						1687,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						700,
						1717,
						52.0,
						22.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-reset-btn",
						0
					],
					"destination": [
						"obj-reset-on",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-btn",
						0
					],
					"destination": [
						"obj-reset-del",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-on",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-del",
						0
					],
					"destination": [
						"obj-reset-off",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-off",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sigma-n",
						0
					],
					"destination": [
						"obj-sigma-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sigma-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rho-n",
						0
					],
					"destination": [
						"obj-rho-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rho-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beta-n",
						0
					],
					"destination": [
						"obj-beta-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beta-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dt-n",
						0
					],
					"destination": [
						"obj-dt-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dt-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg-n",
						0
					],
					"destination": [
						"obj-cg-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-n",
						0
					],
					"destination": [
						"obj-root-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-n",
						0
					],
					"destination": [
						"obj-flex-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mg-n",
						0
					],
					"destination": [
						"obj-mg-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mg-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-glide-n",
						0
					],
					"destination": [
						"obj-glide-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-glide-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ts-n",
						0
					],
					"destination": [
						"obj-ts-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ts-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-inv-n",
						0
					],
					"destination": [
						"obj-inv-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-inv-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-0",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-4",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-5",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arpr-n",
						0
					],
					"destination": [
						"obj-arpr-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arpr-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-atk-n",
						0
					],
					"destination": [
						"obj-atk-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-atk-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dec-n",
						0
					],
					"destination": [
						"obj-dec-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dec-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sus-n",
						0
					],
					"destination": [
						"obj-sus-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sus-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rel-n",
						0
					],
					"destination": [
						"obj-rel-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rel-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-toGen",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						0
					],
					"destination": [
						"obj-gain-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						1
					],
					"destination": [
						"obj-gain-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-dac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						0
					],
					"destination": [
						"obj-scope-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						1
					],
					"destination": [
						"obj-scope-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-meter-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-meter-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-open",
						0
					],
					"destination": [
						"obj-sfrecord",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-tog",
						0
					],
					"destination": [
						"obj-sfrecord",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-sfrecord",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-sfrecord",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp1",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp2",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp3",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp4",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp5",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp6",
						0
					],
					"destination": [
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp1",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp2",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp3",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp4",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp5",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp1",
						0
					],
					"destination": [
						"obj-gp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp2",
						0
					],
					"destination": [
						"obj-gp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp3",
						0
					],
					"destination": [
						"obj-gp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep1",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep2",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep3",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep4",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep5",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar0",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar1",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar2",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar3",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar4",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar5",
						0
					],
					"destination": [
						"obj-ar-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp1",
						0
					],
					"destination": [
						"obj-cp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp2",
						0
					],
					"destination": [
						"obj-cp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp3",
						0
					],
					"destination": [
						"obj-cp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp4",
						0
					],
					"destination": [
						"obj-cp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dr1",
						0
					],
					"destination": [
						"obj-dr-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dr2",
						0
					],
					"destination": [
						"obj-dr-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-0",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-1",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-2",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-3",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-18",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-7",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-8",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-4",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-9",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-10",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-11",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-12",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-13",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-14",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-17",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-5",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-6",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-15",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-16",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			}
		]
	}
}