--recipes.lua

-- Add recipes for base assets
data:extend(
{
	{
		type = "recipe",
		name = "base-dirt",
		energy_required = 5,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"stone", 1}
		},
		result = "base-dirt",
		result_count = 10
	},
	{
		type = "recipe",
		name = "base-sand",
		energy_required = 5,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"stone", 2}
		},
		result = "base-sand",
		result_count = 10
	},
	{
		type = "recipe",
		name = "base-grass",
		energy_required = 5,
		enabled = false,
		category = "crafting",
		ingredients = {
			{"raw-wood", 2}
		},
		result = "base-grass",
		result_count = 10
	}
})

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
	},
	{
		type = "recipe",
		name = "stone-brick-wall",
		enabled = false,
		ingredients = {{"stone-brick", 5}},
		result = "stone-brick-wall"
	},
	{
		type = "recipe",
		name = "concrete-wall",
		enabled = false,
		ingredients = {{"concrete", 5}},
		result = "concrete-wall"
	},
})