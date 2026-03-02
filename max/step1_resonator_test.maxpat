{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 50, 80, 1100, 800 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxes" : [
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"text" : "STEP 1: WAVEGUIDE RESONATOR\n\n1. Turn on audio (ezdac)\n2. Click the button OR toggle auto-trigger\n3. Try the presets on the right\n4. Sweep freq, damping, brightness",
					"linecount" : 5,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 15.0, 340.0, 80.0 ],
					"fontsize" : 12.0
				}
			},
			{
				"box" : {
					"id" : "obj-ezdac",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 120.0, 45.0, 45.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-bang",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 100.0, 120.0, 40.0, 40.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-metro-tog",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 175.0, 125.0, 24.0, 24.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-metro-label",
					"maxclass" : "comment",
					"text" : "auto",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 175.0, 108.0, 40.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-metro",
					"maxclass" : "newobj",
					"text" : "metro 500",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 175.0, 160.0, 65.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-click",
					"maxclass" : "newobj",
					"text" : "click~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 200.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-freq-label",
					"maxclass" : "comment",
					"text" : "freq",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 380.0, 108.0, 50.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-freq-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 380.0, 128.0, 65.0, 22.0 ],
					"minimum" : 20.0,
					"maximum" : 2000.0
				}
			},
			{
				"box" : {
					"id" : "obj-freq-msg",
					"maxclass" : "message",
					"text" : "freq $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 158.0, 52.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-damp-label",
					"maxclass" : "comment",
					"text" : "damping",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 108.0, 65.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-damp-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 460.0, 128.0, 65.0, 22.0 ],
					"minimum" : 0.9,
					"maximum" : 0.9999
				}
			},
			{
				"box" : {
					"id" : "obj-damp-msg",
					"maxclass" : "message",
					"text" : "damping $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 158.0, 68.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-bright-label",
					"maxclass" : "comment",
					"text" : "brightness",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 545.0, 108.0, 70.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-bright-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 545.0, 128.0, 55.0, 22.0 ],
					"minimum" : 0.0,
					"maximum" : 1.0
				}
			},
			{
				"box" : {
					"id" : "obj-bright-msg",
					"maxclass" : "message",
					"text" : "brightness $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 545.0, 158.0, 84.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-drive-label",
					"maxclass" : "comment",
					"text" : "drive",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 645.0, 108.0, 50.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-drive-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 645.0, 128.0, 55.0, 22.0 ],
					"minimum" : 0.0,
					"maximum" : 1.0
				}
			},
			{
				"box" : {
					"id" : "obj-drive-msg",
					"maxclass" : "message",
					"text" : "drive $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.0, 158.0, 55.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-gen",
					"maxclass" : "newobj",
					"text" : "gen~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 260.0, 80.0, 22.0 ],
					"patcher" : {
						"fileversion" : 1,
						"appversion" : {
							"major" : 8,
							"minor" : 6,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						},
						"rect" : [ 100, 100, 700, 500 ],
						"editing_bgcolor" : [ 0.65, 0.65, 0.65, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"toolbarvisible" : 1,
						"boxes" : [
							{
								"box" : {
									"id" : "obj-gin1",
									"maxclass" : "newobj",
									"text" : "in 1",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 15.0, 30.0, 22.0 ]
								}
							},
							{
								"box" : {
									"id" : "obj-gcb",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 55.0, 600.0, 380.0 ],
									"code" : "Param freq(110);\nParam damping(0.997);\nParam brightness(0.5);\nParam drive(0.5);\nHistory prev_trig(0);\nHistory exc_count(0);\nHistory prev_del(0);\nDelay d(48000);\n\ndelay_len = samplerate / max(freq, 20);\ntrigger = (in1 > 0.5) * (prev_trig <= 0.5);\nprev_trig = in1;\nexc_count = trigger ? delay_len : max(exc_count - 1, 0);\nexcitation = (exc_count > 0) ? noise() * drive : 0;\ndelayed = d.read(delay_len);\navg = (delayed + prev_del) * 0.5;\nprev_del = delayed;\nfiltered = delayed * brightness + avg * (1.0 - brightness);\noutput = filtered * damping;\nd.write(excitation + output);\nout1 = output;"
								}
							},
							{
								"box" : {
									"id" : "obj-gout1",
									"maxclass" : "newobj",
									"text" : "out 1",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 455.0, 35.0, 22.0 ]
								}
							}
						],
						"lines" : [
							{
								"patchline" : {
									"source" : [ "obj-gin1", 0 ],
									"destination" : [ "obj-gcb", 0 ]
								}
							},
							{
								"patchline" : {
									"source" : [ "obj-gcb", 0 ],
									"destination" : [ "obj-gout1", 0 ]
								}
							}
						]
					}
				}
			},
			{
				"box" : {
					"id" : "obj-gain",
					"maxclass" : "newobj",
					"text" : "*~ 0.7",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 310.0, 42.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-scope",
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 380.0, 260.0, 200.0, 100.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-meter",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 380.0, 370.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-dac",
					"maxclass" : "newobj",
					"text" : "dac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 100.0, 380.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-preset-label",
					"maxclass" : "comment",
					"text" : "—— PRESETS ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 750.0, 108.0, 120.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-p1",
					"maxclass" : "message",
					"text" : "freq 55, damping 0.9995, brightness 0.2, drive 0.6",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 135.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p1-label",
					"maxclass" : "comment",
					"text" : "sub bass (iya ilu)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 157.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p2",
					"maxclass" : "message",
					"text" : "freq 110, damping 0.998, brightness 0.4, drive 0.5",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 185.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p2-label",
					"maxclass" : "comment",
					"text" : "body (omele)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 207.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p3",
					"maxclass" : "message",
					"text" : "freq 440, damping 0.996, brightness 0.85, drive 0.4",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 235.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p3-label",
					"maxclass" : "comment",
					"text" : "metallic (ogene bell)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 257.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p4",
					"maxclass" : "message",
					"text" : "freq 800, damping 0.97, brightness 0.95, drive 0.7",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 285.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p4-label",
					"maxclass" : "comment",
					"text" : "transient click (gudugudu)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 307.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p5",
					"maxclass" : "message",
					"text" : "freq 65, damping 0.9998, brightness 0.3, drive 0.5",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 335.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p5-label",
					"maxclass" : "comment",
					"text" : "drone (long sustain)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 357.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p6",
					"maxclass" : "message",
					"text" : "freq 1200, damping 0.994, brightness 1.0, drive 0.3",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 385.0, 320.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-p6-label",
					"maxclass" : "comment",
					"text" : "crystalline (shekere)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 407.0, 200.0, 20.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"source" : [ "obj-bang", 0 ],
					"destination" : [ "obj-click", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-metro-tog", 0 ],
					"destination" : [ "obj-metro", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-metro", 0 ],
					"destination" : [ "obj-click", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-click", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-freq-num", 0 ],
					"destination" : [ "obj-freq-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-freq-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-damp-num", 0 ],
					"destination" : [ "obj-damp-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-damp-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-bright-num", 0 ],
					"destination" : [ "obj-bright-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-bright-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-drive-num", 0 ],
					"destination" : [ "obj-drive-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-drive-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-gen", 0 ],
					"destination" : [ "obj-gain", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-gen", 0 ],
					"destination" : [ "obj-scope", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-gen", 0 ],
					"destination" : [ "obj-meter", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-gain", 0 ],
					"destination" : [ "obj-dac", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-gain", 0 ],
					"destination" : [ "obj-dac", 1 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p1", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p2", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p3", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p4", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p5", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-p6", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			}
		]
	}
}
