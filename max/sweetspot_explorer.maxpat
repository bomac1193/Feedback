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
			50,
			100,
			1200,
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
		"lefttoolbarpinned": 0,
		"toptoolbarpinned": 0,
		"righttoolbarpinned": 0,
		"bottomtoolbarpinned": 0,
		"toolbars_unpinned_last_save": 0,
		"tallnewobj": 0,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0.0,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "SWEETSPOT EXPLORER \u2014 50 presets\nFluCoMa analysis + UMAP navigation\n\n1. Open step6_chaos_resonator, turn on audio\n2. Click [Start Sweep] below\n3. Wait ~3.5 min for analysis\n4. Click points on the map to recall presets\n\nRequires: FluCoMa package (Max Package Manager)",
					"patching_rect": [
						30,
						30,
						500,
						130
					],
					"fontsize": 12.0,
					"linecount": 8
				}
			},
			{
				"box": {
					"id": "obj-coll",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"text": "coll presets",
					"outlettype": [
						"",
						"",
						"int",
						""
					],
					"patching_rect": [
						30,
						180,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-coll-loadbang",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"text": "loadbang",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						230,
						130,
						60,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-coll-readmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "read presets.coll",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						155,
						110,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-sweep-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						30,
						240,
						24,
						24
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						150,
						30,
						30
					]
				}
			},
			{
				"box": {
					"id": "obj-sweep-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Start/Stop Sweep",
					"patching_rect": [
						60,
						240,
						120,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						45,
						155,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-metro",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "metro 4000",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30,
						270,
						80,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-counter",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 4,
					"text": "counter 0 49",
					"outlettype": [
						"int",
						"",
						"",
						"int"
					],
					"patching_rect": [
						30,
						300,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-sweep-done",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "0",
					"outlettype": [
						""
					],
					"patching_rect": [
						170,
						300,
						25,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-trig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"text": "t b b b i",
					"outlettype": [
						"bang",
						"bang",
						"bang",
						"int"
					],
					"patching_rect": [
						30,
						330,
						100,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-progress",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						210,
						330,
						50,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						170,
						155,
						50,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-progress-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "/ 49",
					"patching_rect": [
						265,
						330,
						50,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						222,
						155,
						50,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-s-toGen",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						30,
						390,
						55,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-preset-display",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "",
					"outlettype": [
						""
					],
					"patching_rect": [
						110,
						390,
						350,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						185,
						470,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-recv-L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"text": "receive~ feedback_L",
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						30,
						450,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-capture-buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ capture_buf 2000",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						280,
						450,
						160,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-record",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "record~ capture_buf 1",
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						30,
						480,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "delay 500",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						190,
						480,
						75,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-start",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "1",
					"outlettype": [
						""
					],
					"patching_rect": [
						190,
						510,
						25,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-stop-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "delay 2500",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						280,
						480,
						85,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-stop",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "0",
					"outlettype": [
						""
					],
					"patching_rect": [
						280,
						510,
						25,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-analyze-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "delay 2600",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30,
						570,
						85,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mfcc_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ mfcc_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						570,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mfcc_stats_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ mfcc_stats_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						600,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-shape_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ shape_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						630,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-shape_stats_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ shape_stats_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						660,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-loud_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ loud_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						690,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-loud_stats_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ loud_stats_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						720,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-pitch_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ pitch_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						750,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-pitch_stats_buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ pitch_stats_buf",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						780,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-feature_row",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ feature_row",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						510,
						810,
						140,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mfcc",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufmfcc~ @source capture_buf @features mfcc_buf @numCoeffs 13 @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						600,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-mfcc-stats",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufstats~ @source mfcc_buf @stats mfcc_stats_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						630,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-spectral",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufspectralshape~ @source capture_buf @features shape_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						660,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-spectral-stats",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufstats~ @source shape_buf @stats shape_stats_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						690,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-loudness",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufloudness~ @source capture_buf @features loud_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						720,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-loud-stats",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufstats~ @source loud_buf @stats loud_stats_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						750,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-pitch",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufpitch~ @source capture_buf @features pitch_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						780,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-pitch-stats",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufstats~ @source pitch_buf @stats pitch_stats_buf @numChans 1",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						810,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-comp-mfcc",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row @startFrame 0 @numFrames 1 @startChan 0 @numChans 13 @destStartFrame 0 @destStartChan 0",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						870,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-comp-mfcc-std",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row @startFrame 1 @numFrames 1 @startChan 0 @numChans 13 @destStartChan 13",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						900,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-comp-shape",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufcompose~ @source shape_stats_buf @destination feature_row @startFrame 0 @numFrames 1 @startChan 0 @numChans 7 @destStartChan 26",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						930,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-comp-loud",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufcompose~ @source loud_stats_buf @destination feature_row @startFrame 0 @numFrames 1 @startChan 0 @numChans 2 @destStartChan 33",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						960,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-comp-pitch",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.bufcompose~ @source pitch_stats_buf @destination feature_row @startFrame 0 @numFrames 1 @startChan 0 @numChans 2 @destStartChan 35",
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30,
						990,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-idx-hold",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "i",
					"outlettype": [
						"int"
					],
					"patching_rect": [
						230,
						1020,
						30,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-idx-sym",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"text": "tosymbol",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1050,
						65,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-addpoint-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "addpoint $1 feature_row",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1080,
						190,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-dataset",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.dataset~ sweetspots",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1110,
						170,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labelset",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.labelset~ labels",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						280,
						1110,
						160,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-umap-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "delay 500",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30,
						1170,
						75,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-build-btn",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						130,
						1140,
						24,
						24
					],
					"presentation": 1,
					"presentation_rect": [
						500,
						150,
						30,
						30
					]
				}
			},
			{
				"box": {
					"id": "obj-build-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Build Map",
					"patching_rect": [
						160,
						1142,
						70,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						535,
						155,
						70,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-post-trig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"text": "t b",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30,
						1200,
						35,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-normalize",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.normalize~",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1260,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-norm-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "fitTransform sweetspots sweetspots_norm",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1230,
						270,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-ds-norm",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.dataset~ sweetspots_norm",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						480,
						1260,
						190,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-umap",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.umap~ @numDimensions 2 @numNeighbours 10 @minDist 0.3 @iterations 200",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1320,
						440,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-umap-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "fitTransform sweetspots_norm sweetspots_2d",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1290,
						280,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-ds-2d",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.dataset~ sweetspots_2d",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						480,
						1320,
						180,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-kdtree",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.kdtree~",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1380,
						100,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-kdtree-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "fit sweetspots_2d",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1350,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-plotter",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.plotter",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1440,
						600,
						400
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						220,
						600,
						400
					]
				}
			},
			{
				"box": {
					"id": "obj-dump-2d-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "dump",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1385,
						40,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-delay",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "delay 200",
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						230,
						1385,
						75,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointcolor 0 0.9 0.2 0.2 1.0, pointcolor 1 0.9 0.2 0.2 1.0, pointcolor 2 0.9 0.2 0.2 1.0, pointcolor 3 0.9 0.2 0.2 1.0, pointcolor 4 0.9 0.2 0.2 1.0, pointcolor 5 0.9 0.2 0.2 1.0, pointcolor 6 0.9 0.2 0.2 1.0, pointcolor 7 0.9 0.2 0.2 1.0, pointcolor 8 0.9 0.2 0.2 1.0, pointcolor 9 0.9 0.2 0.2 1.0",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1360,
						300,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointcolor 10 0.2 0.8 0.2 1.0, pointcolor 11 0.2 0.8 0.2 1.0, pointcolor 12 0.2 0.8 0.2 1.0, pointcolor 13 0.2 0.8 0.2 1.0, pointcolor 14 0.2 0.8 0.2 1.0, pointcolor 15 0.2 0.8 0.2 1.0, pointcolor 16 0.2 0.8 0.2 1.0, pointcolor 17 0.2 0.8 0.2 1.0, pointcolor 18 0.2 0.8 0.2 1.0, pointcolor 19 0.2 0.8 0.2 1.0",
					"outlettype": [
						""
					],
					"patching_rect": [
						240,
						1335,
						300,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointcolor 20 0.3 0.4 0.9 1.0, pointcolor 21 0.3 0.4 0.9 1.0, pointcolor 22 0.3 0.4 0.9 1.0, pointcolor 23 0.3 0.4 0.9 1.0, pointcolor 24 0.3 0.4 0.9 1.0, pointcolor 25 0.3 0.4 0.9 1.0, pointcolor 26 0.3 0.4 0.9 1.0, pointcolor 27 0.3 0.4 0.9 1.0, pointcolor 28 0.3 0.4 0.9 1.0, pointcolor 29 0.3 0.4 0.9 1.0",
					"outlettype": [
						""
					],
					"patching_rect": [
						250,
						1310,
						300,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointcolor 30 0.9 0.8 0.1 1.0, pointcolor 31 0.9 0.8 0.1 1.0, pointcolor 32 0.9 0.8 0.1 1.0, pointcolor 33 0.9 0.8 0.1 1.0, pointcolor 34 0.9 0.8 0.1 1.0, pointcolor 35 0.9 0.8 0.1 1.0, pointcolor 36 0.9 0.8 0.1 1.0, pointcolor 37 0.9 0.8 0.1 1.0, pointcolor 38 0.9 0.8 0.1 1.0, pointcolor 39 0.9 0.8 0.1 1.0",
					"outlettype": [
						""
					],
					"patching_rect": [
						260,
						1285,
						300,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-color-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointcolor 40 0.7 0.3 0.9 1.0, pointcolor 41 0.7 0.3 0.9 1.0, pointcolor 42 0.7 0.3 0.9 1.0, pointcolor 43 0.7 0.3 0.9 1.0, pointcolor 44 0.7 0.3 0.9 1.0, pointcolor 45 0.7 0.3 0.9 1.0, pointcolor 46 0.7 0.3 0.9 1.0, pointcolor 47 0.7 0.3 0.9 1.0, pointcolor 48 0.7 0.3 0.9 1.0, pointcolor 49 0.7 0.3 0.9 1.0",
					"outlettype": [
						""
					],
					"patching_rect": [
						270,
						1260,
						300,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labels-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointlabel 0 Lorenz, pointlabel 1 Lorenz, pointlabel 2 Lorenz, pointlabel 3 Lorenz, pointlabel 4 Lorenz, pointlabel 5 Lorenz, pointlabel 6 Lorenz, pointlabel 7 Lorenz, pointlabel 8 Lorenz, pointlabel 9 Lorenz",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1240,
						350,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labels-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointlabel 10 Rossler, pointlabel 11 Rossler, pointlabel 12 Rossler, pointlabel 13 Rossler, pointlabel 14 Rossler, pointlabel 15 Rossler, pointlabel 16 Rossler, pointlabel 17 Rossler, pointlabel 18 Rossler, pointlabel 19 Rossler",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1215,
						350,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labels-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointlabel 20 Chua, pointlabel 21 Chua, pointlabel 22 Chua, pointlabel 23 Chua, pointlabel 24 Chua, pointlabel 25 Chua, pointlabel 26 Chua, pointlabel 27 Chua, pointlabel 28 Chua, pointlabel 29 Chua",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1190,
						350,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labels-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointlabel 30 Halvorsen, pointlabel 31 Halvorsen, pointlabel 32 Halvorsen, pointlabel 33 Halvorsen, pointlabel 34 Halvorsen, pointlabel 35 Halvorsen, pointlabel 36 Halvorsen, pointlabel 37 Halvorsen, pointlabel 38 Halvorsen, pointlabel 39 Halvorsen",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1165,
						350,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-labels-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "pointlabel 40 Aizawa, pointlabel 41 Aizawa, pointlabel 42 Aizawa, pointlabel 43 Aizawa, pointlabel 44 Aizawa, pointlabel 45 Aizawa, pointlabel 46 Aizawa, pointlabel 47 Aizawa, pointlabel 48 Aizawa, pointlabel 49 Aizawa",
					"outlettype": [
						""
					],
					"patching_rect": [
						230,
						1140,
						350,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-legend",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "RED=Lorenz  GREEN=Rossler  BLUE=Chua  YELLOW=Halvorsen  PURPLE=Aizawa",
					"patching_rect": [
						30,
						1415,
						500,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						200,
						500,
						18
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-click-buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "buffer~ click_xy 1 2",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						330,
						1860,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-click-unpack",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "unpack f f",
					"outlettype": [
						"float",
						"float"
					],
					"patching_rect": [
						30,
						1860,
						80,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-peek-x",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"text": "peek~ click_xy 1 0",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						30,
						1890,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-peek-y",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"text": "peek~ click_xy 2 0",
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						170,
						1890,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-knn-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "knearest click_xy 1",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1920,
						130,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-kdtree-query",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"text": "fluid.kdtree~",
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						1950,
						100,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-kdtree-query-fit",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "fit sweetspots_2d",
					"outlettype": [
						""
					],
					"patching_rect": [
						150,
						1950,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-knn-fromsym",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"text": "fromsymbol",
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						1980,
						80,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-recall-coll",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"text": "coll presets",
					"outlettype": [
						"",
						"",
						"int",
						""
					],
					"patching_rect": [
						30,
						2010,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-recall-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						30,
						2040,
						55,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-recall-display",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"text": "",
					"outlettype": [
						""
					],
					"patching_rect": [
						110,
						2040,
						350,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						630,
						470,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-recall-idx",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						170,
						1980,
						50,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						490,
						630,
						50,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-manual-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Manual preset #:",
					"patching_rect": [
						380,
						1860,
						110,
						22
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						660,
						110,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-manual-num",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						500,
						1860,
						50,
						22
					],
					"minimum": 0,
					"maximum": 49,
					"presentation": 1,
					"presentation_rect": [
						120,
						660,
						50,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-manual-coll",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"text": "coll presets",
					"outlettype": [
						"",
						"",
						"int",
						""
					],
					"patching_rect": [
						500,
						1890,
						120,
						22
					]
				}
			},
			{
				"box": {
					"id": "obj-manual-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						500,
						1920,
						55,
						22
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-coll-loadbang",
						0
					],
					"destination": [
						"obj-coll-readmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-coll-readmsg",
						0
					],
					"destination": [
						"obj-coll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sweep-tog",
						0
					],
					"destination": [
						"obj-metro",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-metro",
						0
					],
					"destination": [
						"obj-counter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-counter",
						2
					],
					"destination": [
						"obj-sweep-done",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sweep-done",
						0
					],
					"destination": [
						"obj-sweep-tog",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-counter",
						0
					],
					"destination": [
						"obj-trig",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig",
						3
					],
					"destination": [
						"obj-coll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-counter",
						0
					],
					"destination": [
						"obj-progress",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-coll",
						0
					],
					"destination": [
						"obj-s-toGen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-coll",
						0
					],
					"destination": [
						"obj-preset-display",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-recv-L",
						0
					],
					"destination": [
						"obj-record",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig",
						2
					],
					"destination": [
						"obj-rec-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-delay",
						0
					],
					"destination": [
						"obj-rec-start",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-start",
						0
					],
					"destination": [
						"obj-record",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig",
						2
					],
					"destination": [
						"obj-rec-stop-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-stop-delay",
						0
					],
					"destination": [
						"obj-rec-stop",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-stop",
						0
					],
					"destination": [
						"obj-record",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig",
						0
					],
					"destination": [
						"obj-analyze-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-analyze-delay",
						0
					],
					"destination": [
						"obj-mfcc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mfcc",
						1
					],
					"destination": [
						"obj-mfcc-stats",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mfcc-stats",
						1
					],
					"destination": [
						"obj-spectral",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-spectral",
						1
					],
					"destination": [
						"obj-spectral-stats",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-spectral-stats",
						1
					],
					"destination": [
						"obj-loudness",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loudness",
						1
					],
					"destination": [
						"obj-loud-stats",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loud-stats",
						1
					],
					"destination": [
						"obj-pitch",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pitch",
						1
					],
					"destination": [
						"obj-pitch-stats",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pitch-stats",
						1
					],
					"destination": [
						"obj-comp-mfcc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-comp-mfcc",
						1
					],
					"destination": [
						"obj-comp-mfcc-std",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-comp-mfcc-std",
						1
					],
					"destination": [
						"obj-comp-shape",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-comp-shape",
						1
					],
					"destination": [
						"obj-comp-loud",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-comp-loud",
						1
					],
					"destination": [
						"obj-comp-pitch",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-counter",
						0
					],
					"destination": [
						"obj-idx-hold",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-comp-pitch",
						1
					],
					"destination": [
						"obj-idx-hold",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-idx-hold",
						0
					],
					"destination": [
						"obj-idx-sym",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-idx-sym",
						0
					],
					"destination": [
						"obj-addpoint-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-addpoint-msg",
						0
					],
					"destination": [
						"obj-dataset",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-counter",
						2
					],
					"destination": [
						"obj-umap-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-umap-delay",
						0
					],
					"destination": [
						"obj-post-trig",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-build-btn",
						0
					],
					"destination": [
						"obj-post-trig",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-post-trig",
						0
					],
					"destination": [
						"obj-norm-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-norm-msg",
						0
					],
					"destination": [
						"obj-normalize",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-normalize",
						1
					],
					"destination": [
						"obj-umap-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-umap-msg",
						0
					],
					"destination": [
						"obj-umap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-umap",
						1
					],
					"destination": [
						"obj-kdtree-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kdtree-msg",
						0
					],
					"destination": [
						"obj-kdtree",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kdtree",
						1
					],
					"destination": [
						"obj-dump-2d-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dump-2d-msg",
						0
					],
					"destination": [
						"obj-ds-2d",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ds-2d",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dump-2d-msg",
						0
					],
					"destination": [
						"obj-color-delay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-color-0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-0",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-color-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-1",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-color-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-2",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-color-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-3",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-color-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-4",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-labels-0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-labels-0",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-labels-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-labels-1",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-labels-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-labels-2",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-labels-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-labels-3",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-color-delay",
						0
					],
					"destination": [
						"obj-labels-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-labels-4",
						0
					],
					"destination": [
						"obj-plotter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-plotter",
						0
					],
					"destination": [
						"obj-click-unpack",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click-unpack",
						0
					],
					"destination": [
						"obj-peek-x",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click-unpack",
						1
					],
					"destination": [
						"obj-peek-y",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-peek-y",
						1
					],
					"destination": [
						"obj-knn-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-knn-msg",
						0
					],
					"destination": [
						"obj-kdtree-query",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-umap",
						1
					],
					"destination": [
						"obj-kdtree-query-fit",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kdtree-query-fit",
						0
					],
					"destination": [
						"obj-kdtree-query",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kdtree-query",
						0
					],
					"destination": [
						"obj-knn-fromsym",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-knn-fromsym",
						0
					],
					"destination": [
						"obj-recall-coll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-recall-coll",
						0
					],
					"destination": [
						"obj-recall-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-recall-coll",
						0
					],
					"destination": [
						"obj-recall-display",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-knn-fromsym",
						0
					],
					"destination": [
						"obj-recall-idx",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-manual-num",
						0
					],
					"destination": [
						"obj-manual-coll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-manual-coll",
						0
					],
					"destination": [
						"obj-manual-send",
						0
					]
				}
			}
		],
		"dependency_cache": [],
		"autosave": 0
	}
}