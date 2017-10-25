-- recipe/decoratives

if DECT.ENABLED["decoratives"] then

	data:extend({
		{
			type = "recipe",
			name = "dect-traffic-bollard",
			enabled = false,
			ingredients = {
				{"plastic-bar", 2},
				{"iron-plate", 1},
			},
			result = "dect-traffic-bollard"
		}
	})

end