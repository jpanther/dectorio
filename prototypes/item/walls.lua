-- item/walls

if DECT.ENABLED["walls"] then

	data:extend({
		{
			type = "item",
			name = "dect-concrete-wall",
			icon = "__Dectorio__/graphics/icons/concrete-wall.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "defensive-structure",
			order = "a[d-concrete-wall]",
			stack_size = DECT.CONFIG.SETTINGS["walls_stack_size"],
			place_result = "dect-concrete-wall"
		},
		{
			type = "item",
			name = "dect-chain-wall",
			icon = "__Dectorio__/graphics/icons/chain-wall.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "defensive-structure",
			order = "a[c-chain-wall]",
			stack_size = DECT.CONFIG.SETTINGS["walls_stack_size"],
			place_result = "dect-chain-wall"
		},
		{
			type = "item",
			name = "dect-wood-wall",
			icon = "__Dectorio__/graphics/icons/wood-wall.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			fuel_category = "chemical",
			fuel_value = "12MJ",
			subgroup = "defensive-structure",
			order = "a[a-wood-wall]",
			stack_size = DECT.CONFIG.SETTINGS["walls_stack_size"],
			place_result = "dect-wood-wall"
		},
		{
			type = "item",
			name = "dect-hazard-gate",
			icon = "__Dectorio__/graphics/icons/hazard-gate.png",
			icon_size = 32,
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
	base_stone_wall.stack_size = DECT.CONFIG.SETTINGS["walls_stack_size"]
	base_stone_wall.order = "a[b-stone-wall]"

end
