--settings.lua

data:extend({
	{
		type = "bool-setting",
		name = "dectorio-signals",
		setting_type = "startup",
		default_value = true,
		order = "a"
	},
	{
		type = "bool-setting",
		name = "dectorio-walls",
		setting_type = "startup",
		default_value = true,
		order = "c"
	},
	{
		type = "bool-setting",
		name = "dectorio-landscaping",
		setting_type = "startup",
		default_value = true,
		order = "b"
	},
	{
		type = "bool-setting",
		name = "dectorio-flooring",
		setting_type = "startup",
		default_value = true,
		order = "d"
	},
	{
		type = "bool-setting",
		name = "dectorio-painted-concrete",
		setting_type = "startup",
		default_value = true,
		order = "e"
	},
	{
		type = "bool-setting",
		name = "dectorio-signs",
		setting_type = "startup",
		default_value = true,
		order = "f"
	}
})