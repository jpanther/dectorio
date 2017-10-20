-- recipe/landscaping

if DECT.ENABLED["landscaping"] then

	-- Add recipes for base assets
	data:extend({
		{
			type = "recipe",
			name = "dect-base-dirt",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"stone", 1}
			},
			result = "dect-base-dirt",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-sand",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"stone", 2}
			},
			result = "dect-base-sand",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-sand-dark",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"stone", 2}
			},
			result = "dect-base-sand-dark",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-grass",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"raw-wood", 2}
			},
			result = "dect-base-grass",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-grass-dry",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"raw-wood", 2}
			},
			result = "dect-base-grass-dry",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-red-desert",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"stone", 2}
			},
			result = "dect-base-red-desert",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-red-desert-dark",
			energy_required = 5,
			enabled = false,
			category = "crafting",
			ingredients = {
				{"stone", 2}
			},
			result = "dect-base-red-desert-dark",
			result_count = 10
		},
		{
			type = "recipe",
			name = "dect-base-water",
			energy_required = 10,
			enabled = false,
			category = "crafting-with-fluid",
			ingredients = {
				{"iron-axe", 2},
				{"explosives", 5},
				{type="fluid", name="water", amount=100}
			},
			result = "dect-base-water",
			result_count = 1
		},
		{
			type = "recipe",
			name = "dect-base-water-green",
			energy_required = 10,
			enabled = false,
			category = "crafting-with-fluid",
			ingredients = {
				{"iron-axe", 2},
				{"explosives", 5},
				{type="fluid", name="water", amount=100}
			},
			result = "dect-base-water-green",
			result_count = 1
		}
	})

end