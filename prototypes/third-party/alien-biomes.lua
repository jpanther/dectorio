-- third-party/alien-biomes

if DECT.ENABLED["landscaping"] and settings.startup["alien-biomes-terrain-scale"] then

	local alien_biomes = DECT.CONFIG.ALIEN_BIOMES

	-- Clear out existing landscaping items and recipes
	local base_tiles = DECT.CONFIG.BASE_TILES
	for _, tile in pairs(base_tiles) do
		data.raw.recipe["dect-base-"..tile] = nil
		data.raw.item["dect-base-"..tile] = nil
	end

	-- Create new landscaping items
	for _, tile in pairs(alien_biomes) do
		if data.raw["tile"][tile] then
			data:extend({
				{
					type = "item",
					name = "dect-alien-biomes-"..tile,
					localised_name = data.raw["tile"][tile].localised_name,
					icon = "__Dectorio__/graphics/third-party/alien-biomes/icons/"..tile..".png",
					icon_size = 32,
					flags = {"goes-to-main-inventory"},
					subgroup = "landscaping",
					order = "a[alien-biomes-"..tile.."]",
					stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
					place_as_tile = {
						result = tile,
						condition_size = 1,
						condition = { "water-tile" }
					}
				}
			})
		end
	end

	-- Create new landscaping recipes
	for _, tile in pairs(alien_biomes) do
		if data.raw["tile"][tile] then
			data:extend({
				{
					type = "recipe",
					name = "dect-alien-biomes-"..tile,
					energy_required = 5,
					enabled = false,
					category = "crafting",
					ingredients = {
						{"stone", 2}
					},
					result = "dect-alien-biomes-"..tile,
					result_count = 10
				}
			})
		end
	end

	-- Make tiles unblueprintable
	for _, tile in pairs(alien_biomes) do
		if data.raw["tile"][tile] then
			data.raw["tile"][tile].can_be_part_of_blueprint = DECT.CONFIG.SETTINGS["landscaping_blueprintable"]
		end
	end

	-- Adjust technology
	local technology_effects = {}
	for _, tile in pairs(alien_biomes) do
		local effect = nil
		if data.raw["tile"][tile] then
			effect = {
					type = "unlock-recipe",
					recipe = "dect-alien-biomes-"..tile
				}
			table.insert(technology_effects, effect)
		end
	end
	data.raw["technology"]["dect-landscaping"].effects = technology_effects

end
