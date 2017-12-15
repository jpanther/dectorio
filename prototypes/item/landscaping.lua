-- item/landscaping

if DECT.ENABLED["landscaping"] then

	-- Add subgroup for base tiles
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping",
			group = DECT.ITEM_GROUP,
			order = "l-a"
		}
	})

	-- Add new items
	local base_tiles = DECT.CONFIG.BASE_TILES
	for _, tile in pairs(base_tiles) do
		data:extend({
			{
				type = "item",
				name = "dect-base-"..tile,
				icon = "__Dectorio__/graphics/icons/base-"..tile..".png",
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "landscaping",
				order = "a[base-"..tile.."]",
				stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
				place_as_tile = {
					result = tile,
					condition_size = 1,
					condition = { "water-tile" }
				},
				localised_name = {"tile-name."..tile}
			}
		})
	end

	-- Add subgroup for base water
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping-water",
			group = DECT.ITEM_GROUP,
			order = "l-b"
		}
	})

	-- Add new items
	local water_tiles = DECT.CONFIG.BASE_WATER_TILES
	for _, tile in pairs(water_tiles) do
		data:extend({
			{
				type = "item",
				name = "dect-base-"..tile,
				icon = "__Dectorio__/graphics/icons/base-"..tile..".png",
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "landscaping-water",
				order = "a[base-"..tile.."]",
				stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
				place_as_tile = {
					result = tile,
					condition_size = 1,
					condition = { "water-tile" }
				},
				localised_name = {"tile-name."..tile}
			}
		})
	end

	-- Add subgroup for base rocks
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping-rocks",
			group = DECT.ITEM_GROUP,
			order = "l-c"
		}
	})

	-- Add items for placing rocks
	local base_rocks = DECT.CONFIG.BASE_ROCKS
	for _, rock in pairs(base_rocks) do
		data:extend({
			{
				type = "item",
				name = "dect-base-"..rock,
				icon = data.raw["simple-entity"][rock].icon,
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "landscaping-rocks",
				order = "a[base-"..rock.."]",
				stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
				place_result = rock,
				localised_name = {"entity-name."..rock}
			}
		})
	end

	-- Modify base landfill stack size
	local base_landfill = data.raw["item"]["landfill"]
	base_landfill.subgroup = "landscaping-water"
	base_landfill.order = "b[landfill]"
	base_landfill.stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"]

end
