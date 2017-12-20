-- recipe/flooring

if DECT.ENABLED["painted-concrete"] then

	-- Add new recipes
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		data:extend({
			{
				type = "recipe",
				name = "dect-paint-"..variant.name,
				energy_required = 5,
				enabled = false,
				category = "crafting",
				ingredients = {
					{"concrete", 10},
				},
				result= "dect-paint-"..variant.name,
				result_count = 10
			}
		})
	end

	data.raw["recipe"]["hazard-concrete"].energy_required = 5

end

if DECT.ENABLED["gravel"] then

	-- Add new recipes
	for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
		data:extend({
			{
				type = "recipe",
				name = "dect-"..variant.name.."-gravel",
				energy_required = 0.1,
				enabled = true,
				category = "crafting",
				ingredients = {
					{variant.name, 1},
				},
				result= "dect-"..variant.name.."-gravel",
				result_count = 1
			}
		})
	end

end

if DECT.ENABLED["wood-floor"] then

	-- Add new recipes
	data:extend({
		{	-- Wooden floorboards
			type = "recipe",
			name = "dect-wood-floor",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"wood", 10},
			},
			result= "dect-wood-floor",
			result_count = 10
		}
	})

end

if DECT.ENABLED["concrete"] then

	-- Add new recipes
	data:extend({
		{	-- Concrete grid
			type = "recipe",
			name = "dect-concrete-grid",
			energy_required = 10,
			enabled = false,
			category = "crafting-with-fluid",
	      ingredients = {
				{"stone-brick", 5},
				{"iron-ore", 1},
				{type="fluid", name="water", amount=100}
	      },
			result= "dect-concrete-grid",
			result_count = 10
		}
	})

end
