-- technology/flooring

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

if DECT.ENABLED["concrete"] then

	-- Add grid-based concrete to base Concrete tech
	local base_concrete_effects = data.raw["technology"]["concrete"].effects
	table.insert(base_concrete_effects, {type = "unlock-recipe", recipe = "dect-concrete-grid"})

end
