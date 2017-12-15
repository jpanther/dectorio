-- entity/walls

if DECT.ENABLED["walls"] then

	-- Make a copy of the base stone wall before clearing it out
	local base_stone_wall = data.raw["wall"]["stone-wall"]
	data.raw["wall"]["stone-wall"] = nil

	data:extend({
		{
			type = "wall",
			name = "stone-wall",
			icon = "__base__/graphics/icons/stone-wall.png",
			icon_size = 32,
	 		flags = {"placeable-neutral", "player-creation"},
			collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			minable = {mining_time = 0.5, result = "stone-wall"},
			fast_replaceable_group = "wall",
			max_health = 250,
			repair_speed_modifier = 2,
			corpse = "wall-remnants",
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
			vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
			connected_gate_visualization = {
				filename = "__core__/graphics/arrows/underground-lines.png",
				priority = "high",
				width = 64,
				height = 64,
				scale = 0.5
			},
			resistances = {
				{
					type = "physical",
					decrease = 2,
					percent = 10
				},
				{
					type = "impact",
					decrease = 30,
					percent = 30
				},
				{
					type = "explosion",
					decrease = 8,
					percent = 15
				},
				{
					type = "acid",
					percent = 10
				},
				{
					type = "fire",
					percent = 100
				},
				{
					type = "laser",
					percent = 40
				}
			},
			pictures = {
				single = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-single.png",
							priority = "extra-high",
							width = 22,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-single-shadow.png",
							priority = "extra-high",
							width = 47,
							height = 32,
							shift = {0.359375, 0.5},
							draw_as_shadow = true
						}
					}
				},
				straight_vertical = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-1.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.625},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-2.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.625},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-3.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.625},
								draw_as_shadow = true
							}
						}
					}
				},
				straight_horizontal = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-1.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-2.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-3.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					}
				},
				corner_right_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-corner-right-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-corner-right-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 61,
							shift = {0.484375, 0.640625},
							draw_as_shadow = true
						}
					}
				},
				corner_left_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-corner-left-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-corner-left-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 60,
							shift = {0.328125, 0.640625},
							draw_as_shadow = true
						}
					}
				},
				t_up = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-t-down.png",
							priority = "extra-high",
							width = 32,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-t-down-shadow.png",
							priority = "extra-high",
							width = 71,
							height = 61,
							shift = {0.546875, 0.640625},
							draw_as_shadow = true
						}
					}
				},
				ending_right = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-ending-right.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-ending-right-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.484375, 0.5},
							draw_as_shadow = true
						}
					}
				},
				ending_left = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-ending-left.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-ending-left-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.328125, 0.5},
							draw_as_shadow = true
						}
					}
				},
				water_connection_patch = {
					sheets = {
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-patch.png",
							priority = "extra-high",
							width = 52,
							height = 68,
							shift = util.by_pixel(0, -2),
						},
						{
							filename = "__Dectorio__/graphics/entity/stone-brick-wall/wall-patch-shadow.png",
							priority = "extra-high",
							draw_as_shadow = true,
							width = 74,
							height = 96,
							shift = util.by_pixel(6, 13),
						}
					}
				}
			},
			wall_diode_green = base_stone_wall.wall_diode_green,
			wall_diode_green_light = base_stone_wall.wall_diode_green_light,
			wall_diode_red = base_stone_wall.wall_diode_red,
			wall_diode_red_light = base_stone_wall.wall_diode_red_light,
			circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
			circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance,
			default_output_signal = {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
		},
		{
			type = "wall",
			name = "dect-concrete-wall",
			icon = "__Dectorio__/graphics/icons/concrete-wall.png",
			icon_size = 32,
			flags = {"placeable-neutral", "player-creation"},
			collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			minable = {mining_time = 0.5, result = "dect-concrete-wall"},
			fast_replaceable_group = "wall",
			max_health = 500,
			repair_speed_modifier = 2,
			corpse = "wall-remnants",
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
			vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
			connected_gate_visualization = {
				filename = "__core__/graphics/arrows/underground-lines.png",
				priority = "high",
				width = 64,
				height = 64,
				scale = 0.5
			},
			resistances = {
				{
					type = "physical",
					decrease = 3,
					percent = 40
				},
				{
					type = "impact",
					decrease = 45,
					percent = 70
				},
				{
					type = "explosion",
					decrease = 10,
					percent = 40
				},
				{
					type = "fire",
					percent = 100
				},
				{
					type = "acid",
					decrease = 5,
					percent = 60
				},
				{
					type = "laser",
					percent = 75
				}
			},
			pictures = base_stone_wall.pictures,
			wall_diode_green = base_stone_wall.wall_diode_green,
			wall_diode_green_light = base_stone_wall.wall_diode_green_light,
			wall_diode_red = base_stone_wall.wall_diode_red,
			wall_diode_red_light = base_stone_wall.wall_diode_red_light,
			circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
			circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance,
			default_output_signal = {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
		},
		{
			type = "wall",
			name = "dect-chain-wall",
			icon = "__Dectorio__/graphics/icons/chain-wall.png",
			icon_size = 32,
			flags = {"placeable-neutral", "player-creation"},
			collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			minable = {mining_time = 0.5, result = "dect-chain-wall"},
			fast_replaceable_group = "wall",
			max_health = 300,
			repair_speed_modifier = 2,
			corpse = "wall-remnants",
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
			vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
			connected_gate_visualization = {
				filename = "__core__/graphics/arrows/underground-lines.png",
				priority = "high",
				width = 64,
				height = 64,
				scale = 0.5
			},
			resistances = {
				{
					type = "physical",
					decrease = 10,
					percent = 20
				},
				{
					type = "impact",
					decrease = 35,
					percent = 40
				},
				{
					type = "explosion",
					decrease = 5,
					percent = 10
				},
				{
					type = "fire",
					percent = 5
				},
				{
					type = "laser",
					percent = 5
				}
			},
			pictures = {
				single = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-single.png",
							priority = "extra-high",
							width = 22,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-single-shadow.png",
							priority = "extra-high",
							width = 47,
							height = 32,
							shift = {0.359375, 0.5},
							draw_as_shadow = true
						}
					}
				},
				straight_vertical = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-1.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 1.16},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-2.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 1.16},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-3.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 1.16},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-4.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 1.16},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-5.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 1.16},
								draw_as_shadow = true
							}
						}
					}
				},
				straight_horizontal = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-1.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-2.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-3.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-4.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-5.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/chain-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					}
				},
				corner_right_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-corner-right-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-corner-right-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 61,
							shift = {0.535, 1.17},
							draw_as_shadow = true
						}
					}
				},
				corner_left_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-corner-left-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-corner-left-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 60,
							shift = {0.26, 1.05},
							draw_as_shadow = true
						}
					}
				},
				t_up = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-t-down.png",
							priority = "extra-high",
							width = 32,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-t-down-shadow.png",
							priority = "extra-high",
							width = 71,
							height = 61,
							shift = {0.5, 1},
							draw_as_shadow = true
						}
					}
				},
				ending_right = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-ending-right.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-ending-right-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.484375, 0.5},
							draw_as_shadow = true
						}
					}
				},
				ending_left = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-ending-left.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/chain-wall/wall-ending-left-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.328125, 0.5},
							draw_as_shadow = true
						}
					}
				}
			},
			wall_diode_green = base_stone_wall.wall_diode_green,
			wall_diode_green_light = base_stone_wall.wall_diode_green_light,
			wall_diode_red = base_stone_wall.wall_diode_red,
			wall_diode_red_light = base_stone_wall.wall_diode_red_light,
			circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
			circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance,
			default_output_signal = {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
		},
		{
			type = "wall",
			name = "dect-wood-wall",
			icon = "__Dectorio__/graphics/icons/wood-wall.png",
			icon_size = 32,
			flags = {"placeable-neutral", "player-creation"},
			collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			minable = {mining_time = 0.5, result = "dect-wood-wall"},
			fast_replaceable_group = "wall",
			max_health = 150,
			repair_speed_modifier = 2,
			corpse = "wall-remnants",
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__Dectorio__/sound/deconstruct-wood.ogg" },
			vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
			connected_gate_visualization = {
				filename = "__core__/graphics/arrows/underground-lines.png",
				priority = "high",
				width = 64,
				height = 64,
				scale = 0.5
			},
			resistances = {
				{
					type = "physical",
					decrease = 10,
					percent = 10
				},
				{
					type = "impact",
					decrease = 10,
					percent = 10
				},
				{
					type = "explosion",
					decrease = 5,
					percent = 5
				},
				{
					type = "fire",
					percent = 0
				},
				{
					type = "laser",
					percent = 0
				}
			},
			pictures = {
				single = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-single.png",
							priority = "extra-high",
							width = 22,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-single-shadow.png",
							priority = "extra-high",
							width = 47,
							height = 32,
							shift = {0.345, 0.5},
							draw_as_shadow = true
						}
					}
				},
				straight_vertical = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-1.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.78},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-2.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.78},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-3.png",
								priority = "extra-high",
								width = 22,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-vertical-shadow.png",
								priority = "extra-high",
								width = 47,
								height = 60,
								shift = {0.390625, 0.78},
								draw_as_shadow = true
							}
						}
					}
				},
				straight_horizontal = {
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-1.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-2.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-3.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					},
					{
						layers = {
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-4.png",
								priority = "extra-high",
								width = 32,
								height = 42,
								shift = {0, -0.15625}
							},
							{
								filename = "__Dectorio__/graphics/entity/wood-wall/wall-straight-horizontal-shadow.png",
								priority = "extra-high",
								width = 59,
								height = 32,
								shift = {0.421875, 0.5},
								draw_as_shadow = true
							}
						}
					}
				},
				corner_right_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-corner-right-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-corner-right-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 61,
							shift = {0.56, 0.87},
							draw_as_shadow = true
						}
					}
				},
				corner_left_down = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-corner-left-down.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-corner-left-down-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 60,
							shift = {0.328125, 0.640625},
							draw_as_shadow = true
						}
					}
				},
				t_up = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-t-down.png",
							priority = "extra-high",
							width = 32,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-t-down-shadow.png",
							priority = "extra-high",
							width = 71,
							height = 61,
							shift = {0.546875, 0.77},
							draw_as_shadow = true
						}
					}
				},
				ending_right = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-ending-right.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-ending-right-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.484375, 0.5},
							draw_as_shadow = true
						}
					}
				},
				ending_left = {
					layers = {
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-ending-left.png",
							priority = "extra-high",
							width = 27,
							height = 42,
							shift = {-0.078125, -0.15625}
						},
						{
							filename = "__Dectorio__/graphics/entity/wood-wall/wall-ending-left-shadow.png",
							priority = "extra-high",
							width = 53,
							height = 32,
							shift = {0.328125, 0.5},
							draw_as_shadow = true
						}
					}
				}
			},
			wall_diode_green = base_stone_wall.wall_diode_green,
			wall_diode_green_light = base_stone_wall.wall_diode_green_light,
			wall_diode_red = base_stone_wall.wall_diode_red,
			wall_diode_red_light = base_stone_wall.wall_diode_red_light,
			circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
			circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance,
			default_output_signal = {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
		}


	})

	-- Adjust base gate health and resistances to match concrete wall
	local base_gate = data.raw["gate"]["gate"]
	local dect_concrete_wall = data.raw["wall"]["dect-concrete-wall"]
	base_gate.max_health = dect_concrete_wall.max_health
	base_gate.resistances = dect_concrete_wall.resistances

	-- Add Hazard gate variant
	local dect_hazard_gate = table.deepcopy(data.raw["gate"]["gate"])
	dect_hazard_gate.name = "dect-hazard-gate"
	dect_hazard_gate.minable.result = "dect-hazard-gate"
	dect_hazard_gate.vertical_animation.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-vertical.png"
	dect_hazard_gate.horizontal_animation.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-horizontal.png"
	dect_hazard_gate.vertical_rail_animation_left.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-rail-vertical-left.png"
	dect_hazard_gate.vertical_rail_animation_right.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-rail-vertical-right.png"
	dect_hazard_gate.horizontal_rail_animation_left.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-rail-horizontal-left.png"
	dect_hazard_gate.horizontal_rail_animation_right.layers[1].filename = "__Dectorio__/graphics/entity/hazard-gate/gate-rail-horizontal-right.png"
	data:extend({dect_hazard_gate})

end
