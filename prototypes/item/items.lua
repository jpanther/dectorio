--items.lua

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
	    order = "a[paint-hazard]-b[paint-emergency]-c[paint-safety]",
	    stack_size = 100,
	    place_as_tile = {
			result = "paint-safety-left",
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
	}
})