{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 541.0, 198.0, 708.0, 623.0 ],
		"bglocked" : 0,
		"defrect" : [ 541.0, 198.0, 708.0, 623.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "sleep timing for I/O thread in usecs. Should be at least 1000, CPU goes down drastically at 2000, but so does haptic resolution.",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 257.0, 183.0, 216.0, 41.0 ],
					"id" : "obj-18"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "sleep_time 1000",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 225.0, 163.0, 99.0, 18.0 ],
					"id" : "obj-11",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "More Notes:\n- np_nifalcon has been tested with 7 falcons simultaniously, but should be able to run as many as you can throw at it. While CPU usage varies per machine, expect at least a 10% CPU usage per device just due to I/O.\n- Watch the max message window for error and status reports",
					"linecount" : 8,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 5.0, 517.0, 203.0, 89.0 ],
					"id" : "obj-39"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 403.0, 512.0, 35.0, 17.0 ],
					"id" : "obj-27",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 364.0, 512.0, 35.0, 17.0 ],
					"id" : "obj-16",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 326.0, 512.0, 35.0, 17.0 ],
					"id" : "obj-17",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack f f f",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontname" : "Arial",
					"patching_rect" : [ 334.0, 490.0, 61.0, 17.0 ],
					"id" : "obj-20",
					"outlettype" : [ "float", "float", "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "y",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 369.0, 528.0, 27.0, 18.0 ],
					"id" : "obj-23"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Kinematics Values\n(in meters)\n\n-0.06 <=~ x <=~ 0.06\n-0.06 <=~ y <=~ 0.06\n0.07 <=~ z <=~ 0.17",
					"linecount" : 6,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 340.0, 544.0, 109.0, 75.0 ],
					"id" : "obj-28"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "x",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 333.0, 528.0, 27.0, 18.0 ],
					"id" : "obj-29"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "z",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 405.0, 528.0, 28.0, 18.0 ],
					"id" : "obj-34"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i i i",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontname" : "Arial",
					"patching_rect" : [ 236.0, 489.0, 58.0, 17.0 ],
					"id" : "obj-35",
					"outlettype" : [ "int", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i i i i",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontname" : "Arial",
					"patching_rect" : [ 457.0, 510.0, 64.0, 17.0 ],
					"id" : "obj-36",
					"outlettype" : [ "int", "int", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 551.0, 481.0, 15.0, 15.0 ],
					"id" : "obj-37",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "center",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 510.0, 554.0, 38.0, 18.0 ],
					"id" : "obj-44"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "right",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 438.0, 554.0, 30.0, 18.0 ],
					"id" : "obj-45"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "top",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 474.0, 554.0, 29.0, 18.0 ],
					"id" : "obj-46"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "left",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 546.0, 554.0, 30.0, 18.0 ],
					"id" : "obj-47"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "right",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 244.0, 532.0, 30.0, 18.0 ],
					"id" : "obj-48"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 280.0, 515.0, 35.0, 17.0 ],
					"id" : "obj-52",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 244.0, 515.0, 35.0, 17.0 ],
					"id" : "obj-53",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 208.0, 515.0, 35.0, 17.0 ],
					"id" : "obj-54",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 438.0, 539.0, 15.0, 15.0 ],
					"id" : "obj-55",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 474.0, 539.0, 15.0, 15.0 ],
					"id" : "obj-56",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 510.0, 539.0, 15.0, 15.0 ],
					"id" : "obj-57",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 546.0, 539.0, 15.0, 15.0 ],
					"id" : "obj-58",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Motor Encoder Values\n(in encoder ticks)",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 210.0, 547.0, 125.0, 29.0 ],
					"id" : "obj-73"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "top",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 208.0, 532.0, 29.0, 18.0 ],
					"id" : "obj-74"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "left",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 280.0, 532.0, 30.0, 18.0 ],
					"id" : "obj-75"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Default Grip Buttons",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 462.0, 571.0, 110.0, 18.0 ],
					"id" : "obj-76"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "status (homing)",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 549.0, 500.0, 52.0, 29.0 ],
					"id" : "obj-82"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "unused*",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 475.0, 476.0, 49.0, 18.0 ],
					"id" : "obj-95"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p listpacker",
					"fontsize" : 11.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 472.0, 420.0, 84.0, 19.0 ],
					"id" : "obj-26",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 469.0, 350.0, 106.0, 106.0 ],
						"bglocked" : 0,
						"defrect" : [ 469.0, 350.0, 106.0, 106.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 4.0, 76.0, 25.0, 25.0 ],
									"id" : "obj-23",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 56.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-22",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-21",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack f f f",
									"hidden" : 1,
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 1,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 55.0, 51.0, 17.0 ],
									"id" : "obj-18",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "bondo 3",
									"hidden" : 1,
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 3,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 35.0, 44.0, 17.0 ],
									"id" : "obj-20",
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 4.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-17",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-20", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-20", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 2 ],
									"destination" : [ "obj-18", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 1 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 12.0,
						"default_fontsize" : 12.0,
						"fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p listpacker",
					"fontsize" : 11.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 352.0, 421.0, 91.0, 19.0 ],
					"id" : "obj-25",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 469.0, 350.0, 106.0, 106.0 ],
						"bglocked" : 0,
						"defrect" : [ 469.0, 350.0, 106.0, 106.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 4.0, 76.0, 25.0, 25.0 ],
									"id" : "obj-23",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 56.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-22",
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-21",
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack f f f",
									"hidden" : 1,
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 1,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 55.0, 51.0, 17.0 ],
									"id" : "obj-18",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "bondo 3",
									"hidden" : 1,
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 3,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 35.0, 44.0, 17.0 ],
									"id" : "obj-20",
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 4.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-17",
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-20", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-20", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 2 ],
									"destination" : [ "obj-18", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 1 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 12.0,
						"default_fontsize" : 12.0,
						"fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p listpacker",
					"fontsize" : 11.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 237.0, 420.0, 93.0, 19.0 ],
					"id" : "obj-24",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 422.0, 351.0, 106.0, 106.0 ],
						"bglocked" : 0,
						"defrect" : [ 422.0, 351.0, 106.0, 106.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 4.0, 76.0, 25.0, 25.0 ],
									"id" : "obj-23",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 56.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-22",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-21",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack f f f",
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 1,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 55.0, 51.0, 17.0 ],
									"id" : "obj-18",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "bondo 3",
									"fontsize" : 9.0,
									"numinlets" : 3,
									"numoutlets" : 3,
									"fontname" : "Arial",
									"patching_rect" : [ 4.0, 34.0, 44.0, 17.0 ],
									"id" : "obj-20",
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 4.0, 4.0, 25.0, 25.0 ],
									"id" : "obj-17",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 1 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 2 ],
									"destination" : [ "obj-18", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-20", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-20", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 12.0,
						"default_fontsize" : 12.0,
						"fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "y",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 392.0, 378.0, 27.0, 17.0 ],
					"id" : "obj-5"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "x",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 356.0, 378.0, 27.0, 17.0 ],
					"id" : "obj-6"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "z",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 428.0, 378.0, 28.0, 17.0 ],
					"id" : "obj-7"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "right",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 275.0, 379.0, 27.0, 17.0 ],
					"id" : "obj-8"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "top",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 239.0, 379.0, 27.0, 17.0 ],
					"id" : "obj-9"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "left",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 311.0, 379.0, 28.0, 17.0 ],
					"id" : "obj-10"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 388.0, 393.0, 35.0, 17.0 ],
					"id" : "obj-12",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 424.0, 393.0, 35.0, 17.0 ],
					"id" : "obj-13",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 352.0, 393.0, 35.0, 17.0 ],
					"id" : "obj-14",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "kinematic force\nused in \"vector\" mode\nunits are newtons",
					"linecount" : 3,
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 356.0, 340.0, 100.0, 38.0 ],
					"id" : "obj-15"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 570.0, 375.0, 48.0, 17.0 ],
					"id" : "obj-19",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 568.0, 396.0, 15.0, 15.0 ],
					"id" : "obj-30",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 311.0, 394.0, 35.0, 17.0 ],
					"id" : "obj-31",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 274.0, 394.0, 35.0, 17.0 ],
					"id" : "obj-32",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontname" : "Arial",
					"patching_rect" : [ 237.0, 394.0, 35.0, 17.0 ],
					"id" : "obj-33",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 537.0, 390.0, 15.0, 15.0 ],
					"id" : "obj-49",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 505.0, 389.0, 15.0, 15.0 ],
					"id" : "obj-50",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 472.0, 388.0, 15.0, 15.0 ],
					"id" : "obj-51",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 463.0, 373.0, 33.0, 36.0 ],
					"id" : "obj-69",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 0.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 529.0, 373.0, 33.0, 36.0 ],
					"id" : "obj-70",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 1.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 496.0, 373.0, 33.0, 36.0 ],
					"id" : "obj-71",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Front LED Control",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 473.0, 356.0, 84.0, 17.0 ],
					"id" : "obj-72"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "raw motor force\nused in \"Raw\" mode\nunits are ?",
					"linecount" : 3,
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 239.0, 341.0, 100.0, 38.0 ],
					"id" : "obj-88"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "homing status\nloadbang and leave on\ntrust me",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 582.0, 393.0, 115.0, 41.0 ],
					"id" : "obj-90"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Have the I/O thread automatically output data.",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 281.0, 270.0, 137.0, 29.0 ],
					"id" : "obj-4"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Manually poll using bangs to the first inlet. ",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 19.0, 266.0, 137.0, 29.0 ],
					"id" : "obj-3"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "auto_poll",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 227.0, 272.0, 55.0, 17.0 ],
					"id" : "obj-2",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "manual_poll",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 149.0, 245.0, 70.0, 17.0 ],
					"id" : "obj-1",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Selects whether to use vector or raw inputs for motor force updates. You most likely want to use vector.",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 14.0, 316.0, 168.0, 41.0 ],
					"id" : "obj-93"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "start and stop the I/O update thread. ",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 236.0, 233.0, 153.0, 29.0 ],
					"id" : "obj-92"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Send firmware to falcon if needed. Always required to run after opening before accessing falcon..",
					"linecount" : 4,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 22.0, 154.0, 139.0, 52.0 ],
					"id" : "obj-86"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Counts the number of falcons connected to the system and prints to max window",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 222.0, 120.0, 162.0, 41.0 ],
					"id" : "obj-83"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Closes Falcon currently opened on this object",
					"linecount" : 2,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 56.0, 89.0, 116.0, 29.0 ],
					"id" : "obj-85"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Opens a Falcon. If an integer argument is included, will try to open falcon at that index (indexes start at 0). Bangs first outlet on success, prints to max window on error.",
					"linecount" : 5,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 222.0, 46.0, 173.0, 64.0 ],
					"id" : "obj-84"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "By Nonpolynomial Labs \nhttp://www.nonpolynomial.com\n\nMore info on libnifalcon at http://libnifalcon.nonpolynomial.com",
					"linecount" : 5,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 477.0, 62.0, 178.0, 64.0 ],
					"id" : "obj-100"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "np_nifalcon",
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 18.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 552.0, 6.0, 103.0, 27.0 ],
					"id" : "obj-61"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Connect to and control a Novint Falcon Haptic Device",
					"linecount" : 2,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 477.0, 33.0, 178.0, 29.0 ],
					"id" : "obj-62"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"embed" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 555.0, 246.0, 100.0, 100.0 ],
					"id" : "obj-78",
					"data" : [ 15840, "", "IBkSG0fBZn....PCIgDQRA...PF....YHX.....bhWIU....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wIy8l1ikkbdme+hHNq2sLu4ZkYszUUc0araR1jMaRwgjiDIGyQMk8LFBBfB1.7EVB5UBvVeAj4WA8EvFFi8.XaLBRlRPZDElYHojHa1jTrYuvdsptpLqbe4teViH7Khy4j2r5tYuTMMc.jUVYl2LuwIdh3Y4+y+mmPn0ZqPHPHDXLFJJJHMMkhhBLFCRoje4Cy6wOuZHdGdcVIVMHDJrBCt4g08xEB.nznQq03ohbesE788QJTjkkgR3dsRo6yB.q0hoTi0ZQoDn0ZTBAJkBgEzZM.n78H2T.RwYSSq622ZceOIBdmFx4dxsuyuD2qSJcyGio4qUJEdddnTJBCCaVisVKd0+BkkkTVVRQQQyD98VXb+OTJEfbtGJaiv.nYhaztIrPHQq0TZzXLFhhhPqKorTiwThvJQ4IvSoPoTU+NBj3DXFqAiwI7OagRb16oa+PyO+8Z7KSX71dsyIX.2FCOOOpOP.f27+vrrLxyywZsHkRjR449CbeMruyB22oGnyOoMnTplMIdgA.tSNggwjUThTJv2O.vGqELFMY4kXro3444ddPTsAyhP4d1PJwVZOuPP3lmBa0WWMOD2ir486ph6z1Ym5sVKZst4Yz22GgPzHX7t2WnVqO2NzeUObyKCm+Q7rmdgPfR4i0XpTAoPWZPqs.kHkdHkfUHPXrTVTPVdJoooTVVvRK1GKFL.Rr3IUfzh1ZwVTTIXDMuWv6uSFueG2qvn9y0ejmm2nBCl6DhTJaN5T+++H6zw6qgrw9A3Vz.vS4immGZqlzjDlNHih7RlMKkjjLxxOSUaYQV0CsSvoTBtvE1.str5YwfP4d1zk4TTVPPT341.VunQ0B186ly4EHyaqn9yyeZA.u52z4EFyKP9U6oE46fcJ2jyVcJY1rYtEPqfACFwvAiPoTTTnYu8ODPgTJw22mnnXZEESbqPBCCw2WQdo6umwBFqESdIp.E99gn78vTcxa9g0ZeWLk+QyndM8cxNk27eQsQm4kje3EHuebHvI3sFAVbdEYp9b8DMurz48gW.kkkLY1TVYkUn6Bs3jSGBnHHpEKzoK8VnCsZ0BOOU0CqlIylhuuy39rYSoHOmfHe50oKsZ0hrrYmaCohJ0V.NoR0Fj6YY3dso7tMt2SeuSe+y4Dy7uXiwzri4W0mLZdeMUd6T48i1XvXKalGK1uOkkFBCionPynwSXkUVg98WlgCFyJqcQDBEdhJWLQSYotQMkmmDozixxRlNcFmbxInTRxVof9KoAi87ZF3LUKNUW2eOoyeJXdAR8++d0PbNAh0Zc93KctV9QgauBg5bSBq0hTnpzwqnPWRQdN44EXLkNUOgsPE39499g36avhjvnHhhhvyKfQCmv5quAVqgx7RLBA999XQ67TTBAAATTlSjJhSN5HJsFZ2qKas0cHsHmUVYEVZ49LYxDxxxHKq.gPPbbLgdJxyyo5XBh4b5v4MFM1Z9kMd2NUTObaZ7N6+e+rX+9YbuSHANATsg3BcYi2SAAADD3guuOp.Uka20FDcBHgP4rsg6qMFKBoFcoAK5JgnGnjUtRZ412dKFN7TVXgEHLLDPvAGbH6c3gzu+R36EfQedW8yysMA04dP9U8Jka7Qi.QXd2iyn1oATHP.BWjy0AfZENewCB7IHH.ouKRV2hifrhBPHPUs.WGrWoUi0nwX.ekh.OIBAH8THDN2ImNZJ999rPmt34IY1rYLYxDBChQI84zSFRRRFgggXP.EY3q7HMKgz7bZ2tMBqK9m4il2BHrt.J4iXy+2m5jducKtIR44PDHOOuIPuff.hhhHNNtRczYGe0Zy41k56GfmmyynzzTlMaFkEYfvfPVY6QWznZTq0jllRPP.YIILXv.N5niX1rYDGGyImbBGd3gU+s8OCtjpSgkUNTL+3cyH8GUie0iMBTolRfw314VV5BnKLLlVsZgeXHp.erxybtPacebFVPUpT77nzXHIIgwiGivnAcIlhbxSlQ1roTjmhTXILvCitfa8VuI+zexOiE5r.Oz0eHz4ZJJbmt1a2CHKsnQUk1BdA93666fnwZnzNuqwFDBKVwGLXSd+N9UrMDmWKtETMkkkMHA366SXTDddJXNHZpetmGeGiFPc1or77RxxJnnn.KZLZmMH+.IFikrjojjjvjYor+96y3wiIIIgUVYEVe80Yqs1BsVSPP.md5oLb3P7762722yymvfHJ0En0kt4hr1ine0ZL4W4F0q24UT3bCUob69BCCqrIHQasXzVPXqBJ0CaE5vlJU3nbvrTTTPYoyE4ff.lMYB4Eon0Z788AqjwSmvwGeLiGOg8N3HVXgEXsUWkAmdJsa2kkWdU1YmcpvHqfCN3.hhhb1RrNmMDUnCmmm5NYRcrJ+pc85WIBDqPVYjWhTIc1MJKPfhf.OBihPUAllRIvnoBUfyNYXo56g.qThT3T8UVZvfErBBaGwIGtCGr6NbxICPJkDEE4BBLMi77R1byMwhjE50iQiGykDVt10d.1aucvySRdtlACFvxKuLsZGgN2RVVFdRQkWb.XvJ7vJsXsxekFi18sMDaE7JJkBgRhAAkFPKjXUJRKMjoMTh.qmDUfOReODUQS6lDV7jB7DRjVvZ0M5r03hMprDlLKA+fXlkjSPXaVZ403AezOFAc6hW6VjnsLsPyoSyHt6RzdgkXwUVmd8WhvnVLX7HRKxwJsrx5qPtNGoBNcvwb5ficwdgnxCJ2li53dJKMjLKihbMRgGRgWiiIeTN9HwndsQXqU.RODRO.G9SIYETZ.gxGUE9QBk6s0HLnKt2nkoId.WtRDHEPoARSyozXw2y4l5fQioc2dzekUPi.iDlljiWPHHjrvh8cmjBhHW6B573iOFkRQmtsvXc1GBBB3jSNoRcXNAAAMnV.yaOyEWjVWA7Hp200jOri6+SHb9DuLOplZstI+JtXMBdaIjwXLHjtL6IDVLhyiFppR3UTTRZZJ.DE4xd3ngSvyyi0VaMhhhp.crfnnHDBgKNhJGHzZMQQQbzQGQQQAqzeIBTtbkDDDTYyYrK6hUw5buncW6196+ro9Aebe9W7LjgqG0X2TnsTTT.PUzy9MBi53DDBgKfq4DNkkkM6NMZvSBEEVlNMgh7R7TA36Gh.G7NiGOltc6x5quNRoWUz9AUp4JafAxyyiffHRSS4zSOkd8Vj9862LWxxx3jSNAgPPYYYk8iyCWx7o49WEpqbqn2u+AjRjBuFLqpWL0Zmat9gA3E3WA6w7oM0fPBBgEoBPXnzV1jsRkzy4gFv3wiYznQUdooNGtaCNYH9p.t3FWBIN0OVqk3vHxSyvyyirrLhCBwSHIzymiN3.DBAqu9FM+7Z0YVqkzzzl.Te2x3W8FmOpGejblqd2i1JPabocsNWJt7R3+1RNS8vHbw6qq99NPGknpHsv3QoLd7TRlkR8yeMRvJkhoSmhVqYwEWjNc5fTJonnfffflMAFqtQskuuOSmjvvgCYwEWjd85QQQAwwwLZzHlMalCRmJAw8h.97HNTqA3ixw8s.wXvYL2JO2CfPHP5M2ICAN0SU4xFYUNGjhpndkN2kqNoUTBilNkSNY.EE5l+NXrnDxlElzzTRSywyyiKe4KSfmBg0f1TRXT.VLMFoKJxZPWc+8NDOU.qs1ZMKz444b7wGimmWich5molStJ27q193G0i6aAhVqcvbfEmWHVLHQn7ZN1et2PoDUUZTmOakvYpGzFXRxLFNXLiGOEARhhZ0bJyyyCOeGwGxyJHKyk51KcoK0Pql777FbuhhhnrLuATy33XN8zSwXLzue+yoFbvfADDDPdddif3dSCassj++kt8JU93oBPJ8N2oi5czBoGHN6AtFWpFUWJI4ZCkFvKH.qTvfwS33iNkQilPXbDHEM4d1sPTfvZHvymNsZycdqsncbK50oK.zue+FLt7kBT31cGFFR6VsXvomhDEylNEkRw5quNIIIzsaWN7vCIMM0E0Oz77.zPBj5SJBgfiO9XRRRN2y76Vxm9+SDHv76rOifY.usI28NAMBAoI4HEdD349YCGNhiN7DRRxv2Ojh7xF0LsZ0hdKzgNcaQPnGBoag1yyyI7BC45W+5Ld7XTJEkkkm6zW87vyykAwSOYHJoOsZ0pgpQ999LYxjykq8eYn5NuZ52o0jOni6aARS.SZ6bODRmWWB0YpjprUXvhdNDT877wJfbCLX3LN9jQLZRBkFKd9ADGGWAMtlhhLxySqT+3xvXRRBYYYbm6bGrVA23F2vAbXnGREHjVmfqhUiRgG9dgn0FN7vCwXLrvBKPqVsnnn.OOuFuspMtO+B76zGy6008pB9C539DKKGdUZp4zUk8CAvbDGndxYLFGrDBChp8BgAJFOsjSN4jJOlr36EbNUFMpHjU1O7jDF4QbqH7UtLLllk3xA+hcYwE60r3VunTeBn104xRMylMigCGxJqtDKu7xMmLFLXvbBAp9+L22ydtS.043oleUusXs9.thdeObmN3btGVOZxuQ0hQst1ZUXyRsb7IC3viNgwSRvXgfnXTJem.13VLqShkuuBvfwThVWfxy82IOIkAGeBoSy3Au10pV3EfQiUWhR4dewXPBDnbw4b3gGhTJY0UW0kC9hBlMa1uzSDuaBjxxx660x6qSHV2JtaQGK0I0D3s44j.G7Hdd9HjVzEEjWVxN28.RRKvXrNtRo7c5isJDBIQwA34IQ4IaH.mmuuSUQokIxDzkFRBCY73gzoSKdfG3AXmc1t482E4sOJkfxlrO5SoUyvACXxjIzsaWVbwE4f8RnrzoJr16qpGyy87buBDq0RXX34TS8gAU3OBhCo5zg1EOhP3HhPyDVIwJOiDd.jmmyomdJ6ryNLXvHxycKXA9QHEdXMNaN9gAMrSwyyi1saS+EaSu1wDFFfEmZmrjDJJJ3zSOEvkV3d85QZZJBgXtrTdl2Qy64zQGcDBgfUWc0J6UVFMZz6pQ84EHmkumhywBw4eO9fLtuyGhaxN+ar4b+r5.obDKShVaY1zTN5vS4viOgNcWDCJLTk6bgoB6KAgARBB7wOvi3PO7CfBsk6d26xy+7+LdsW6043CFfszolbkUVh0VaMjJX4kWkQiF0fMUYYIQQQT6nmkRv3TkMXv.1byMYgEVfff.RSSYxjIrvBKf0dduEe6FpkUBGQkS.uydY99cbeKPDBAkEknMk34ovySg05BSzOvuIXrH+.TRIGcvobyadSxRRo2h8AY.kkEHQQ2E6x3gmRQ4L1biGfIiGRPfGddFhCfwI47c+u784m8y9Yr8N6xvgCQUwVceeeFLd.u7q9Jr9l+lr7pqx+7y+73qTNHUDvnQCHz2GgDxSyPHMDGDy96tGOxC8vnjRVd4kcXmMX.W9hWDu5xen77knQccnTTVhmW.oI4LYxLhi5RX2VUdc473zMd+g60GIBj2sgwXnnB1aSglae66xwGdBFCDG2kxBCREH8bdJc5fiIzyikVbIxRmguuGg9RZEEvVauK+k+U+Uryc2iW+0eSJMV50qGXzmK3s6d26RZZNBgkEWbQdwe9OmM2bSZGGQmNc.rLc5ThB8QI7ozTRXXH28t2kG7AeP50qG999MpfjRw4rWTqRxXcuuVinRssAcorAk5Ori6eaHU1Nbog8L6HXkXzfR4QVVN6u+gbm6rMGezofUhxK.s8rGv5EgvvPhiiIMMk986SqnHdiadS9y+K+K3kdoWhm8YeVBicdbUVVBREJeO7CCvOLf82eelLYBQQs3F23gY3vgr+96ygGdXStxAZvLyXLDFF1P7gkWdY51sK444jkkcNvEq8Vb9Op+Y0whTiA1u1DHk1J93ZLUwgHPJbdHYsNt6d2s2kacqaQZRdUxkjMFYEBAVsFgE51sqKISYtWmmDty1aye9+g+Bd4W9WvgGbLW+FODkkF5u3RTVnc4HwK.iw4syQGcDu3K9hM7w5RW5RLb3PN7vC4niNBsVSud8nrrjrr7lzFjmmyQGcDsa2lkWdYLFSCj+yaGndwuImMyIjbYb79CV9OhR4kK.QrBD3H2r0JHuzv1auC6rydLZxLTAgDF2BswRQQoiiuUPYjmm2jKCeeeVd4E4NauC+e++0+AN8zSY6s2l9862jroW6Mdc13hWhqeiGhG4QeLdfqdM1XyKwZWXCt6t6gTJINNlG4QdD.2B9AGb.mLXHdAgjlW3JxGgfhhB50qGau81trItxJDFF9tJPlOah0Bf4EHeXhPe9Ux6igSP3fFQUsiWQo1x3oIb7wC4Ue0WmjjLZE2EkzizjrygwTcNSLFCkY4njR50qMZM789deOt0stE6u+9r4laxomdJBghYSS3ge3Gktc6hP4iAItv8DHUdryN6va8V2gYylwEtvEXwEWjvvvF30O8zSahandWdMSFO93ioUqVr7xKWUEVmwD+4EFyCax7pzl2s2esfkkSmosI9CcokISlv96eHu0stMyRRwhnIx6xRCBwYPL.NWhi7c0Nny1fkm+4eddwW7knzZQCjljyxKuLmd5o7vO5iv0t10vOLF+fHRyzHUg3EzBe+PhiZwctycbn61tMW5RWhffHhiaSZdA6cvgDDESg1kx35rFJkR1e+8Af0We8lfJuWUT2qck6MPwOrwf7Qh.IOOmBccw1XoPWxzoIbzgGyN6rCKt3RXsBRRRZPSsVXHkRDFW9rCi7IJJh1sawImbBO2O5mvzoSY73wDEEQPP.CGOgKc4qfT5wzIInT9H77XRRBEFSyISomOu5q85jllSbTatvEt..UEyiWkQ+HlLYhKMyUH7FEEwfACnrrjEVXgl7w+NcJXdgw613WKmPLVKdUtsJDB1d6s4EewWjQiFgeXDIyxbtAJTXQ5bB.Klpce.zNJtwHbXH7ZuxqxMu4MAbmXTJEGd7Qr95qS+98INNFqTfEAKr3RbsG7QnU6tHpfneznQ366ya7FuAYYY7.W4Zzo6BDE2ltcV.iFt8V2kVwc.nIYTRojiO93F392byMYvfAzpUKlLYRyN+ZAUcRvp8rJNNtIPzOr0Wy8M62Ci7whgAiN0Yz7jSXZRJZKmKSbm+XckWHB2+WHstnnEvfSR3N24NtZGon.kRQxrLZ0pCwwsINtMRu.BCiocutbzwC4zQiIMq.KN2oU9gjllxN6rSCXlarwFMzOs+JKiw.I4temZF3WuA4UdkWA.5zoCZsljjjle97t0Ve5wwnEWI2EFF9gVcE7QT9Pxyy4jSNg82eeFNbXS4FHPgFAZNevUyOpQGNJvQFhs2datyctCBqEEBBCbmdVZokHHHn48KOOmxBCyRyIKW6x5n1hUJcI1pPyt6tKiGOFq0xku7kwZsDD2hUVYMTRORRRZ9nlBRc61sgquarwF3662n1rFBl5T2Vq1pFqsjjDhiiOyc9e8XTOihhLlLcLilLzIHjbOF.ctB5JrSsCW3pSG0pJb49Nj6bm6vjIyZxPX8zbokVADRxpJi.swxzjTha2lfnVnpn6YVpiIHBkjjzL1Zq6hwXXokVhvPW04FEEQmdtf+hhhZTYU682rYyXqs1hjjD52ueCSTpOAUaSoNeK0F+mNcZCCa90l.wwHQuFDOmmpLElBp4oqFWw5aprenqp1VgPfRHanTy1auMdddU4.OloSmRPP.c5zogbAQU0ZnwXP5EfP4gR4gAIYEkXQfumS0wcu6cQqcc8gkWd0lxWawEWBaUAdV6oUcpc61sK6u+9zpUKVZokvXLMN.TG2Rs5zZaFYYYMkZwuVEHc65xwsR4lXFgADBLlxyoK0cxPi05pEPiojRaIJgrAKpQiFyImbRSdEjRIYYYzcgdUFTcY8yVQn6r7RRSyIIMEs8rDeUqSu1ipISbTN0wtQIBkj31sZpOj777lE4ZX22e+8aneZ61sY5zomy6p5..mu8izoSmygJ7uVxGRM2Yc6pEM0A374+X9w8ZfWHDtE81c3v8O.aolfJJDUSmytc6RZZZCo6lW8hU.44kXLfek5n3XWkY4ZLMZ1Ym8vZsMQ52s6BHPQudKxrYyZHDAPyIwYylUkmdKqu95m6jecNZpm+BgqxcqicoNfwOLdYcei1aZZJlpIkmmGQggXs4jWTE6rEbdUcOTABKxpOmkkQqNwL30FfuuBkmnI1CLN59jllxBKtLAVEkZCdVEs7iHyJHqnDvfmThmJfvPehh7wjqHc1T1Y+83Sp0npRGPuNs4jACoSqXxxxn+h8ZHs8C+v2fxxRRmMiUVYERScUd0g6ePiMiffflFcfTYQBDFDyxqzuhojtn6q277ARf3pTIAVgoppkjmU+bh4ZZJ12gLmgEp1Y5q7Hv2Gq1vFqsN+hW90Xk0WyU62FEVsFjfVoPZEfVf1ZPUjwJK0m6r8coznIHNBcQFQAgXLNUZnMboKdYJ0BRSxb0dBBxRFQIm0BmvpIqLmrzI3ID3oDD3IYqsuK6r+dbkqbEtw0uFmbxIrTuNLPmwm623oYyM2rY28rINuxZ0oCSlMihxbj9drzJKi0ZY3vgH8bkIQs2YooypXbuE+.E99NJtJDy4h+6WAx74A+cZzfMCucUPFqfNcZyjYINAo1fenGCN4TtvFqSQtSOqoTSQktWu5ZzSJPXUXEBRyybzCcNhl4x+d.qrxJNis4EfmGc51FoJfjbCZ6T7vYeRWThwThTXQIktOTBJJxozn4N24NUQranS6XVd49r4lW.gxoFZ5TWcIJqJPHiwPVVFAgAr0VawQ6e.W7hWDgPvjISPV2XBxckHwvgmx0u9UorrngxpeXX1nm78Pf.y02np6wWMmXfISlPg1vxKuL28t2kae6aygGbLehm7SwjoiIpU6JCgkNC6xZNxJw34bDXxjIMwgDEEQTfGQAtbae26tqq4xD3gEAiFOhIoYXPgzyuB6q7JWWKAg.qw0rYxwTU+5NuspMrOd7XRxRY7TmmSmqtUflES2t+TWA9zoiqqD0zzwbX1kLaBIINJH8zO8S23Bcc.hePEJum1Plm05mSeXkDZokVhSGLg77ioc6172727+NO1i8XjkkPmNcnrP6b00XbpBa7Ronh6sNiy5Xsa2se.si6PqnHRlNgqe8qx3wSY2s2hf3Vzt2hzpaGxxKYVVFGezdMSHWT4B7UJb05fS3GEFyrzjJr05wrISXw98ZhyolCvIIIjmlbl63JEyRlRud8nSbKLFC6s2dUPlHcvyqKX3vgbkqbkFASsSNeXXG+6f.4757Z7m1UD4MeOoRhUp3styVrwEuL23F2fu6286xe1e1eF+4+4+47e4+z+Y9h+K+RTV5vtxEXHmyyDi.hiCIHHfjoJjBaEYD5UQ1.IO5i9nr+96y9GdDo4kjmLEQVEzLVKKuPaPdF4m0ZMJIthK0ymjYS4FO1ixku7kYsKrJEEEr8t6flJukDm4ngRob4buxyuYylgESEpCtXtxxx3V25VXsZBCCYx3gXLFdzG8QabC1ZcrxuN3w6SAx4GmA4w7PJKaHF2labIRRS4zSGxm4odZ1e+cYs0Vie3O3GQ5rDWKq.WwaVG4d4bnmdvAoztaGTVC9dRJyxHurKAAArzRKQotfKdoM4xOvUX3vwb2s2kCO4XLHHJNlrLmN7Zgg0ZILNltsZQmts3o9W8U4RWZShhBY2c2yU5ZSmvF3N8qqpovZlRlkLqo.gRRR3zAmvUu5UocTbSMmn0ZFMxwR9QCOkUVYEtVE47letTmukOPBDQUY9Jrm0CnNyUUAFi3b9fWXrjW0aF0ZKLXBn7PWZnSmNLb7HhhBHHzie1y+S4gd3G8L0T1yprJiwUnnilLioIyHe1ThiBPAnKSYoE6yCeiqSYgqFL78TbgKrFat4EnnPyvwSqfmeHBkDOOG.gc61k986yxKuLc5zph4ittVZ2tsqhCoqqvcFOgNshHIwoNa2c2k82cGlMaF99NRXGF43WrRpX73wLXvfJFuOkKdwKxxKuLqu95Lc5T27z2uAaq5Lg9ARf794EUqhwZETVjyrYNdKkjlSTTKBaEy3QS3niNB+v.t7kuLOwS7D7O8O8OwE1bil5PuI2yULEwAihfzYIL3jA36KvVTvt6XXoEWfUWtOW9hWBopp19xyPHczJcy1qfwrDgg2.SUuxx22mvf3llR.RAc6FQYoSaacdO50qGYYYfTv26688b1NxyINNlM2bS1byMY0UWk1saSTbH8WrK6u6gMUp6st0sXwE6wm+y+44zSNhVsZw1auMc5zgtc6R61swXLLa1rO3prNqynUkW7FaHtf4pEHFATXbPQOc5TJJzN9HklRg1o9YgEV.omqRX+pe0uL+N+NOSEqAqZVLoILYrSkv3wiIIOiSGLhgSFRXXHZcFCGNDAF9bO8mguvW3KPxTmO9Fqq.+SRRPIckJsEKsaESYcy6zX.SIV7.gDoPRYggPeI+fez+LO2y8bbwKdQd3G9gQqsM0DxUu5UYiM1vIDhiNGERCBUb3QmR+98orrj986SddNO0S8Tb6aeaZ2JpoT3Z0pE23F2f7bW1M+vTgUuGhOCVKn0PdYAiGMioSSPqstVbjuOdUDTt1ihVcZ235WMRtggJZ2tMWv2GkmKUs0mV5szxLY5HJKyY53I3IgjYSoSqXty16fmTRqpzqVqpa9xMaqs1h77blUUVBM8e3p2+SO8TBBBXucOfIylR61sonnfkWdU1X8KvS9DOdkJFWayvT5PNHMMk77bN7HWD5u5K+K3BW3Bb8qec788IIIg0VaMTRZ5aJFige3O7Gxi7HOBc5zg333OvdZ40zwzprg3hP2zzInbFmBPm4.daxzLRRx3l27V7Ru3ufvVwztca1XiMHHHf0WeUjRI8WoOdddr7Jq4TSkeVmCUHDnj93G4yoGd.p.eB77wDFR2tsoykuDQAgLc5XVc4934IwW40HHqEztV524ywsctbuXsVVbwNTTXIIIixJjhCBjn0thSMzWRVVIiGOyIPyynnvUlbEUsb1UWcU5zoCau81zpUK9ReouDO5i9vLd7XpVrgBy..PGKlDQAQ0ztM6t6tMnRe6aea9re1OK999jmm+AFfwyeBQXdaAIVSMmc1YG9m+o+bRyz7.Ov045W6FzpSO1YmcXxjIr0Vaw96uOJkfzrD5s3BM6n60qGqr7pzuee5zw4+eq3NMjPHR4JHm0VYUFOdHyHgICmPq1w3oBnrLmx7rFzbcNI3NACNUpdJ+lBCpd3HM8LxyyoUqNzIxi7bCylkCUwcbXUaUugP1bFZsRojkVZIFLX.5bWk89O7O7Ov0u90Y5zor3hKxd6dW1c2cw22EjZ+984xW9xnTJFMZTSSN38u.oFIi4kKyAYUddNKrPedzG8igmJlW60uUkwaW5Tu5UuNCGMhvHed3G8QnUTHCFdJ6t6t7hu3OmACFTkXnXmmVENTPa0x0AQEBQCa0+Feiugik6ws3fCNfkVZIN7jScFcSRQVUvNREt3hD0QDWy5kyJAh5d1dmNcnHqjo5ILZflgCOEku68XVZBVq6DUcNXLkmwh8ZVvmjjPm3V7BuvKvrYyX1rYDEEvQGcDuzK8R344wpqtJIII7XO1i0ju8333Ov4D4bmPjVWcietumTxfACP5EwFWbSRyz7puxaPZZJc6r.sWpEd99jjNkjjobvd6RPnO850gG4QdD9G+G+GwZcpLRSSY1zjJld3BHLNHrotxerG9QHLLj013BLXv.hiicDG.oqz2rNvOkBIBo.qU5ZFLJPJjHU1FWN8UN.GmMalquZUkUOiwfesd.ik7pjpMek0NOCD0lRVe804W7huDu0a8V7TO0SU8Zx3m7S9IHEVZ0xkaEsVy0u90Oif4QQeXrg7tMbAC1qWOlLYFkFKsZ0lqe8qiPEvsu8VbzQGw3oQDG6xCQRxTdgW3EnU6XVcUGGYq+7hKtDwwsQm6n64t6rOmd5or3BNUaylMiu+2+6STTDO3C9fD01c5oe+9ztc6lfrxK03aOKWI8Z2AWWdqh08FAVg.TNFTdgKrBkkPnmq730lMbo.VqIscaN5jAjWVbV6xnJh8lrS5Exd6sG+s+s+s7k+xeYjRIGczQ7S9IOGdddrwlWnAljtc6xFarQCNVeXpnpyDH160sW2tnSN9PZ0dATBEISmfxKhqe0KCZCuvnWhh7TBC8YVxLlLwkK50uvZUcVgd7M+l+Oz34SYgljjL5e3gzt0Bb3gGxgGdHQQADEGyVasEW6ZWi33X5sPe1c2cIKKiKbg0HJJ3bdZ4vXy4NcspLOOO7CTzpUK5zJ3rZAwBEkF78ccanxRCVsSc2RKsDilLlgmNfhrzFncbHJTfHyxO849Q7o9TeRlLYDBL7i9Q+PZ2Jpgo7fq+PtXUdUpSN0GlT35U6NUcKtndHrNQhuxCIVzkEX04346S6tc4Au5FHkk7Ju9M43SNjNc5vFarAeoeyeKJJJ3we7G2AatFf.77BHHPRmtdr15Wjm3weR.WBtJJyXxjIbvAG3hFd7jpc3RN8ziIIcBSmMgM1XcZUoFPmqIJNnYt4orzocaZ0N1kGhZUuVCdJWy524Lf.vkXLcQIVcAg9drxRKxnQxJBY6JtGeof2512jwiFv5q4X8x+v2++LuzK8S4I+DeRxxULYpgKe4Kyseqs3QerGtIGHYYoDGGOG5v0mXjMfYVTeY.L2P8s9e9a8sP3bALOOCPToe9rdUhwXwXAOOEFskzjY3oTr1pqhQJIMKkCN3PGcdhbcbmxBCwQsnUqt36GPPPnq9BqXEuP551b9AA344S61sXkUWkKt4lr1ZqguuWEaOJc89DkBv0S1kJPHjthDR43UUqVwzpcLAAdUs5o5FFtoJO9Vmfvb9ZKWoTTjmQZZFkkEHDfmmjxhbFb5w7i+w+Xt90uJVig+i+G+a3fCNf81cW9w+3eBSFOlG3pOfKEzc5wm9S+onUq1.zzMhpGm4nf6qqKutZB10zuGe2N5TmwvRssoKh544QokJ1kHIx2mKe4KSq1c33iOls151DG2lQiFwsu8sIJJhYSSoSmNzuee50qGsa6fVnSmNMXOYLk.tV3Tc5OEJI9gAzx2wKq82yc5YyM2jM1XcT9gjmLCimi7asa2th2VfTHvhkRsAknlxmN0PVipohnzZM5pXi7UJTshPfgQixXu81i25stIqrxJDGGyO7G9CoTawyOjG5QdDVcsMXmc1gNs6wzoS4Id7mj9KtrScn0V0W4cswiZO1jxyfPp1yt2tJqyMlyFh0k5p7h7lDs3pg7P5tPOzEZFLdDQs5R2tcILLrpESnX4kWlqbkqvRKsjqHJMNpyLYxDN8zi4l27MXxjYjmmVgWT.abgKxZquRCIEVYkUXiM1facq2D.GmgmkvwGcBRkG8WXQhaEQo1TQEoPv5JZHoB.QEGwpQlVWgoVMY2Ln0kjjLAgvRfWHkU0XxrYSX73gLZzHt10tFe6u8eMOxi7HUKfRt8VuEW5RWgqcsGjAClT03ad.DBeDBMT02WpUGUKPpcstlwJuSF8eahHq.bos24kkx2wVPcYEhsFM5BAEot549m+xuJIIIrPut70elea7T9MwdzTkSUStZCufyvZgNmwiGyabyWmacqayO6E9mIIIooqkZstFJiuuO850i3vHFOcFit0awFqeAt5UuBw99ttYsp5JoPqQpTHAWIVackqs03ZUsZcckPUhoTimTPotfrjRRKRoHKEuJ.Lihh3u+u+umu1W6qws25NjjkSVZAO3C8HHLBGkSsdbkq7.36Ew96cDc5z1whwYYtKhFqnZCgS8oZt1casyC+REHuM0VUmVBC8nvXaX09zoIHqpo75VuWVVFSKmhxSR61sYxzw3o7QqKZ77vyK.vPQgl77TPJ3IexmjO+m+yyVasE+fevyxq7JuBGdnylzQGcjqv9WYct10tFKrvBXLFN3vSAofO4S7wvSELW6zUPU5aZHE84KGs4KwfBvTRdxLJJp5z1dRJB8nHyUQUepO0mh8O7.N43Ar7pqWUpcKyK8R+B9W+0+cHYbJar9lTjaY6suEc5zgvPW6LbgE5Q+98an.qyayh2VW36cTfbVmZ149qEKBq6OhvSQxrD1euC3Mdi2fst6NNTTqNETmeg7DWGPHrUKJxR4fc2gkVZkFfDAPJUHktBkrzpIpULGc3ATTUhaO8S+T7I9DOAau8N75u9qyd6d.CNc.Gepy6qM1XC5zoCsmjv3wC4y7jOIFg61aST02sJLNEuVqkxhJaEU2DOkkNHRLZMZcAkoSIOKEs1zzNPLlRJ04M8KxC1+HVd4UYVVJggw7b+3eJOyy704ZOvUQZ8nrzvoCGwfgi4zAiPHrMtfegKrNarwFr7x8QpTTZJbTfp5zw8JVdGOgzzTsERDd9HPxd6tO+vezywMu4MwOLjkWbY29wJIeMQiqaYQAAtjTcvAtbdW6Sds2E0T24vwCwOLnpIFKZpm7MqB3Bq6z1wCFxctyc3N2dK52uOW8pWkKs4FtVSqwgHsR4h4PWXb2wTVMk4EnMknyKZ55n0BDSYgyndEq1yyyQW0Ry62uOO3CdMN4jQzpkqEytxJqvu3UdU9BeguHkkkLXzX7r9L3zgHUBZ0pMYYYLYxHRSmwfAC30dsWim7I+j73O9iSqVQXMBjdmo1h6IVEuFTDpL7DF0hgCGR61sQWcz+W7puFu9q+57pu9a5HrVPH6r+dtbDnyIMwkkrrzYMGGmLNghhrp6+C+FhNWyvCozw+qtK1spbkg7x5FLVaRlkxd6rKqr5RzoaKVZ0Ub4UoBBlISlvc2aWW+zR.o4Nt15IcNiTlWRdQJJgjxRMkE0nMeFsQMkETjOgxb27b5zo3GD1PwzwiG6XPRTDK2tC28t2kUWcUBCCorzvt6rOK1wgzPfz0YScYRsfgCGzv1EiQy1auMOyy7ulkVZImp8YiqvYK+dDHUi5NtfKJXEHUTlUvAGcHu9adKxJzb7om.373Ys0VioIyPhAquoIuzc5zg0WeU1XiMnWudUDhvgFqxy0bKERnpWESVQtKnzBCBkBWu+UvAGbDK7lKzz1KhB7fHuJ7gbUBUbbHGd3gzqWWZWwfjrLWtXDFKVifbsydQYkPnHqj7BWJnKyy.aA6b265XWuTvImbBKrjqnfRRRHLrMRoj25MuIO9m3iym4odZFNdDYYELZvP1+vCIz2mQiFQPnKu7iGOlzzTlNcJgggbm6rERojm8YeN97e9OWCqTdmnHjm1TzbilMevRfjgCGyq8puAiFMgkVZI50aQN3fCPafoyRIY1Dh23B7.WbSdrG6wXyM2rBgSSytP+JNLg0fsTSgsheVVWVHa2tMEkkTpsDD5iP3tHur5RJJyoU6XT40skUIXJIqHmwISYxDA+fezyxMtwM3FW65UE1oS0ioTi1TRQZBViKh7xxBJyKHuHkzzYnKywTjiP4wfQCavv5EewWjs2dGZ2oC999r+AGvW3K7E327q7koamdn05JVojxfAinrrjewK+pLdxPFNbH6s2NNdbEFPRxTRyyIsHmW5U9ErzpKwi8XOFAQsvT7d31as.Qn7IKqf6r0Vb281mEWpOs6zkqc8GjCO5Xj9dLZ5Dt9UuB+d+a92vhcZS61sArUQ65hvuUqny6qc8E+hPzbAvLa7H7BiPIDNnLrEXQfv5zwOc7HJzUWaoJmCAAgtlko1Z4u6u6ui82eelM1soQIpbuVpZfg2XEXqRHUYoqgL6xidJiGMfxxB1512lSGNjVsZyd6sGyRx3IexOMCGdJWX80425252hMuvFr2d6S6tcINLjEVXAVYkUPHDr7x84niNpp7GxX+8ODgvx3wi45W+5zsaWlNcJO+y+7r5pqxlatIkVyaq2X6cuAu.NCuSlLg6bmsQfjvfHLFXokVhKe4KytGrOBgj+a9u9eK862iVAADTwzvFuTJyIKq5RpTT+21Tk2BKR4Yc35POEHETZzNOcTdHrFlMYjq2mnqZBY9dtp40XvXbW+pylMi6tydHEN0YRb3u4JygR7UJz5RJSmRZ1LRlNkISGwzoiIKKgSN8HWWaHIkrhbJxcsb1KdwKyN6rCO7C+v769696hP.6u2NrP2EcLdT40zMU0ZMW4JWhUWcYtzk1j3VA7s++4uhhxBhaEw5WXsl5J43iOke5O8mwRKshi6xp64RAa9j5HjRLBGtbEkkLX7H5ztKylMitKDP2E5yS8YeZ969NeGTddbkqbEDkIXMFlNcZUIBXaLbq7pC7wgCScmxQHb89Jg0humDqwPQd8kIrBDZJxxX1jwr+t6fthn21J1DZET00Hrzt6hbxImPdpKih1pbhOY7PlMYJEYITVVfIOi7hYTjkQZ1LxxRZnfZTbPC7KYotTUu5pqyS7DOAesu1WiKbgKvrYoM8xwE6sfqLFjt5LY+i1m7hVjWjwBK1iKdwKRbqHr1Pt5UuZSKexZc8mkW60dM9xe4ur6tx5d.D1yUVY.UWOCtqeLZJ5EGmrbQX6EDPTzR73O9GmCObet0ctMWa8UPJsD3qvSIZNgoKyaR7TiFKQc5QcfrYsRB7bfWJvfene0cZHrxJKym5S+jrwlW.gz4lrzupPbB7c8UKgj+2928umACGCHoUTLgdN1ENcri2sylLBiQisHGsICLllBGRHDD2tEsZ0hiN5HFMdJQQsna2t7nO5ix23a7MnSmNbqacKt5Ud.LkQbPEQ.UUsXXWy62QIVeeGy2MlRZ2NtoimNeot4pz3vl5pwjWbuBjp9ZUUjsNjQgvf.5D2hrhRVXgttLeIkbxIC3oe5OGu3K9hr616vUVou6BMRLeeFrNIOmUksUhjp+0o4zhsgvcRoDOohoYy.fKbgKvW9e4WxoZatq1BScM8YMXLV9Q+neDac28Xu6tCSFbLBqCOJckAyxxhpMGYXJyqx5nAAUbMtHm5d8d8hzu8u8ucS5jSSSY80WmiO9XhhhXgEVnoeyOd5Dr4INVvmk3vBKKmACFwFqsAKu1pjMy0Y5h7cmBmLbDadwKfsr.ztboL+Ph0EnltrDaYABLDEnvTlxMdvGfPemOplRMdBO51pKCOYLO7C9wnLSvomN1AsRP74v3WoDTpywh9LFhXcthV2KTxxJbrNLPgzSPVQJddR77jjlLEeOIBLnvhNOCzkDHE3gEYQARSI+K9LeZld5QjL5DFc79jmLhYiOggCNfSOYOxyFSZpq7A7B8IqrfRK34Gh03JSt1wcHOsfIilxW6e0+U7m7+3+SMkJsR4t218CCP54lmJeIo4IzoSK2uaRNXDDGDyIGMfSN7XhCaiG93qBoUXLXrXK0zocLe7G+wn+h8HKcF26npiyCJDUjGv.VMwwQr5pKyN6rCoSmgWPL5hRTBeZE1hxbMsa2giN7DLkorxJqP61cvnKbXTgoo+hTVV.3.nzkeBWq1nUKGNWuyip9RkoDOjDF3UEOgqKV2qaa1dm6x24u4ugc15sbtqKsb7Q6immG8p7porr.oRPVti7y0r.IsnzoZ1JYqs1hKcoKwW4q7U3O5O5OpAEg5hAstD0pKit46Rcfjk52mzjbdiW+MXqs1FgUxR8WooiG4IULMIkNsi4JW4Jr9pqgVWT0POO+nwDuPnPI8a1k644Q+98Ys0VqpjArMvFG342jD+jrLFNNgAilvzjTLVW2r1JjTps3GDfxyGkzugrxVqqnOe+TBdmuQTdVyeQoT7bO2ywsu8sQJkbxImvfACZfu+fCNno7.pCBqlIg0jPn1F4Eu3E4q7U9J76+6+6yi8XOFBg6tGIMMsATzZATsPo1lPTTD6s2d7xu7KyN6rSEgJzXrkn7DMu2oot7B8fO3CxBKrPS+f7c9DBm0Rs0VCk4ZTdfuxmKcoMYVRFimlhT5R+YQYFM0XtW.FohACGynIiYwE6w5qsJRIjLcLddtDBI4rROql4gueXjQcI.TaiJHHnoTA9te2uK6s2dLd1zlZRbokVhqbkqvO6m8yX1rYMczmZdScVEZ4tZU+DerGmKcoM4K9E+h73O9iyN6ryYHLTUEv0bEtNzf5h9ToTb7wGyq9puJGr+QM75c73wjmm1T.oSlLif.eVas0nWuNMq20nibOBDWceTVgK+7MbXPyRKsDatYFuxq+FM3TkllR6VwjmmgRIonz0IEzlRzVAQQsnSmXT9gTnKoTWBZCdFsKG8RmsAqU2zY2d2F0mNpUUTufV2qba2tMepOyS0zVK9C+C+CQq07m7m7mvm6y843y9Y+r7RuzKwsu8sY73wTV5f8wkmEEJKn0EMjqNIIAOOuFXORSSaNYV2OW.XznQLb3PdoW5WfR5xWSMAqqEVkk4Mv9uwFav0u90aVeqqP324SHy8P2vNPjXstcIqrbe5u+BjWpwnKbTvLLfYyJQ5oPa03EDPnJh7xRt0s2hdKzhU52mtcb3NYpf9tnBpl5bU7dMp6Xz04ntl0IsZ0hu3+hu.29s1hd85wUtxU3i8w9X7k9hed9K9K+qv22mu427axC8POD23F2fc1YmFjHb02wH1em6x3wCoUqVboKcolFYVsp444ra8NZgPv3wi41291t96XRIsa6M2yingiVNRoWPbbDW7RavJqrBYY0cEI2Ickx+bOuNFGTkMu5IwYci.KY4oDGGxUu5UHJNj77TWg0Tj4bqU44tHvT9n7C.gjz7BN8jwb3gmvnQSvXf.+nlljrbNho8dMt2hyu1lfPH3K8k9RbkqbE9m99eOFdxwnyy3a8m9s3+y+8+ev27+9+63S+I+DzNJjG3RWjE5zFSQNgdJlNZHae62phhos3odpmhM1XiFN8VKHt2TrV2U5t0stE6ryNLd7X50qG444UEBpjnnPLFMIIypJaOEW4AtTks3yt8Hd23rk5a8m9m9spSLSZZJY4YNIkTg13tZrChBn+h84nCOhgCFRTbLEE4HUdTXLfvE+RdQIAUoa02ymwSlvwGb.d99DE5tbUDFv2+rcTBwubK60pIqMHOeKvnWud7YdZGwle1m8Y467c9NUkBwWku427a5pADfEVXA1c2cYmc1wU0SiFQQQAepO0mhG6QeD9M9M9MZLPWmWmZUk0sfIOOullIvctycpnX6BLal65QxcKTSSyyz0wIzrxJKyS7DOAKt3hUBsp.BM0m9rmi0IBq1ZQ.4YYLd7X.WiaQq0taz.i.gmOdJelNMgae6sXqs2AkxikVYMLddjlUPm1tawfx7T78UzuWO52eA928+5+KrwFqyu6+s+aYVxHJSyIHzEYqthEG2OCgz6rjKU4QTcULUquWoTbxImvK7Bu.u4a9lzpUK9ze5OMe7O9GGi9LVKVW8rfiuX08pqiO9XJJJ3Ye1mEoTxBKrPimSdpnlKAlvvPRylQYYIc5zgiO9P9898989kN+q6vD0NM7NJPjRIkFmpKO+vJCU9DDEyfAi3MdiaxIGO.YP.pfX5uxxNe1qpc60VYYVckkX+c1gs2ZKdtm6GvUuxk42424YXzvSQIAeeU0Cv82sTiT42ji7Z0a2aNqOiw7m2wEW5AjmKv0ZUoy6V7gGdHe2u62kzzTdpm5obXmkmSVVAyllxEu3EY5zoLb3PL1RBBbkx1y7LOy6I62uWAxb5KpoRZ8vAwPQdZysRPdZBcZEwi7HODadw0X53Ar5JKxrIinUT.YIyHOMg3vHRSy3hWbS52uOFigexO4mvMu4Moc61DWkLoQiFceIL.vV0r.78bAOViolTXAqtIZecYNVSoayP0qMLvqQWdsGb0B1Zgw3wi44dtmic1YGVas0Zx1Y2tcQHDrvBKvcu6NbzQG0vGqYylwW8q9UoSmVMqim8wu7w6YnY1JDYc5wSArr1JNe8u3k1fW3m+73ofjIiX4k5yR8Wjx7LVoeHCGLjUVYI9XerOFdd97s+1eaFOdZ0NPMwww2WBC37oM3darM.MLho9hgIOOuoDCp8pr9DS8G0kHQQQAuvK7B7BuvKvEtvEXs0VyUxcBQycxds5tVsZQoNm23MdC95e8uNKub+OT0o96o.ILz2kz9jozsSmJihCIzWwm7i+I3I9XOLaema6xLWYAcaES+E6w1acDchawjgivWonWmtbmaeat4MuoKia44ztamOvS36cLerI0dIVqZpNB6ZXOp6HC0D6CnwE7ZuelGZjc1YGdy27MYyM2jUVYkl3GBBBX3vgtKRlzTVd4k4Ue0Wk81aO9i+i+iaB9U44xETyGusk929x+6o.ot8oVWXL44oM.H1JJfqdkKyCbwKvct8aRQdJ8ZECZCOvkVog8Fat4lbsqcMVc0U4ke4WlvvXhhh3zSFdeKPp0+eujVtd2eM7+043d5zoMsP7Z81vYtSW+8lMaFu0a8VDFFxFarAIIIM+clMaFc61k6d26RQQA+0+0+0r7xKyeveve.ylMgKdwMvhtwKuylTu2prdOqY277b50qGJkhISlgVaoUbLBTLYzH1X80Ztsm+O82+2w+z266yy7LOCW5hW4+2l6JHmDFJH5yJDAhESbQWX7.vFA2vRidK3DnwqfwKDmARTXKapm.BqHgDBwTBsAak9cw++Fm1XBnKLL6ZXS+c9y6O+Gy7FmtHlgzMefkKWB.HC3QV5o+.6A+JSqLD56qPSqUIbmK4npLbG.JDck3jnIl0VylMw74yE8QwXLHL7MzqWOzt8UH27IN8TeqJbe9Ytw4Ww16XWlJKqLWVV4trrxDRzH2SGebUW1HGIKlrrLQzXVEsFu7xqXvfA382YHscNOsZUDt8tavyO+jzbO999REC9WMcCfxm0NIRetVF+.f3.otKtd8ZgcZVUHCGND862GAAAtZF.HIIAwwwXxjInc6qwC2+H788s7e4YvlMI3jSrey7JuYyngonFxrsTZutsFoooHNNFoooEVf6poSz23tRE6tlnnHLa1LrXwBLc5TDDDXKrsKuPDnXRCxOQv1gjMZzHLd7XDFFJsrVmNcP2tcQqVsPw.xxPReKIf1yyrzjnkGPpXDDZUbHrsxzYFruc.jV7VHrwGN42nQiFxgq7kSSX3gtUsZUYBxUudcYjfSEzaen+gILnihA9dJZWqVMQqUNJOO2vc4TObI959naf5hjPi+xBcvprZE0sW5f7779SoF9eZLyM.HbnoWG6xgnQPznNRyo5ly772pP7VF9T9vs84EV684sl2tcqbHJaEABOQ5yYX6grYLFY95V9eM72pzOZDGlAHunIsufibh3HX0MqR.....jTQNQjqBAlf" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "np_nifalcon is a Max/Pd external for controlling the NovInt Falcon haptic device using libnifalcon and the test firmware that comes with the Falcon. It allows control of all motors and LEDs, as well as getting input from the motor encoders and default grip that comes with the falcon. On Windows, np_nifalcon should work correctly with the stock novint drivers.",
					"linecount" : 10,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 477.0, 125.0, 178.0, 121.0 ],
					"id" : "obj-79"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 170.0, 292.0, 44.0, 18.0 ],
					"id" : "obj-99",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 170.0, 266.0, 20.0, 20.0 ],
					"id" : "obj-98",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "raw",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 225.0, 317.0, 30.0, 17.0 ],
					"id" : "obj-40",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "vector",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 171.0, 318.0, 47.0, 17.0 ],
					"id" : "obj-41",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "stop",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 223.0, 204.0, 33.0, 17.0 ],
					"id" : "obj-42",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "start",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 174.0, 204.0, 39.0, 17.0 ],
					"id" : "obj-43",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open 0",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 176.0, 48.0, 42.0, 17.0 ],
					"id" : "obj-63",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "initialize",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 165.0, 163.0, 51.0, 17.0 ],
					"id" : "obj-64",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "count",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 178.0, 129.0, 39.0, 17.0 ],
					"id" : "obj-65",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "close",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 176.0, 90.0, 38.0, 17.0 ],
					"id" : "obj-66",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"fontsize" : 11.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontname" : "Arial",
					"patching_rect" : [ 211.0, 26.0, 35.0, 17.0 ],
					"id" : "obj-67",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "np_nifalcon",
					"fontsize" : 11.0,
					"numinlets" : 5,
					"numoutlets" : 6,
					"fontname" : "Arial",
					"patching_rect" : [ 211.0, 455.0, 359.0, 19.0 ],
					"id" : "obj-68",
					"outlettype" : [ "symbol", "list", "list", "list", "list", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "First outlet bangs on successful connect or ouput",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 131.0, 476.0, 110.0, 41.0 ],
					"id" : "obj-77"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Notes:\n- If are you using the falcon on windows, make sure you are directly connected to the computer. On OS X, use it only through a powered USB hub.\n- Try to keep the falcon running at as close to 1khz as possible update rate. This means metro 1 for manual_poll, or just using auto_poll. If processing falls much below that speed, undefined behavior may occur.",
					"linecount" : 9,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"patching_rect" : [ 5.0, 357.0, 216.0, 100.0 ],
					"id" : "obj-38"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 234.5, 187.0, 220.5, 187.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 5 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 3 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 2 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 1 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 2 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 1 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 2 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 1 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 2 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 3 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-68", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-26", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-26", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-68", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-25", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-25", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-68", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-24", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-24", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-68", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 236.5, 297.0, 220.5, 297.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.5, 313.0, 220.5, 313.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 158.5, 313.0, 220.5, 313.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-99", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 185.5, 79.0, 220.5, 79.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 185.5, 111.0, 220.5, 111.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 187.5, 150.0, 220.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 232.5, 234.0, 220.5, 234.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 183.5, 234.0, 220.5, 234.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 180.5, 340.0, 220.5, 340.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 234.5, 340.0, 220.5, 340.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 174.5, 184.0, 220.5, 184.0 ]
				}

			}
 ]
	}

}
