--items.lua

-- Add items for base assets
data:extend(
{
	{
		type = "item-subgroup",
		name = "landscaping",
		group = "logistics",
		order = "g"
	},
	{
		type = "item",
		name = "base-dirt",
		icon = "__Dectorio__/graphics/icons/base-dirt.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "landscaping",
	    order = "a[base-dirt]",
	    stack_size = 100,
	    place_as_tile = {
			result = "dirt",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "base-sand",
		icon = "__Dectorio__/graphics/icons/base-sand.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "landscaping",
	    order = "a[base-dirt]-b[base-sand]",
	    stack_size = 100,
	    place_as_tile = {
			result = "sand",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "base-grass",
		icon = "__Dectorio__/graphics/icons/base-grass.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "landscaping",
	    order = "a[base-dirt]-b[base-sand]-c[base-grass]",
	    stack_size = 100,
	    place_as_tile = {
			result = "grass",
			condition_size = 4,
			condition = { "water-tile" }
		}
	}
})

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
		name = "paint-hazard",
		icon = "__Dectorio__/graphics/icons/paint-hazard.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "concrete-paint",
	    order = "a[paint-hazard]",
	    stack_size = 100,
	    place_as_tile = {
			result = "paint-hazard-left",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "paint-emergency",
		icon = "__Dectorio__/graphics/icons/paint-emergency.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "concrete-paint",
	    order = "a[paint-hazard]-b[paint-emergency]",
	    stack_size = 100,
	    place_as_tile = {
			result = "paint-emergency-left",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "paint-safety",
		icon = "__Dectorio__/graphics/icons/paint-safety.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "concrete-paint",
	    order = "a[paint-hazard]-b[paint-emergency]-c[paint-radiation]-d[paint-safety]",
	    stack_size = 100,
	    place_as_tile = {
			result = "paint-safety-left",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "paint-radiation",
		icon = "__Dectorio__/graphics/icons/paint-radiation.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "concrete-paint",
	    order = "a[paint-hazard]-b[paint-emergency]-c[paint-radiation]",
	    stack_size = 100,
	    place_as_tile = {
			result = "paint-radiation-left",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "wood-floor",
		icon = "__Dectorio__/graphics/icons/wood-floor.png",
	    flags = {"goes-to-main-inventory"},
	    subgroup = "terrain",
	    order = "a[stone-brick]-b[wood-floor]",
	    stack_size = 100,
	    place_as_tile = {
			result = "wood-floor",
			condition_size = 4,
			condition = { "water-tile" }
		}
	},
	{
		type = "item",
		name = "concrete-wall",
		icon = "__Dectorio__/graphics/icons/concrete-wall.png",
	    flags = {"goes-to-quickbar"},
	    subgroup = "defensive-structure",
	    order = "a[stone-wall]-b[concrete-wall]",
	    stack_size = 100,
    	place_result = "concrete-wall"
	}
})