--items.lua

if DECT.ENABLED["landscaping"] then

	-- Add items for base assets
	data:extend({
		{
			type = "item-subgroup",
			name = "landscaping",
			group = "logistics",
			order = "g"
		},
		{
			type = "item",
			name = "dect-base-dirt",
			icon = "__Dectorio__/graphics/icons/base-dirt.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "dirt",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-sand",
			icon = "__Dectorio__/graphics/icons/base-sand.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "sand",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-sand-dark",
			icon = "__Dectorio__/graphics/icons/base-sand-dark.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]-c[base-sand-dark]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "sand-dark",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-grass",
			icon = "__Dectorio__/graphics/icons/base-grass.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]-c[base-sand-dark]-d[base-grass]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "grass",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-grass-dry",
			icon = "__Dectorio__/graphics/icons/base-grass-dry.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]-c[base-sand-dark]-d[base-grass]-e[base-grass-dry]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "grass-dry",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-red-desert",
			icon = "__Dectorio__/graphics/icons/base-red-desert.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]-c[base-sand-dark]-d[base-grass]-e[base-grass-dry]-f[red-desert]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "red-desert",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-base-red-desert-dark",
			icon = "__Dectorio__/graphics/icons/base-red-desert-dark.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "landscaping",
		    order = "a[base-dirt]-b[base-sand]-c[base-sand-dark]-d[base-grass]-e[base-grass-dry]-f[red-desert]-g[red-desert-dark]",
		    stack_size = DECT.CONFIG["landscaping_stack_size"],
		    place_as_tile = {
				result = "red-desert-dark",
				condition_size = 4,
				condition = { "water-tile" }
			}
		}
	})

end

-- Change base concrete & stone path
local base_concrete = data.raw["item"]["concrete"]
local base_stone_brick = data.raw["item"]["stone-brick"]
base_concrete.stack_size = DECT.CONFIG["flooring_stack_size"]
base_stone_brick.stack_size = DECT.CONFIG["flooring_stack_size"]

if DECT.ENABLED["painted-concrete"] then

	-- Add new items
	data:extend(
	{
		{
			type = "item-subgroup",
			name = "concrete-paint",
			group = "logistics",
			order = "i"
		},
		{
			type = "item",
			name = "dect-paint-hazard",
			icon = "__Dectorio__/graphics/icons/paint-hazard.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "concrete-paint",
		    order = "a[paint-hazard]",
		    stack_size = DECT.CONFIG["flooring_stack_size"],
		    place_as_tile = {
				result = "dect-paint-hazard-left",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-paint-emergency",
			icon = "__Dectorio__/graphics/icons/paint-emergency.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "concrete-paint",
		    order = "a[paint-hazard]-b[paint-emergency]",
		    stack_size = DECT.CONFIG["flooring_stack_size"],
		    place_as_tile = {
				result = "dect-paint-emergency-left",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-paint-safety",
			icon = "__Dectorio__/graphics/icons/paint-safety.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "concrete-paint",
		    order = "a[paint-hazard]-b[paint-emergency]-c[paint-radiation]-d[paint-safety]",
		    stack_size = DECT.CONFIG["flooring_stack_size"],
		    place_as_tile = {
				result = "dect-paint-safety-left",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
		{
			type = "item",
			name = "dect-paint-radiation",
			icon = "__Dectorio__/graphics/icons/paint-radiation.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "concrete-paint",
		    order = "a[paint-hazard]-b[paint-emergency]-c[paint-radiation]",
		    stack_size = DECT.CONFIG["flooring_stack_size"],
		    place_as_tile = {
				result = "dect-paint-radiation-left",
				condition_size = 4,
				condition = { "water-tile" }
			}
		}
	})

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "item",
			name = "dect-wood-floor",
			icon = "__Dectorio__/graphics/icons/wood-floor.png",
		    flags = {"goes-to-main-inventory"},
		    subgroup = "terrain",
		    order = "a[stone-brick]-b[wood-floor]",
		    stack_size = DECT.CONFIG["flooring_stack_size"],
		    place_as_tile = {
				result = "dect-wood-floor",
				condition_size = 4,
				condition = { "water-tile" }
			}
		},
	})

end

if DECT.ENABLED["walls"] then

	data:extend({
		{
			type = "item",
			name = "dect-concrete-wall",
			icon = "__Dectorio__/graphics/icons/concrete-wall.png",
		    flags = {"goes-to-quickbar"},
		    subgroup = "defensive-structure",
		    order = "a[stone-wall]-b[chain-wall]-c[concrete-wall]",
		    stack_size = DECT.CONFIG["walls_stack_size"],
	    	place_result = "dect-concrete-wall"
		},
		{
			type = "item",
			name = "dect-chain-wall",
			icon = "__Dectorio__/graphics/icons/chain-wall.png",
		    flags = {"goes-to-quickbar"},
		    subgroup = "defensive-structure",
		    order = "a[stone-wall]-b[chain-wall]",
		    stack_size = DECT.CONFIG["walls_stack_size"],
	    	place_result = "dect-chain-wall"
		}
	})

	-- Change base stone wall
	local base_stone_wall = data.raw["item"]["stone-wall"]
	base_stone_wall.icon = "__Dectorio__/graphics/icons/stone-brick-wall.png"
	base_stone_wall.stack_size = DECT.CONFIG["walls_stack_size"]

end