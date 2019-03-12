-- third-party/alien-biomes

if DECT.ENABLED["landscaping"] and mods["alien-biomes"] then

	-- Supported biomes
	local alien_biomes = {
		"mineral-purple-dirt-1", "mineral-purple-dirt-2", "mineral-purple-dirt-3", "mineral-purple-dirt-4", "mineral-purple-dirt-5", "mineral-purple-dirt-6", "mineral-purple-sand-1", "mineral-purple-sand-2", "mineral-purple-sand-3",
		"mineral-violet-dirt-1", "mineral-violet-dirt-2", "mineral-violet-dirt-3", "mineral-violet-dirt-4", "mineral-violet-dirt-5", "mineral-violet-dirt-6", "mineral-violet-sand-1", "mineral-violet-sand-2", "mineral-violet-sand-3",
		"mineral-red-dirt-1", "mineral-red-dirt-2", "mineral-red-dirt-3", "mineral-red-dirt-4", "mineral-red-dirt-5", "mineral-red-dirt-6", "mineral-red-sand-1", "mineral-red-sand-2", "mineral-red-sand-3",
		"mineral-brown-dirt-1", "mineral-brown-dirt-2", "mineral-brown-dirt-3", "mineral-brown-dirt-4", "mineral-brown-dirt-5", "mineral-brown-dirt-6", "mineral-brown-sand-1", "mineral-brown-sand-2", "mineral-brown-sand-3",
		"mineral-tan-dirt-1", "mineral-tan-dirt-2", "mineral-tan-dirt-3", "mineral-tan-dirt-4", "mineral-tan-dirt-5", "mineral-tan-dirt-6", "mineral-tan-sand-1", "mineral-tan-sand-2", "mineral-tan-sand-3",
		"mineral-aubergine-dirt-1", "mineral-aubergine-dirt-2", "mineral-aubergine-dirt-3", "mineral-aubergine-dirt-4", "mineral-aubergine-dirt-5", "mineral-aubergine-dirt-6", "mineral-aubergine-sand-1", "mineral-aubergine-sand-2", "mineral-aubergine-sand-3",
		"mineral-dustyrose-dirt-1", "mineral-dustyrose-dirt-2", "mineral-dustyrose-dirt-3", "mineral-dustyrose-dirt-4", "mineral-dustyrose-dirt-5", "mineral-dustyrose-dirt-6", "mineral-dustyrose-sand-1", "mineral-dustyrose-sand-2", "mineral-dustyrose-sand-3",
		"mineral-beige-dirt-1", "mineral-beige-dirt-2", "mineral-beige-dirt-3", "mineral-beige-dirt-4", "mineral-beige-dirt-5", "mineral-beige-dirt-6", "mineral-beige-sand-1", "mineral-beige-sand-2", "mineral-beige-sand-3",
		"mineral-cream-dirt-1", "mineral-cream-dirt-2", "mineral-cream-dirt-3", "mineral-cream-dirt-4", "mineral-cream-dirt-5", "mineral-cream-dirt-6", "mineral-cream-sand-1", "mineral-cream-sand-2", "mineral-cream-sand-3",
		"mineral-black-dirt-1", "mineral-black-dirt-2", "mineral-black-dirt-3", "mineral-black-dirt-4", "mineral-black-dirt-5", "mineral-black-dirt-6", "mineral-black-sand-1", "mineral-black-sand-2", "mineral-black-sand-3",
		"mineral-grey-dirt-1", "mineral-grey-dirt-2", "mineral-grey-dirt-3", "mineral-grey-dirt-4", "mineral-grey-dirt-5", "mineral-grey-dirt-6", "mineral-grey-sand-1", "mineral-grey-sand-2", "mineral-grey-sand-3",
		"mineral-white-dirt-1", "mineral-white-dirt-2", "mineral-white-dirt-3", "mineral-white-dirt-4", "mineral-white-dirt-5", "mineral-white-dirt-6", "mineral-white-sand-1", "mineral-white-sand-2", "mineral-white-sand-3",
		"vegetation-turquoise-grass-1", "vegetation-turquoise-grass-2", "vegetation-turquoise-grass-3", "vegetation-turquoise-grass-4",
		"vegetation-green-grass-1", "vegetation-green-grass-2", "vegetation-green-grass-3", "vegetation-green-grass-4",
		"vegetation-olive-grass-1", "vegetation-olive-grass-2",
		"vegetation-yellow-grass-1", "vegetation-yellow-grass-2",
		"vegetation-orange-grass-1", "vegetation-orange-grass-2",
		"vegetation-red-grass-1", "vegetation-red-grass-2",
		"vegetation-violet-grass-1", "vegetation-violet-grass-2",
		"vegetation-purple-grass-1", "vegetation-purple-grass-2",
		"vegetation-mauve-grass-1", "vegetation-mauve-grass-2",
		"vegetation-blue-grass-1", "vegetation-blue-grass-2",
		"volcanic-orange-heat-1", "volcanic-orange-heat-2", "volcanic-orange-heat-3", "volcanic-orange-heat-4",
		"volcanic-green-heat-1", "volcanic-green-heat-2", "volcanic-green-heat-3", "volcanic-green-heat-4",
		"volcanic-blue-heat-1", "volcanic-blue-heat-2", "volcanic-blue-heat-3", "volcanic-blue-heat-4",
		"volcanic-purple-heat-1", "volcanic-purple-heat-2", "volcanic-purple-heat-3", "volcanic-purple-heat-4",
		"frozen-snow-0", "frozen-snow-1", "frozen-snow-2", "frozen-snow-3", "frozen-snow-4", "frozen-snow-5", "frozen-snow-6", "frozen-snow-7", "frozen-snow-8", "frozen-snow-9"
	}
	local tints = {
		tan = {193,162,127},
		white = {255,255,255},
		grey = {177,183,187},
		black = {135,135,135},
		purple = {169,177,239},
		red = {185,107,105},
		violet = {165,107,161},
		dustyrose = {180,148,137},
		cream = {234,216,179},
		brown = {162,117,88},
		beige = {178,164,138},
		aubergine = {126,115,156}
	}
	local rock_prototypes = {"rock-huge", "rock-big"}
	local rocks = {}
	for _, rock in pairs(rock_prototypes) do
		for tint, color in pairs(tints) do
			table.insert(rocks, { name=rock.."-"..tint, tint=tint, color=color, prototype=rock })
		end
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

	-- Create new rock items
	for _, rock in pairs(rocks) do
		if data.raw["simple-entity"][rock.name] then
			data:extend({
				{
					type = "item",
					name = "dect-alien-biomes-"..rock.name,
					icons = {
						{ icon = data.raw["simple-entity"][rock.name].icon, tint = rock.color }
					},
					icon_size = 32,
					subgroup = "landscaping-rocks",
					order = "a[alien-biomes-"..rock.name.."]",
					stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
					place_result = rock.name,
					localised_name = data.raw["simple-entity"][rock.name].localised_name
				},
				{
					type = "recipe",
					name = "dect-alien-biomes-"..rock.name,
					energy_required = 2,
					enabled = false,
					category = "crafting",
					ingredients = {
						{"stone", 30}
					},
					result = "dect-alien-biomes-"..rock.name,
					result_count = 1
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
	local landscaping_effects = {}

	for _, rock in pairs(rocks) do
		if data.raw["simple-entity"][rock.name] then
			table.insert(landscaping_effects, {type = "unlock-recipe", recipe = "dect-alien-biomes-"..rock.name})
		end
	end

	for _, tile in pairs(alien_biomes) do
		local effect = nil
		if data.raw["tile"][tile] then
			effect = {
					type = "unlock-recipe",
					recipe = "dect-alien-biomes-"..tile
				}
			table.insert(landscaping_effects, effect)
		end
	end
	data.raw["technology"]["dect-landscaping"].effects = landscaping_effects

end
