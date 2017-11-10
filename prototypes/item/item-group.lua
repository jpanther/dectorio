if DECT.ENABLED["item-group"] then

	data:extend({
		{
			type = "item-group",
			name = "dectorio",
			order = "d-a",
			icon = "__Dectorio__/graphics/item-group/dectorio.png",
			icon_size = 64,
		},
		{
			type = "item-subgroup",
			name = "dectorio-subgroup",
			group = "dectorio",
			order = "a",
		}
	})

end