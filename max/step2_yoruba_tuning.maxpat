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
		"rect" : [ 50, 80, 1200, 800 ],
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
					"text" : "STEP 1.2: YORUBA PENTATONIC TUNING\n\n1. Turn on ezdac\n2. Set degree (0-4), octave, root\n3. Click trigger or toggle auto\n4. Sweep flex: 0=Pythagorean, 1=just",
					"linecount" : 5,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 15.0, 260.0, 80.0 ],
					"fontsize" : 12.0
				}
			},
			{
				"box" : {
					"id" : "obj-ezdac",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 130.0, 45.0, 45.0 ]
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
					"patching_rect" : [ 100.0, 130.0, 40.0, 40.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-metro-label",
					"maxclass" : "comment",
					"text" : "auto",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 175.0, 118.0, 40.0, 20.0 ]
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
					"patching_rect" : [ 175.0, 135.0, 24.0, 24.0 ]
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
					"patching_rect" : [ 175.0, 170.0, 65.0, 22.0 ]
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
					"patching_rect" : [ 100.0, 210.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-tuning-label",
					"maxclass" : "comment",
					"text" : "—— TUNING ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 98.0, 120.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-root-label",
					"maxclass" : "comment",
					"text" : "root Hz",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 118.0, 50.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-root-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 138.0, 60.0, 22.0 ],
					"minimum" : 20.0,
					"maximum" : 880.0
				}
			},
			{
				"box" : {
					"id" : "obj-root-msg",
					"maxclass" : "message",
					"text" : "root $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 168.0, 50.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-deg-label",
					"maxclass" : "comment",
					"text" : "degree",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 355.0, 118.0, 50.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-deg-num",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 138.0, 45.0, 22.0 ],
					"minimum" : 0,
					"maximum" : 4
				}
			},
			{
				"box" : {
					"id" : "obj-deg-msg",
					"maxclass" : "message",
					"text" : "deg $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 168.0, 42.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-oct-label",
					"maxclass" : "comment",
					"text" : "octave",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 415.0, 118.0, 50.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-oct-num",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 415.0, 138.0, 45.0, 22.0 ],
					"minimum" : -2,
					"maximum" : 3
				}
			},
			{
				"box" : {
					"id" : "obj-oct-msg",
					"maxclass" : "message",
					"text" : "oct $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 415.0, 168.0, 42.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-flex-label",
					"maxclass" : "comment",
					"text" : "flex",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 475.0, 118.0, 40.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-flex-num",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 475.0, 138.0, 55.0, 22.0 ],
					"minimum" : 0.0,
					"maximum" : 1.0
				}
			},
			{
				"box" : {
					"id" : "obj-flex-msg",
					"maxclass" : "message",
					"text" : "flex $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 475.0, 168.0, 48.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-timbre-label",
					"maxclass" : "comment",
					"text" : "—— TIMBRE ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 565.0, 98.0, 120.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-damp-label",
					"maxclass" : "comment",
					"text" : "damping",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 565.0, 118.0, 60.0, 20.0 ],
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
					"patching_rect" : [ 565.0, 138.0, 65.0, 22.0 ],
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
					"patching_rect" : [ 565.0, 168.0, 68.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-bright-label",
					"maxclass" : "comment",
					"text" : "bright",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 650.0, 118.0, 50.0, 20.0 ],
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
					"patching_rect" : [ 650.0, 138.0, 55.0, 22.0 ],
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
					"patching_rect" : [ 650.0, 168.0, 84.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-drive-label",
					"maxclass" : "comment",
					"text" : "drive",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 750.0, 118.0, 40.0, 20.0 ],
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
					"patching_rect" : [ 750.0, 138.0, 55.0, 22.0 ],
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
					"patching_rect" : [ 750.0, 168.0, 55.0, 22.0 ]
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
					"patching_rect" : [ 100.0, 270.0, 80.0, 22.0 ],
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
									"code" : "Param root(110);\nParam deg(0);\nParam oct(0);\nParam flex(0.5);\nParam damping(0.997);\nParam brightness(0.5);\nParam drive(0.5);\nHistory prev_trig(0);\nHistory exc_count(0);\nHistory prev_del(0);\nDelay d(48000);\n\n// Yoruba Anhemitonic Pentatonic ratios\npyth_0 = 1.0; pyth_1 = 1.125; pyth_2 = 1.265625; pyth_3 = 1.5; pyth_4 = 1.6875;\njust_0 = 1.0; just_1 = 1.111111; just_2 = 1.25; just_3 = 1.5; just_4 = 1.666667;\nyor_0 = 1.0;\nyor_1 = pyth_1 * (1-flex) + just_1 * flex;\nyor_2 = pyth_2 * (1-flex) + just_2 * flex;\nyor_3 = 1.5;\nyor_4 = pyth_4 * (1-flex) + just_4 * flex;\n\n// Degree to frequency\ndeg_w = mod(floor(deg), 5);\noct_x = floor(deg / 5);\nrat = (deg_w==0)?yor_0:(deg_w==1)?yor_1:(deg_w==2)?yor_2:(deg_w==3)?yor_3:yor_4;\nfreq = root * rat * pow(2.0, oct + oct_x);\n\n// Waveguide resonator\ndelay_len = samplerate / max(freq, 20);\ntrigger = (in1 > 0.5) * (prev_trig <= 0.5);\nprev_trig = in1;\nexc_count = trigger ? delay_len : max(exc_count - 1, 0);\nexcitation = (exc_count > 0) ? noise() * drive : 0;\ndelayed = d.read(delay_len);\navg = (delayed + prev_del) * 0.5;\nprev_del = delayed;\nfiltered = delayed * brightness + avg * (1.0 - brightness);\noutput = filtered * damping;\nd.write(excitation + output);\nout1 = output;"
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
					"patching_rect" : [ 100.0, 320.0, 42.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-scope",
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 270.0, 200.0, 100.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-meter",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 280.0, 380.0, 200.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-dac",
					"maxclass" : "newobj",
					"text" : "dac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 100.0, 390.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-scale-label",
					"maxclass" : "comment",
					"text" : "—— SCALE DEGREES ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 850.0, 98.0, 160.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-s0",
					"maxclass" : "message",
					"text" : "deg 0",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 120.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s0-label",
					"maxclass" : "comment",
					"text" : "root (1:1)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 120.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s1",
					"maxclass" : "message",
					"text" : "deg 1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 148.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s1-label",
					"maxclass" : "comment",
					"text" : "2nd (~204c)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 148.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s2",
					"maxclass" : "message",
					"text" : "deg 2",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 176.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s2-label",
					"maxclass" : "comment",
					"text" : "3rd (~386c)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 176.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s3",
					"maxclass" : "message",
					"text" : "deg 3",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 204.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s3-label",
					"maxclass" : "comment",
					"text" : "5th (702c, perfect)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 204.0, 130.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s4",
					"maxclass" : "message",
					"text" : "deg 4",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 232.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s4-label",
					"maxclass" : "comment",
					"text" : "~7th (~906c)",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 232.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-oct-label2",
					"maxclass" : "comment",
					"text" : "—— OCTAVE ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 850.0, 268.0, 120.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-o-down",
					"maxclass" : "message",
					"text" : "oct -1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 290.0, 45.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-o-mid",
					"maxclass" : "message",
					"text" : "oct 0",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 905.0, 290.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-o-up",
					"maxclass" : "message",
					"text" : "oct 1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 955.0, 290.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-flex-label2",
					"maxclass" : "comment",
					"text" : "—— FLEX ——",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 850.0, 325.0, 120.0, 20.0 ],
					"fontface" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-f0",
					"maxclass" : "message",
					"text" : "flex 0",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 347.0, 45.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-f0-label",
					"maxclass" : "comment",
					"text" : "Pythagorean",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 347.0, 90.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-f05",
					"maxclass" : "message",
					"text" : "flex 0.5",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 372.0, 55.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-f05-label",
					"maxclass" : "comment",
					"text" : "blended",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 910.0, 372.0, 60.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-f1",
					"maxclass" : "message",
					"text" : "flex 1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 397.0, 45.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-f1-label",
					"maxclass" : "comment",
					"text" : "just intonation",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 397.0, 100.0, 20.0 ]
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
					"source" : [ "obj-root-num", 0 ],
					"destination" : [ "obj-root-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-root-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-deg-num", 0 ],
					"destination" : [ "obj-deg-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-deg-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-oct-num", 0 ],
					"destination" : [ "obj-oct-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-oct-msg", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-flex-num", 0 ],
					"destination" : [ "obj-flex-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-flex-msg", 0 ],
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
					"source" : [ "obj-s0", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-s1", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-s2", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-s3", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-s4", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-o-down", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-o-mid", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-o-up", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-f0", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-f05", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			},
			{
				"patchline" : {
					"source" : [ "obj-f1", 0 ],
					"destination" : [ "obj-gen", 0 ]
				}
			}
		]
	}
}
