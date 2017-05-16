--tiles.lua

-- Modify decorations on base tiles
data.raw["tile"]["stone-path"].decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"]
data.raw["tile"]["concrete"].decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"]

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "tile",
			name = "dect-wood-floor",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-wood-floor"},
			mined_sound = { filename = "__Dectorio__/sound/deconstruct-wood.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.2,
			layer = 62,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/wood/wood1.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/wood/wood2.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/wood/wood4.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/wood/wood-inner-corner.png",
					count = 8
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/wood/wood-outer-corner.png",
					count = 1
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/wood/wood-side.png",
					count = 8
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/wood/wood-u.png",
					count = 8
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/wood/wood-o.png",
					count = 1
				}
			},
			walking_sound = {
				{
					filename = "__Dectorio__/sound/walking/wood-01.ogg",
					volume = 1.1
				},
				{
					filename = "__Dectorio__/sound/walking/wood-02.ogg",
					volume = 1.1
				},
				{
					filename = "__Dectorio__/sound/walking/wood-03.ogg",
					volume = 1.1
				},
				{
					filename = "__Dectorio__/sound/walking/wood-04.ogg",
					volume = 1.1
				}
			},
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		}
	})

end

if DECT.ENABLED["painted-concrete"] then

	data:extend({
		{
			type = "tile",
			name = "dect-paint-hazard-left",
			needs_correction = false,
			next_direction = "dect-paint-hazard-right",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-hazard"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard1-left.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard2-left.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard4-left.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-inner-corner-left.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-outer-corner-left.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-side-left.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-u-left.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-o-left.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-hazard-right",
			needs_correction = false,
			next_direction = "dect-paint-hazard-left",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-hazard"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard1-right.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard2-right.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/hazard/hazard4-right.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-inner-corner-right.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-outer-corner-right.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-side-right.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-u-right.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/hazard/hazard-o-right.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-emergency-left",
			needs_correction = false,
			next_direction = "dect-paint-emergency-right",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-emergency"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency1-left.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency2-left.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency4-left.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-inner-corner-left.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-outer-corner-left.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-side-left.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-u-left.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-o-left.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-emergency-right",
			needs_correction = false,
			next_direction = "dect-paint-emergency-left",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-emergency"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency1-right.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency2-right.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/emergency/emergency4-right.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-inner-corner-right.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-outer-corner-right.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-side-right.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-u-right.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/emergency/emergency-o-right.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-safety-left",
			needs_correction = false,
			next_direction = "dect-paint-safety-right",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-safety"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety1-left.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety2-left.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety4-left.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-inner-corner-left.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-outer-corner-left.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-side-left.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-u-left.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-o-left.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-safety-right",
			needs_correction = false,
			next_direction = "dect-paint-safety-left",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-safety"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety1-right.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety2-right.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/safety/safety4-right.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-inner-corner-right.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-outer-corner-right.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-side-right.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-u-right.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/safety/safety-o-right.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-radiation-left",
			needs_correction = false,
			next_direction = "dect-paint-radiation-right",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-radiation"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation1-left.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation2-left.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation4-left.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-inner-corner-left.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-outer-corner-left.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-side-left.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-u-left.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-o-left.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-paint-radiation-right",
			needs_correction = false,
			next_direction = "dect-paint-radiation-left",
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-radiation"},
			mined_sound = data.raw["tile"]["concrete"].mined_sound,
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.4,
			layer = 61,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants =
			{
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation1-right.png",
						count = 16,
						size = 1
					},
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation2-right.png",
						count = 4,
						size = 2,
						probability = 0.39,
					},
					{
						picture = "__Dectorio__/graphics/terrain/radiation/radiation4-right.png",
						count = 4,
						size = 4,
						probability = 1,
					},
				},
				inner_corner = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-inner-corner-right.png",
					count = 32
				},
				outer_corner = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-outer-corner-right.png",
					count = 16
				},
				side = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-side-right.png",
					count = 16
				},
				u_transition = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-u-right.png",
					count = 16
				},
				o_transition = {
					picture = "__Dectorio__/graphics/terrain/radiation/radiation-o-right.png",
					count = 1
				}
			},
			walking_sound = data.raw["tile"]["concrete"].walking_sound,
			map_color={r=0.5, g=0.5, b=0},
			ageing=0,
			vehicle_friction_modifier = concrete_vehicle_speed_modifier
		}
	})

	if DECT.CONFIG["disable_hazard_concrete"] then

		-- Migrate any base hazard tiles to painted concrete and remove remaining items
		local base_tile_hazard_left = data.raw["tile"]["hazard-concrete-left"]
		local dect_tile_hazard_left = data.raw["tile"]["dect-paint-hazard-left"]
		local base_tile_hazard_right = data.raw["tile"]["hazard-concrete-right"]
		local dect_tile_hazard_right = data.raw["tile"]["dect-paint-hazard-right"]
		
		base_tile_hazard_left.next_direction = dect_tile_hazard_left.next_direction
		base_tile_hazard_left.minable.result = dect_tile_hazard_left.minable.result
		base_tile_hazard_left.variants = dect_tile_hazard_left.variants
		base_tile_hazard_right.next_direction = dect_tile_hazard_right.next_direction
		base_tile_hazard_right.minable.result = dect_tile_hazard_right.minable.result
		base_tile_hazard_right.variants = dect_tile_hazard_right.variants

		data.raw["recipe"]["hazard-concrete"] = nil
		data.raw["item"]["hazard-concrete"] = nil

	end

end