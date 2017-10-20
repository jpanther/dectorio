-- recipe/flooring

if DECT.ENABLED["painted-concrete"] then

	-- Add new recipes
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		data:extend({
			{
				type = "recipe",
				name = "dect-paint-"..variant,
				energy_required = 5,
				enabled = false,
				category = "crafting",
				ingredients = {
					{"concrete", 10},
				},
				result= "dect-paint-"..variant,
				result_count = 10
			}
		})
	end

	data.raw["recipe"]["hazard-concrete"].energy_required = 5

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

if DECT.ENABLED["walls"] then
	
	-- Add new recipes
	data:extend({
		{
			type = "recipe",
			name = "dect-concrete-wall",
			enabled = false,
			ingredients = {
				{"concrete", 5},
				{"iron-stick", 2}
			},
			result = "dect-concrete-wall"
		},
		{
			type = "recipe",
			name = "dect-concrete-wall-from-stone-wall",
			localised_name = {"recipe-name.dect-concrete-wall-from-stone-wall"},
			icon = "__Dectorio__/graphics/icons/concrete-wall-from-stone-wall.png",
			energy_required = 1,
			enabled = false,
			ingredients = {
				{"stone-wall", 1},
				{"concrete", 2}
			},
			result = "dect-concrete-wall"
		},
		{
			type = "recipe",
			name = "dect-chain-wall",
			enabled = false,
			ingredients = {
				{"iron-stick", 2},
				{"steel-plate", 2}
			},
			result = "dect-chain-wall"
		},
		{
			type = "recipe",
			name = "dect-wood-wall",
			enabled = false,
			ingredients = {{"raw-wood", 3}},
			result = "dect-wood-wall"
		},
		{
			type = "recipe",
			name = "dect-hazard-gate",
			enabled = false,
			ingredients = {
				{"dect-concrete-wall", 1},
				{"steel-plate", 2},
				{"electronic-circuit", 2}
			},
			result = "dect-hazard-gate"
		}
	})

	-- Change gates to use concrete-wall
	data.raw["recipe"]["gate"].ingredients = data.raw["recipe"]["dect-hazard-gate"].ingredients

end