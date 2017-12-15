-- item/signs

if DECT.ENABLED["signs"] then

	-- Add subgroup for signs
	data:extend({
		{
			type = "item-subgroup",
			name = "signs",
			group = DECT.ITEM_GROUP,
			order = "0"
		}
	})

	data:extend({
		{
			type = "item",
			name = "dect-sign-wood",
			icon = "__Dectorio__/graphics/icons/sign-wood.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "signs",
			order = "a[sign-wood]",
			place_result = "dect-sign-wood",
			stack_size = 50
		},
		{
			type = "item",
			name = "dect-sign-steel",
			icon = "__Dectorio__/graphics/icons/sign-steel.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "signs",
			order = "b[sign-steel]",
			place_result = "dect-sign-steel",
			stack_size = 50
		}
	})

end
