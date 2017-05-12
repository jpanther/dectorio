--technology.lua

if DECT.ENABLED["landscaping"] then

	data:extend({
		{
			type = "technology",
			name = "landscaping",
			icon = "__Dectorio__/graphics/technology/landscaping.png",
			icon_size = 128,
			unit = {
				count = 15,
				ingredients = {
					{"science-pack-1", 1},
				},
				time = 10
			},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "base-dirt"
				},
				{
					type = "unlock-recipe",
					recipe = "base-sand"
				},
				{
					type = "unlock-recipe",
					recipe = "base-grass"
				}
			},
			order = "a"
		}
	})

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "technology",
			name = "wood-floor",
			icon = "__Dectorio__/graphics/technology/wood-floor.png",
			icon_size = 128,
			unit = {
				count = 10,
				ingredients = {
					{"science-pack-1", 1},
				},
				time = 10
			},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "wood-floor"
				}
			},
			order = "a-j-z"
		}
	})

end

if DECT.ENABLED["painted-concrete"] then

	data:extend({
		{
			type = "technology",
			name = "concrete-paint",
			icon = "__Dectorio__/graphics/technology/concrete-paint.png",
			icon_size = 128,
			prerequisites = {"concrete"},
			unit = {
				count = 150,
				ingredients = {
					{"science-pack-1", 1},
					{"science-pack-2", 1}
				},
				time = 20
			},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "paint-hazard"
				},
				{
					type = "unlock-recipe",
					recipe = "paint-emergency"
				},
				{
					type = "unlock-recipe",
					recipe = "paint-radiation"
				},
				{
					type = "unlock-recipe",
					recipe = "paint-safety"
				}
			},
			order = "e-p-b-a"
		}
	})

end

if DECT.ENABLED["walls"] then

	data:extend({
		{
			type = "technology",
			name = "concrete-walls",
			icon = "__Dectorio__/graphics/technology/concrete-walls.png",
			icon_size = 128,
			prerequisites = {"concrete", "stone-walls"},
			unit = {
				count = 150,
				ingredients = {
					{"science-pack-1", 1},
					{"science-pack-2", 1}
				},
				time = 20
			},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "concrete-wall"
				}
			},
			order = "e-p-b-a"
		}

	})

end