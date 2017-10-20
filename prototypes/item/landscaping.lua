-- item/landscaping

if DECT.ENABLED["landscaping"] then

	-- Add subgroup for base assets
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping",
			group = "logistics",
			order = "g"
		}
	})

	-- Add new items
	local base_tiles = DECT.CONFIG.BASE_TILES
	for _, tile in pairs(base_tiles) do
		local cond_size = 4
		if string.find(tile, "water") then
			cond_size = 1
		end
		data:extend({
			{
				type = "item",
				name = "dect-base-"..tile,
				icon = "__Dectorio__/graphics/icons/base-"..tile..".png",
				flags = {"goes-to-main-inventory"},
				subgroup = "landscaping",
				order = _.."[base-"..tile.."]",
				stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
				place_as_tile = {
					result = tile,
					condition_size = cond_size,
					condition = { "water-tile" }
				}
			}
		})
	end

	-- Modify base landfill stack size
	local base_landfill = data.raw["item"]["landfill"]
	base_landfill.subgroup = "landscaping"
	base_landfill.order = "7[landfill]"
	base_landfill.stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"]

end