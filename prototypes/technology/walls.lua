-- technology/walls

if DECT.ENABLED["walls"] then

	-- Change stone wall tech to basic walls
	local base_stone_walls = data.raw["technology"]["stone-walls"]
	base_stone_walls.icon = "__Dectorio__/graphics/technology/basic-walls.png"
	base_stone_walls.icon_size = 128
	table.insert(base_stone_walls.effects, {type = "unlock-recipe", recipe = "dect-wood-wall"})

	data:extend({
		{
			type = "technology",
			name = "dect-advanced-walls",
			icon = "__Dectorio__/graphics/technology/advanced-walls.png",
			icon_size = 128,
			prerequisites = {"concrete", "stone-walls"},
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
		}

	})

	-- Change gates to require concrete-walls and unlock Hazard gate
	local base_gates = data.raw["technology"]["gates"]
	base_gates.prerequisites = {"dect-advanced-walls", "military-2"}
	table.insert(base_gates.effects, {type="unlock-recipe", recipe="dect-hazard-gate"})

end
