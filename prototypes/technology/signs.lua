-- technology/signs

if DECT.ENABLED["signs"] then

	data:extend({
		{
			type = "technology",
			name = "dect-signs",
			icon = "__Dectorio__/graphics/technology/signs.png",
			icon_size = 128,
			unit = {
				count = 15,
				ingredients = {
					{"science-pack-1", 1},
				},
				time = 10
			},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "dect-sign-wood"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-sign-steel"
				}
			},
			order = "a-j-z"
		}
	})

end