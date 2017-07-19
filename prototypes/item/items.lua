--items.lua

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
	local base_tiles = {"dirt", "sand", "sand-dark", "grass", "grass-dry", "red-desert", "red-desert-dark", "water", "water-green"}
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
			    stack_size = DECT.CONFIG["landscaping_stack_size"],
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
	base_landfill.stack_size = DECT.CONFIG["landscaping_stack_size"]

end

-- Change base concrete & stone path
local base_concrete = data.raw["item"]["concrete"]
local base_stone_brick = data.raw["item"]["stone-brick"]
base_concrete.stack_size = DECT.CONFIG["flooring_stack_size"]
base_stone_brick.stack_size = DECT.CONFIG["flooring_stack_size"]

if DECT.ENABLED["painted-concrete"] then

	-- Add new subgroup
	data:extend({
		{
			type = "item-subgroup",
			name = "concrete-paint",
			group = "logistics",
			order = "i"
		}
	})

	-- Add new items
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		data:extend({
			{
				type = "item",
				name = "dect-paint-"..variant,
				icon = "__Dectorio__/graphics/icons/paint-"..variant..".png",
			    flags = {"goes-to-main-inventory"},
			    subgroup = "concrete-paint",
			    order = _.."[paint-"..variant.."]",
			    stack_size = DECT.CONFIG["flooring_stack_size"],
			    place_as_tile = {
					result = "dect-paint-"..variant.."-left",
					condition_size = 4,
					condition = { "water-tile" }
				}
			}
		})
	end

	-- Hide base hazard concrete item
	if DECT.CONFIG["disable_hazard_concrete"] then
		table.insert(data.raw.item["hazard-concrete"].flags,"hidden")
	end

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "item",
			name = "dect-wood-floor",
			icon = "__Dectorio__/graphics/icons/wood-floor.png",
			flags = {"goes-to-main-inventory"},
			fuel_category = "chemical",
			fuel_value = "2MJ",
			subgroup = "terrain",
			order = "a[stone-brick]-b[wood-floor]",
			stack_size = DECT.CONFIG["flooring_stack_size"],
			place_as_tile = {
				result = "dect-wood-floor",
				condition_size = 4,
				condition = { "water-tile" }
			}
		}
	})

end

if DECT.ENABLED["gravel"] then

	-- Allow stone to be placed as gravel
	local base_stone = data.raw["item"]["stone"]
	base_stone.place_as_tile = {
		result = "dect-gravel",
		condition_size = 4,
		condition = { "water-tile" }
	}

end

if DECT.ENABLED["walls"] then

	data:extend({
		{
			type = "item",
			name = "dect-concrete-wall",
			icon = "__Dectorio__/graphics/icons/concrete-wall.png",
		    flags = {"goes-to-quickbar"},
		    subgroup = "defensive-structure",
		    order = "a[d-concrete-wall]",
		    stack_size = DECT.CONFIG["walls_stack_size"],
	    	place_result = "dect-concrete-wall"
		},
		{
			type = "item",
			name = "dect-chain-wall",
			icon = "__Dectorio__/graphics/icons/chain-wall.png",
		    flags = {"goes-to-quickbar"},
		    subgroup = "defensive-structure",
		    order = "a[c-chain-wall]",
		    stack_size = DECT.CONFIG["walls_stack_size"],
	    	place_result = "dect-chain-wall"
		},
		{
			type = "item",
			name = "dect-wood-wall",
			icon = "__Dectorio__/graphics/icons/wood-wall.png",
		    flags = {"goes-to-quickbar"},
			fuel_category = "chemical",
			fuel_value = "12MJ",
		    subgroup = "defensive-structure",
		    order = "a[a-wood-wall]",
		    stack_size = DECT.CONFIG["walls_stack_size"],
	    	place_result = "dect-wood-wall"
		},
		{
			type = "item",
			name = "dect-hazard-gate",
			icon = "__Dectorio__/graphics/icons/hazard-gate.png",
		    flags = {"goes-to-quickbar"},
		    subgroup = "defensive-structure",
		    order = "a[wall]-b[hazard-gate]",
		    stack_size = 50,
	    	place_result = "dect-hazard-gate"
		}
	})

	-- Change base stone wall
	local base_stone_wall = data.raw["item"]["stone-wall"]
	base_stone_wall.icon = "__Dectorio__/graphics/icons/stone-brick-wall.png"
	base_stone_wall.stack_size = DECT.CONFIG["walls_stack_size"]
	base_stone_wall.order = "a[b-stone-wall]"

end