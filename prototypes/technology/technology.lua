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
					recipe = "hazard-concrete"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-danger"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-emergency"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-caution"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-radiation"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-defect"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-operations"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-paint-safety"
				}
			},
			order = "e-p-b-a"
		}
	})

	-- Remove Hazard concrete from Concrete tech (as it's now under the painted concrete tech)
	local base_concrete_effects = data.raw["technology"]["concrete"].effects
	for i = 1, #base_concrete_effects do
		effect = base_concrete_effects[i]
		if effect.type == "unlock-recipe" and effect.recipe == "hazard-concrete" then
			index = i
		end
	end	
	table.remove(base_concrete_effects, index)

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
				},
				{
					type = "unlock-recipe",
					recipe = "dect-concrete-wall-from-stone-wall"
				}
			},
			order = "e-p-b-a"
		}

	})

	-- Change gates to require concrete-walls and unlock Hazard gate
	local base_gates = data.raw["technology"]["gates"]
	base_gates.prerequisites = {"dect-advanced-walls", "military-2"}
	table.insert(base_gates.effects,{type="unlock-recipe",recipe="dect-hazard-gate"})

end

if DECT.ENABLED["signs"] then

	data:extend({
		{
			type = "technology",
			name = "dect-signs",
			icon = "__Dectorio__/graphics/technology/signs.png",
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
					recipe = "dect-sign-wood"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-sign-steel"
				}
			},
			order = "a-j-z"
		}
	})

end
