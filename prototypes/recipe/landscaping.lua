-- recipe/landscaping

if DECT.ENABLED["landscaping"] then

	local base_tiles = DECT.CONFIG.BASE_TILES
	local water_tiles = DECT.CONFIG.BASE_WATER_TILES
	local base_rocks = DECT.CONFIG.BASE_ROCKS

	-- Create new landscaping recipes for base ground tiles
	for _, tile in pairs(base_tiles) do
		if data.raw["tile"][tile] then
			data:extend({
				{
					type = "recipe",
					name = "dect-base-"..tile,
					energy_required = 5,
					enabled = false,
					category = "crafting",
					ingredients = {
						{"stone", 2}
					},
					result = "dect-base-"..tile,
					result_count = 10
				}
			})
		end
	end

	-- Create new landscaping recipes for base water tiles
	for _, tile in pairs(water_tiles) do
		if data.raw["tile"][tile] then
			data:extend({
				{
					type = "recipe",
					name = "dect-base-"..tile,
					energy_required = 10,
					enabled = false,
					category = "crafting-with-fluid",
					ingredients = {
						{"iron-axe", 2},
						{"explosives", 5},
						{type="fluid", name="water", amount=100}
					},
					result = "dect-base-"..tile,
					result_count = 1
				}
			})
		end
	end

	-- Create new landscaping recipes for base rock decoratives
	for _, rock in pairs(base_rocks) do
		local base_rock_loot = data.raw["simple-entity"][rock].loot
		local rock_ingredients = {}
		for i, ingredient in pairs(base_rock_loot) do
			table.insert(rock_ingredients, {base_rock_loot[i].item, base_rock_loot[i].count_max})
		end
		data:extend({
			{
				type = "recipe",
				name = "dect-base-"..rock,
				energy_required = 2,
				enabled = false,
				category = "crafting",
				ingredients = rock_ingredients,
				result = "dect-base-"..rock,
				result_count = 1
			}
		})
	end

end
