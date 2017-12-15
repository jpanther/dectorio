-- item/flooring

-- Change base concrete & stone path
local base_concrete = data.raw["item"]["concrete"]
local base_stone_brick = data.raw["item"]["stone-brick"]
base_concrete.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]
base_stone_brick.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]

if DECT.ENABLED["painted-concrete"] then

	-- Add new subgroup
	data:extend({
		{
			type = "item-subgroup",
			name = "flooring",
			group = DECT.ITEM_GROUP,
			order = "i-b"
		}
	})

	-- Add new items
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		data:extend({
			{
				type = "item",
				name = "dect-paint-"..variant,
				icon = "__Dectorio__/graphics/icons/paint-"..variant..".png",
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "flooring",
				order = _.."[paint-"..variant.."]",
				stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
				place_as_tile = {
					result = "dect-paint-"..variant.."-left",
					condition_size = 1,
					condition = { "water-tile" }
				}
			}
		})
	end

	-- Move base hazard concrete item under painted concrete
	local base_hazard_item = data.raw["item"]["hazard-concrete"]
	base_hazard_item.subgroup = "flooring"
	base_hazard_item.order = "00[a-hazard-concrete]"
	base_hazard_item.stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"]

	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		base_hazard_item.icon = "__Dectorio__/graphics/icons/paint-hazard.png"
	end

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
			subgroup = "flooring",
			order = "00[0-wood-floor]",
			stack_size = DECT.CONFIG.SETTINGS["flooring_stack_size"],
			place_as_tile = {
				result = "dect-wood-floor",
				condition_size = 1,
				condition = { "water-tile" }
			}
		}
	})

end

if DECT.ENABLED["gravel"] then

	-- Allow ores to be placed as gravel
	local base_stone = data.raw["item"]["stone"]
	base_stone.place_as_tile = {
		result = "dect-gravel",
		condition_size = 2,
		condition = { "water-tile" }
	}

	local base_iron = data.raw["item"]["iron-ore"]
	base_iron.place_as_tile = {
		result = "dect-iron-gravel",
		condition_size = 2,
		condition = { "water-tile" }
	}

	local base_copper = data.raw["item"]["copper-ore"]
	base_copper.place_as_tile = {
		result = "dect-copper-gravel",
		condition_size = 2,
		condition = { "water-tile" }
	}

	local base_coal = data.raw["item"]["coal"]
	base_coal.place_as_tile = {
		result = "dect-coal-gravel",
		condition_size = 2,
		condition = { "water-tile" }
	}

end
