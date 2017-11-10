-- item/landscaping

if DECT.ENABLED["landscaping"] then

	-- Add subgroup for base tiles
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping",
			group = DECT.ITEM_GROUP["landscaping"],
			order = "l-a"
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

	-- Add subgroup for base rocks
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping-rocks",
			group = DECT.ITEM_GROUP["landscaping-rocks"],
			order = "l-b"
		}
	})

	-- Add items for placing rocks
	local base_rocks = {"stone-rock", "red-desert-rock-big-01", "red-desert-rock-huge-01", "red-desert-rock-huge-02"}
	for _, rock in pairs(base_rocks) do
		local rock_name = ""
		if string.find(rock,"-0") then
			rock_name = string.sub(rock,1,-4)
		else
			rock_name = rock
		end
		data:extend({
			{
				type = "item",
				name = "dect-base-"..rock,
				icon = data.raw["simple-entity"][rock].icon,
				flags = {"goes-to-main-inventory"},
				subgroup = "landscaping-rocks",
				order = _.."[base-"..rock.."]",
				stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"],
				place_result = rock,
				localised_name = {"entity-name."..rock_name}
			}
		})
	end

	-- Modify base landfill stack size
	local base_landfill = data.raw["item"]["landfill"]
	base_landfill.subgroup = "landscaping"
	base_landfill.order = "7[landfill]"
	base_landfill.stack_size = DECT.CONFIG.SETTINGS["landscaping_stack_size"]

end
