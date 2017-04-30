--tiles.lua

data:extend(
{
	{
		type = "tile",
		name = "wood-floor",
		needs_correction = false,
		minable = {hardness = 0.2, mining_time = 0.5, result = "wood-floor"},
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 1.2,
		layer = 61,
		decorative_removal_probability = 0.25,
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
				count = 8
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
				filename = "__base__/sound/walking/concrete-01.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 1.2
			}
		},
		map_color={r=0.5, g=0.5, b=0},
		ageing=0,
		vehicle_friction_modifier = dirt_vehicle_speed_modifier
	},
	{
		type = "tile",
		name = "paint-hazard-left",
		needs_correction = false,
		transition_merges_with_tile = "concrete",
		minable = {hardness = 0.2, mining_time = 0.5, result = "paint-hazard"},
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 1.4,
		layer = 61,
		decorative_removal_probability = 0.25,
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
		walking_sound = {
			{
				filename = "__base__/sound/walking/concrete-01.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 1.2
			}
		},
		map_color={r=0.5, g=0.5, b=0},
		ageing=0,
		vehicle_friction_modifier = concrete_vehicle_speed_modifier
	},
	{
		type = "tile",
		name = "paint-emergency-left",
		needs_correction = false,
		transition_merges_with_tile = "concrete",
		minable = {hardness = 0.2, mining_time = 0.5, result = "paint-emergency"},
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 1.4,
		layer = 61,
		decorative_removal_probability = 0.25,
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
		walking_sound = {
			{
				filename = "__base__/sound/walking/concrete-01.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 1.2
			}
		},
		map_color={r=0.5, g=0.5, b=0},
		ageing=0,
		vehicle_friction_modifier = concrete_vehicle_speed_modifier
	},
	{
		type = "tile",
		name = "paint-safety-left",
		needs_correction = false,
		transition_merges_with_tile = "concrete",
		minable = {hardness = 0.2, mining_time = 0.5, result = "paint-safety"},
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 1.4,
		layer = 61,
		decorative_removal_probability = 0.25,
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
		walking_sound = {
			{
				filename = "__base__/sound/walking/concrete-01.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 1.2
			}
		},
		map_color={r=0.5, g=0.5, b=0},
		ageing=0,
		vehicle_friction_modifier = concrete_vehicle_speed_modifier
	}
})