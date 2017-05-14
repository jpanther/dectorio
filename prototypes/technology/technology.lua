--technology.lua

if DECT.ENABLED["landscaping"] then

	data:extend({
		{
			type = "technology",
			name = "dect-landscaping",
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
					recipe = "dect-base-dirt"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-sand"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-grass"
				}
			},
			order = "a"
		}
	})

	-- Move base landfill tech underneath landscaping
	data.raw["technology"]["landfill"].prerequisites = {"dect-landscaping"}

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "technology",
			name = "dect-wood-floor",
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
					recipe = "dect-wood-floor"
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
			name = "dect-concrete-paint",
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
					recipe = "dect-paint-hazard"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-emergency"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-radiation"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-safety"
				}
			},
			order = "e-p-b-a"
		}
	})

	if DECT.CONFIG["disable_hazard_concrete"] then

		-- Remove base Hazard concrete (as it's replaced by painted concrete)
		data.raw["technology"]["concrete"].effects = {{
		        type = "unlock-recipe",
		        recipe = "concrete"
		      }}
		      
	end

end

if DECT.ENABLED["walls"] then

	data:extend({
		{
			type = "technology",
			name = "dect-concrete-walls",
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
					recipe = "dect-concrete-wall"
				}
			},
			order = "e-p-b-a"
		}

	})

	-- Change stone wall tech
	data.raw["technology"]["stone-walls"].icon = "__Dectorio__/graphics/technology/stone-brick-walls.png"
	data.raw["technology"]["stone-walls"].icon_size = 128

	-- Change gates to require concrete-walls
	data.raw["technology"]["gates"].prerequisites = {"dect-concrete-walls", "military-2"}

end