-- technology/landscaping

if DECT.ENABLED["landscaping"] then

	local base_tiles = DECT.CONFIG.BASE_TILES
	local water_tiles = DECT.CONFIG.BASE_WATER_TILES
	local base_rocks = DECT.CONFIG.BASE_ROCKS

	-- Add new Landscaping technoogy
	local landscaping_effects = {}
	for _, tile in pairs(base_tiles) do
		if data.raw["tile"][tile] then
			table.insert(landscaping_effects, {type = "unlock-recipe", recipe = "dect-base-"..tile})
		end
	end
	for _, rock in pairs(base_rocks) do
		if data.raw["simple-entity"][rock] then
			table.insert(landscaping_effects, {type = "unlock-recipe", recipe = "dect-base-"..rock})
		end
	end

	data:extend({
		{
			type = "technology",
			name = "dect-landscaping",
			icon = "__Dectorio__/graphics/technology/landscaping.png",
			icon_size = 128,
			unit = {
				count = 15,
				ingredients = {
					{"science-pack-1", 1},
				},
				time = 10
			},
			effects = landscaping_effects,
			order = "a"
		}
	})

	-- Move base landfill tech underneath landscaping
	local base_landfill = data.raw["technology"]["landfill"]
	base_landfill.prerequisites = {"dect-landscaping"}

	-- Add waterfill items to Landfill technology
	for _, tile in pairs(water_tiles) do
		if data.raw["tile"][tile] then
			table.insert(base_landfill.effects, {type = "unlock-recipe", recipe = "dect-base-"..tile})
		end
	end

end
