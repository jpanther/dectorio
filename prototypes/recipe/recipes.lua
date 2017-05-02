--recipes.lua


-- Modify base concrete recipe to replace iron ore with iron sticks
data.raw["recipe"]["concrete"].ingredients = {
			{"stone-brick", 5},
			{"iron-stick", 2},
			{type="fluid", name="water", amount=100}
		}

-- Add new recipes
data:extend(
{
	{	-- Concrete paint - Hazard
		type = "recipe",
		name = "paint-hazard",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"concrete", 10},
		},
		result= "paint-hazard",
		result_count = 10
	},
	{	-- Concrete paint - Emergency
		type = "recipe",
		name = "paint-emergency",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"concrete", 10},
		},
		result= "paint-emergency",
		result_count = 10
	},
	{	-- Concrete paint - Safety
		type = "recipe",
		name = "paint-safety",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"concrete", 10},
		},
		result= "paint-safety",
		result_count = 10
	},
	{	-- Concrete paint - Radiation Hazard
		type = "recipe",
		name = "paint-radiation",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"concrete", 10},
		},
		result= "paint-radiation",
		result_count = 10
	},
	{	-- Wooden floorboards
		type = "recipe",
		name = "wood-floor",
		energy_required = 5,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"wood", 5},
		},
		result= "wood-floor",
		result_count = 10
	}
})