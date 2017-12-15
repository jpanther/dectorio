-- recipe/walls

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
			icon_size = 32,
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
