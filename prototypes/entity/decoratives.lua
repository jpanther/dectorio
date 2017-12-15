-- entity/decoratives

if DECT.ENABLED["decoratives"] then

	data:extend({
		{
			type = "simple-entity-with-force",
			name = "dect-traffic-bollard",
			icon = "__Dectorio__/graphics/icons/traffic-bollard.png",
			icon_size = 32,
			flags = {"placeable-neutral", "placeable-player", "player-creation"},
			render_layer = "object",
			minable = {hardness = 0.2, mining_time = 0.3, result = "dect-traffic-bollard", count = 1},
			max_health = 120,
			corpse = "small-remnants",
			collision_box = {{-0.15, -0.15}, {0.25, 0.15}},
			selection_box = {{-0.25, -1.4}, {0.25, 0.16}},
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
			vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.7},
			pictures = {
				{
					filename = "__Dectorio__/graphics/decoratives/traffic-bollard/traffic-bollard.png",
					priority = "extra-high",
					width = 35,
					height = 42,
					shift = {0.4, -0.6}
				}
			}
		}
	})

end
