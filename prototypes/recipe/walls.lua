-- recipe/walls

if DECT.ENABLED["walls"] then
	-- Add new recipes
	data:extend(
		{
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
				icon_size = 64,
				icon_mipmaps = 1,
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
				ingredients = {{"wood", 3}},
				result = "dect-wood-wall"
			},
			{
				type = "recipe",
				name = "dect-concrete-gate",
				enabled = false,
				ingredients = {
					{"dect-concrete-wall", 1},
					{"steel-plate", 2},
					{"electronic-circuit", 2}
				},
				result = "dect-concrete-gate"
			},
			{
				type = "recipe",
				name = "dect-concrete-gate-from-stone-gate",
				localised_name = {"recipe-name.dect-concrete-gate-from-stone-gate"},
				icon = "__Dectorio__/graphics/icons/concrete-gate-from-stone-gate.png",
				icon_size = 64,
				icon_mipmaps = 1,
				energy_required = 1,
				enabled = false,
				ingredients = {
					{"gate", 1},
					{"concrete", 2},
					{"electronic-circuit", 1}
				},
				result = "dect-concrete-gate"
			}
		}
	)

	-- Change base gates to simpler recipe
	data.raw["recipe"]["gate"].ingredients = {
		{"stone-wall", 1},
		{"iron-plate", 2},
		{"electronic-circuit", 1}
	}
end
