-- technology/walls

if DECT.ENABLED["walls"] then
	-- Change stone wall tech to basic walls
	local base_stone_walls = data.raw["technology"]["stone-walls"]
	base_stone_walls.icon = "__Dectorio__/graphics/technology/basic-walls.png"
	base_stone_walls.icon_size = 128
	table.insert(base_stone_walls.effects, {type = "unlock-recipe", recipe = "dect-wood-wall"})

	data:extend(
		{
			{
				type = "technology",
				name = "dect-advanced-walls",
				icon = "__Dectorio__/graphics/technology/advanced-walls.png",
				icon_size = 128,
				prerequisites = {"military-2", "concrete", "stone-walls"},
				unit = {
					count = 150,
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"military-science-pack", 1}
					},
					time = 30
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
			},
			{
				type = "technology",
				name = "dect-advanced-gates",
				icon = "__base__/graphics/technology/gates.png",
				icon_size = 128,
				prerequisites = {"gates", "dect-advanced-walls"},
				unit = {
					count = 150,
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"military-science-pack", 1}
					},
					time = 45
				},
				effects = {
					{
						type = "unlock-recipe",
						recipe = "dect-concrete-gate"
					}
				},
				order = "e-p-b-a"
			}
		}
	)
end
