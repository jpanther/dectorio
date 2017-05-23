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
					recipe = "dect-base-sand-dark"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-grass"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-grass-dry"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert-dark"
				}
			},
			order = "a"
		}
	})

	-- Move base landfill tech underneath landscaping
	local base_landfill = data.raw["technology"]["landfill"]
	base_landfill.prerequisites = {"dect-landscaping"}
	base_landfill.effects = {
				{
					type = "unlock-recipe",
					recipe = "landfill"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-water"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-water-green"
				}
	}

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

	-- Change stone wall tech to basic walls
	local base_stone_walls = data.raw["technology"]["stone-walls"]
	base_stone_walls.icon = "__Dectorio__/graphics/technology/basic-walls.png"
	base_stone_walls.icon_size = 128
	base_stone_walls.effects = {
		{
			type = "unlock-recipe",
			recipe = "dect-wood-wall"
		},
		{
			type = "unlock-recipe",
			recipe = "stone-wall"
		}
	}

	data:extend({
		{
			type = "technology",
			name = "dect-advanced-walls",
			icon = "__Dectorio__/graphics/technology/advanced-walls.png",
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
					recipe = "dect-chain-wall"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-concrete-wall"
				}
			},
			order = "e-p-b-a"
		}

	})

	-- Change gates to require concrete-walls
	local base_gates = data.raw["technology"]["gates"]
	base_gates.prerequisites = {"dect-advanced-walls", "military-2"}

end