-- entity/signs

if DECT.ENABLED["signs"] then

	data:extend({
		{
			type = "simple-entity",
			name = "dect-sign-wood",
			icon = "__Dectorio__/graphics/icons/sign-wood.png",
			icon_size = 32,
			flags = {"placeable-neutral"},
			render_layer = "object",
			minable = {mining_time = 1, result = "dect-sign-wood", count = 1},
			max_health = 40,
			collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			drawing_box = {{-0.5, -1.6}, {0.5, 0.5}},
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__Dectorio__/sound/deconstruct-wood.ogg" },
			vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0},
			pictures = {
				{
					filename = "__Dectorio__/graphics/entity/sign-wood/sign-wood.png",
					priority = "extra-high",
					width = 85,
					height = 65,
					shift = {0.8, -0.45}
				}
			}
		},
		{
			type = "simple-entity",
			name = "dect-sign-steel",
			icon = "__Dectorio__/graphics/icons/sign-steel.png",
			icon_size = 32,
			flags = {"placeable-neutral"},
			render_layer = "object",
			minable = {mining_time = 1, result = "dect-sign-steel", count = 1},
			max_health = 65,
			collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			drawing_box = {{-0.5, -1.6}, {0.5, 0.5}},
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
			vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 1.0},
			pictures = {
				{
					filename = "__Dectorio__/graphics/entity/sign-steel/sign-steel.png",
					priority = "extra-high",
					width = 85,
					height = 65,
					shift = {0.77, -0.45}
				}
			}
		}
	})

end
