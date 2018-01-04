-- item/flooring

-- Add new subgroup for basic floorings
data:extend({
	{
		type = "item-subgroup",
		name = "flooring-basic",
		group = DECT.ITEM_GROUP,
		order = "i-b"
	}
})

-- Change base concrete & stone path
local base_concrete = data.raw["item"]["concrete"]
local base_stone_brick = data.raw["item"]["stone-brick"]
base_concrete.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]
base_concrete.subgroup = "flooring-basic"
base_concrete.order = "00[d-concrete]"
base_stone_brick.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]
base_stone_brick.subgroup = "flooring-basic"
base_stone_brick.order = "00[b-stone-brick]"

if DECT.ENABLED["painted-concrete"] then

	-- Add new subgroup for painted concretes
	data:extend({
		{
			type = "item-subgroup",
			name = "flooring-painted",
			group = DECT.ITEM_GROUP,
			order = "i-c"
		}
	})

	-- Add new items
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		data:extend({
			{
				type = "item",
				name = "dect-paint-"..variant.name,
				icon = "__Dectorio__/graphics/icons/paint-"..variant.name..".png",
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "flooring-painted",
				order = "00[b-".._.."-paint-"..variant.name.."]",
				stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
				place_as_tile = {
					result = "dect-paint-"..variant.name.."-left",
					condition_size = 1,
					condition = { "water-tile" }
				}
			}
		})
	end

	-- Move base hazard concrete item under painted concrete
	local base_hazard_item = data.raw["item"]["hazard-concrete"]
	base_hazard_item.subgroup = "flooring-painted"
	base_hazard_item.order = "00[a-hazard-concrete]"
	base_hazard_item.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]

	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		base_hazard_item.icon = "__Dectorio__/graphics/icons/paint-hazard.png"
	end

else

	-- Move base hazard concrete item under basic flooring
	local base_hazard_item = data.raw["item"]["hazard-concrete"]
	base_hazard_item.subgroup = "flooring-basic"
	base_hazard_item.order = "00[f-hazard-concrete]"
	base_hazard_item.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "item",
			name = "dect-wood-floor",
			icon = "__Dectorio__/graphics/icons/wood-floor.png",
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			fuel_category = "chemical",
			fuel_value = "2MJ",
			subgroup = "flooring-basic",
			order = "00[a-wood-floor]",
			stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
			place_as_tile = {
				result = "dect-wood-floor",
				condition_size = 1,
				condition = { "water-tile" }
			}
		}
	})

end

if DECT.ENABLED["concrete"] then

	data:extend({
		{
			type = "item",
			name = "dect-concrete-grid",
			icon = "__Dectorio__/graphics/icons/concrete-grid.png",
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			subgroup = "flooring-basic",
			order = "00[e-concrete-grid]",
			stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
			place_as_tile = {
				result = "dect-concrete-grid",
				condition_size = 1,
				condition = { "water-tile" }
			}
		}
	})

end

if DECT.ENABLED["gravel"] then

	-- Add new items
	for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
		data:extend({
			{
				type = "item",
				name = "dect-"..variant.name.."-gravel",
				icons = {
					{ icon = "__Dectorio__/graphics/icons/gravel.png", tint = variant.color },
				},
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "flooring-basic",
				order = "00[g-gravel-"..variant.name.."]",
				stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
				place_as_tile = {
					result = "dect-"..variant.name.."-gravel",
					condition_size = 2,
					condition = { "water-tile" }
				}
			}
		})
	end

end
