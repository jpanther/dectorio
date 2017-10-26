-- technology/landscaping

if DECT.ENABLED["landscaping"] then

	data:extend({
		{
			type = "technology",
			name = "dect-landscaping",
			icon = "__Dectorio__/graphics/technology/landscaping.png",
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
					recipe = "dect-base-dirt"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-sand"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-sand-dark"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-grass"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-grass-dry"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert-dark"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-stone-rock"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert-rock-big-01"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert-rock-huge-01"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-red-desert-rock-huge-02"
				}
			},
			order = "a"
		}
	})

	-- Move base landfill tech underneath landscaping
	local base_landfill = data.raw["technology"]["landfill"]
	base_landfill.prerequisites = {"dect-landscaping"}
	base_landfill.effects = {
				{
					type = "unlock-recipe",
					recipe = "landfill"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-water"
				},
				{
					type = "unlock-recipe",
					recipe = "dect-base-water-green"
				}
	}

end