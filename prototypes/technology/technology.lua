--technology.lua

data:extend(
{
	{
		type = "technology",
		name = "concrete-paint",
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
				recipe = "paint-hazard"
			},
			{
				type = "unlock-recipe",
				recipe = "paint-emergency"
			},
			{
				type = "unlock-recipe",
				recipe = "paint-radiation"
			},
			{
				type = "unlock-recipe",
				recipe = "paint-safety"
			}
		},
		order = "e-p-b-a"
	},
	{
		type = "technology",
		name = "wood-floor",
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
				recipe = "wood-floor"
			}
		},
		order = "a-j-z"
	}

})