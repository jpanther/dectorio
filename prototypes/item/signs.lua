-- item/signs

if DECT.ENABLED["signs"] then

	data:extend({
		{
			type = "item",
			name = "dect-sign-wood",
			icon = "__Dectorio__/graphics/icons/sign-wood.png",
			flags = {"goes-to-quickbar"},
			subgroup = DECT.ITEM_SUBGROUP["terrain"],
			order = "x[sign-wood]",
			place_result = "dect-sign-wood",
			stack_size = 50
		},
		{
			type = "item",
			name = "dect-sign-steel",
			icon = "__Dectorio__/graphics/icons/sign-steel.png",
			flags = {"goes-to-quickbar"},
			subgroup = DECT.ITEM_SUBGROUP["terrain"],
			order = "y[sign-steel]",
			place_result = "dect-sign-steel",
			stack_size = 50
		}
	})

end