-- Dectorio configuration

local DECT = {}
DECT.CONFIG = {}

-- CONFIGURABLE OPTIONS
-- ---------------------------------
-- These options can be changed to suit individual play-style
-- If playing multiplayer, ensure the same config.lua is used on each player's system
-- ---------------------------------

DECT.CONFIG.SIGNALS = {
	-- All the signal colors to be changed/added
	-- RGBA values from 0 to 1, alpha is optional
	-- The order of the virtual signals is the order they will appear in-game
	-- NOTE: New virtual signals will need localised names to be provided in '/locale/[language]/dectorio.cfg'
	{type = "virtual", name = "signal-red", color = {r = 1.00, g = 0.16, b = 0.10, a = 1.00}},
	{type = "virtual", name = "signal-maroon", color = {r = 0.50, g = 0.00, b = 0.00, a = 1.00}},
	{type = "virtual", name = "signal-emerald", color = {r = 0.17, g = 0.54, b = 0.25, a = 1.00}},
	{type = "virtual", name = "signal-green", color = {r = 0.00, g = 0.95, b = 0.17, a = 1.00}},
	{type = "virtual", name = "signal-olive", color = {r = 0.50, g = 0.50, b = 0.01, a = 1.00}},
	{type = "virtual", name = "signal-blue", color = {r = 0.07, g = 0.35, b = 0.98, a = 1.00}},
	{type = "virtual", name = "signal-yellow", color = {r = 1.00, g = 0.96, b = 0.27, a = 1.00}},
	{type = "virtual", name = "signal-tangerine", color = {r = 1.00, g = 0.58, b = 0.14, a = 1.00}},
	{type = "virtual", name = "signal-orange", color = {r = 0.99, g = 0.44, b = 0.22, a = 1.00}},
	{type = "virtual", name = "signal-pink", color = {r = 1.00, g = 0.42, b = 0.99, a = 1.00}},
	{type = "virtual", name = "signal-teal", color = {r = 0.28, g = 0.60, b = 0.56, a = 1.00}},
	{type = "virtual", name = "signal-cyan", color = {r = 0.01, g = 0.98, b = 1.00, a = 1.00}},
	{type = "virtual", name = "signal-aqua", color = {r = 0.05, g = 0.67, b = 0.99, a = 1.00}},
	{type = "virtual", name = "signal-navy", color = {r = 0.00, g = 0.00, b = 0.50, a = 1.00}},
	{type = "virtual", name = "signal-purple", color = {r = 0.65, g = 0.38, b = 0.99, a = 1.00}},
	{type = "virtual", name = "signal-violet", color = {r = 0.56, g = 0.12, b = 0.70, a = 1.00}},
	{type = "virtual", name = "signal-brown", color = {r = 0.60, g = 0.39, b = 0.14, a = 1.00}},
	{type = "virtual", name = "signal-white", color = {r = 1.00, g = 1.00, b = 1.00, a = 1.00}},
	{type = "virtual", name = "signal-grey", color = {r = 0.80, g = 0.80, b = 0.80, a = 1.00}},
	{type = "virtual", name = "signal-black", color = {r = 0.22, g = 0.13, b = 0.56, a = 1.00}},
	{type = "item", name = "wood", color = {r = 0.57, g = 0.36, b = 0.12, a = 0.86}},
	{type = "item", name = "coal", color = {r = 0.17, g = 0.17, b = 0.17, a = 0.86}},
	{type = "item", name = "stone", color = {r = 0.64, g = 0.50, b = 0.30, a = 0.86}},
	{type = "item", name = "iron-ore", color = {r = 0.24, g = 0.80, b = 0.99, a = 0.86}},
	{type = "item", name = "iron-plate", color = {r = 0.63, g = 0.64, b = 0.64, a = 0.86}},
	{type = "item", name = "steel-plate", color = {r = 0.80, g = 0.80, b = 0.80, a = 0.86}},
	{type = "item", name = "copper-ore", color = {r = 0.91, g = 0.58, b = 0.13, a = 0.86}},
	{type = "item", name = "copper-plate", color = {r = 0.92, g = 0.59, b = 0.46, a = 0.86}},
	{type = "item", name = "uranium-ore", color = {r = 0.69, g = 0.96, b = 0.18, a = 0.86}},
	{type = "item", name = "sulfur", color = {r = 0.98, g = 0.93, b = 0.13, a = 0.86}},
	{type = "item", name = "automation-science-pack", color = {r = 0.71, g = 0.05, b = 0.09, a = 1.00}},
	{type = "item", name = "logistic-science-pack", color = {r = 0.18, g = 0.60, b = 0.11, a = 1.00}},
	{type = "item", name = "chemical-science-pack", color = {r = 0.15, g = 0.65, b = 0.75, a = 1.00}},
	{type = "item", name = "military-science-pack", color = {r = 0.23, g = 0.27, b = 0.31, a = 1.00}},
	{type = "item", name = "production-science-pack", color = {r = 0.58, g = 0.11, b = 0.76, a = 1.00}},
	{type = "item", name = "utility-science-pack", color = {r = 0.81, g = 0.69, b = 0.08, a = 1.00}},
	{type = "item", name = "space-science-pack", color = {r = 0.96, g = 0.96, b = 0.96, a = 1.00}},
	{type = "item", name = "transport-belt", color = {r = 0.90, g = 0.75, b = 0.10, a = 0.92}},
	{type = "item", name = "underground-belt", color = {r = 0.90, g = 0.75, b = 0.10, a = 0.92}},
	{type = "item", name = "splitter", color = {r = 0.90, g = 0.75, b = 0.10, a = 0.92}},
	{type = "item", name = "fast-transport-belt", color = {r = 0.84, g = 0.08, b = 0.02, a = 0.92}},
	{type = "item", name = "fast-underground-belt", color = {r = 0.84, g = 0.08, b = 0.02, a = 0.92}},
	{type = "item", name = "fast-splitter", color = {r = 0.84, g = 0.08, b = 0.02, a = 0.92}},
	{type = "item", name = "express-transport-belt", color = {r = 0.02, g = 0.60, b = 0.83, a = 0.92}},
	{type = "item", name = "express-underground-belt", color = {r = 0.02, g = 0.60, b = 0.83, a = 0.92}},
	{type = "item", name = "express-splitter", color = {r = 0.02, g = 0.60, b = 0.83, a = 0.92}},
	{type = "item", name = "electronic-circuit", color = {r = 0.18, g = 0.60, b = 0.00, a = 0.92}},
	{type = "item", name = "advanced-circuit", color = {r = 0.72, g = 0.00, b = 0.00, a = 0.92}},
	{type = "item", name = "processing-unit", color = {r = 0.27, g = 0.26, b = 1.00, a = 0.92}},
	{type = "item", name = "burner-inserter", color = {r = 0.38, g = 0.31, b = 0.26, a = 0.92}},
	{type = "item", name = "inserter", color = {r = 0.78, g = 0.51, b = 0.20, a = 0.92}},
	{type = "item", name = "long-handed-inserter", color = {r = 0.76, g = 0.20, b = 0.13, a = 0.92}},
	{type = "item", name = "fast-inserter", color = {r = 0.27, g = 0.45, b = 0.58, a = 0.92}},
	{type = "item", name = "filter-inserter", color = {r = 0.45, g = 0.27, b = 0.54, a = 0.92}},
	{type = "item", name = "stack-inserter", color = {r = 0.56, g = 0.63, b = 0.16, a = 0.92}},
	{type = "item", name = "stack-filter-inserter", color = {r = 0.70, g = 0.70, b = 0.69, a = 0.92}},
	{type = "fluid", name = "water", color = {r = 0.00, g = 0.43, b = 0.75, a = 0.68}},
	{type = "fluid", name = "crude-oil", color = {r = 0.10, g = 0.10, b = 0.10, a = 0.68}},
	{type = "fluid", name = "heavy-oil", color = {r = 0.63, g = 0.05, b = 0.00, a = 0.68}},
	{type = "fluid", name = "light-oil", color = {r = 0.71, g = 0.42, b = 0.00, a = 0.68}},
	{type = "fluid", name = "petroleum-gas", color = {r = 0.38, g = 0.13, b = 0.38, a = 0.68}},
	{type = "fluid", name = "sulfuric-acid", color = {r = 0.94, g = 0.82, b = 0.13, a = 0.68}},
	{type = "fluid", name = "lubricant", color = {r = 0.00, g = 0.75, b = 0.30, a = 0.68}},
	{type = "fluid", name = "steam", color = {r = 0.92, g = 0.92, b = 0.92, a = 0.68}}
}

-- ---------------------------------
-- STOP HERE! DO NOT CHANGE BELOW THIS LINE!
-- ---------------------------------

-- INTERNAL CONFIGURATION
-- ---------------------------------

-- In-game configurable settings
DECT.ENABLED = {
	["signals"] = settings.startup["dectorio-signals"].value,
	["walls"] = settings.startup["dectorio-walls"].value,
	["landscaping"] = settings.startup["dectorio-landscaping"].value,
	["waterfill"] = settings.startup["dectorio-waterfill"].value,
	["wood-floor"] = settings.startup["dectorio-wood"].value,
	["concrete"] = settings.startup["dectorio-concrete"].value,
	["gravel"] = settings.startup["dectorio-gravel"].value,
	["painted-concrete"] = settings.startup["dectorio-painted-concrete"].value,
	["decoratives"] = settings.startup["dectorio-decoratives"].value,
	["lawnmower"] = settings.startup["dectorio-lawnmower"].value,
	["item-group"] = settings.startup["dectorio-item-group"].value,
	["waterfill-shallow"] = settings.startup["dectorio-waterfill-shallow"].value,
	["waterfill-normal"] = settings.startup["dectorio-waterfill-normal"].value,
	["waterfill-deep"] = settings.startup["dectorio-waterfill-deep"].value,
}

-- The subgroups for all items in the mod
DECT.ITEM_GROUP = DECT.ENABLED["item-group"] and "dectorio" or "logistics"

DECT.CONFIG.SETTINGS = {
	["decorative_removal_probability"] = settings.startup["dectorio-decorative-removal-probability"].value,
	["vanilla_hazard_concrete"] = settings.startup["dectorio-vanilla-hazard-concrete-style"].value,
	["painted_concrete_speed_modifier"] = settings.startup["dectorio-painted-concrete-speed-modifier"].value,
	["landscaping_blueprintable"] = settings.startup["dectorio-landscaping-blueprintable"].value,
	["remove_decoratives_near_entity"] = settings.startup["dectorio-remove-decoratives-near-entity"].value,
	["flooring_stack_size"] = settings.startup["dectorio-flooring-stack-size"].value,
	["landscaping_stack_size"] = settings.startup["dectorio-landscaping-stack-size"].value,
	["walls_stack_size"] = settings.startup["dectorio-walls-stack-size"].value,
}

DECT.CONFIG.PAINT_VARIANTS = {
	{name = "danger", color = {r = 0.81, g = 0.31, b = 0.31}},
	{name = "emergency", color = {r = 0.86, g = 0.36, b = 0.38}},
	{name = "caution", color = {r = 0.85, g = 0.56, b = 0.26}},
	{name = "radiation", color = {r = 0.86, g = 0.56, b = 0.78}},
	{name = "defect", color = {r = 0.47, g = 0.50, b = 1.00}},
	{name = "operations", color = {r = 0.37, g = 0.37, b = 0.37}},
	{name = "safety", color = {r = 0.61, g = 0.77, b = 0.40}}
}
DECT.CONFIG.GRAVEL_VARIANTS = {
	{name = "stone", color = {r = 0.57, g = 0.57, b = 0.57}},
	{name = "iron-ore", color = {r = 0.45, g = 0.54, b = 0.64}},
	{name = "copper-ore", color = {r = 0.64, g = 0.46, b = 0.45}},
	{name = "coal", color = {r = 0.33, g = 0.33, b = 0.33}}
}
DECT.CONFIG.WATERFILL_TILES = {
	["shallow"] = {"water-shallow", "water-mud"},
	["normal"] = {"water", "water-green"},
	["deep"] = {"deepwater", "deepwater-green"}
}

-- When changing these tables, the migration scripts need to be adjusted to compensate!
DECT.CONFIG.BASE_TILES = {
	"dry-dirt",
	"dirt-1",
	"dirt-2",
	"dirt-3",
	"dirt-4",
	"dirt-5",
	"dirt-6",
	"dirt-7",
	"sand-1",
	"sand-2",
	"sand-3",
	"grass-1",
	"grass-2",
	"grass-3",
	"grass-4",
	"red-desert-0",
	"red-desert-1",
	"red-desert-2",
	"red-desert-3"
}
DECT.CONFIG.BASE_WATER_TILES = {}
for water_kind, water_tiles in pairs(DECT.CONFIG.WATERFILL_TILES) do
	if DECT.ENABLED["waterfill-" .. water_kind] then
		for _, water_tile in pairs(water_tiles) do
			table.insert(DECT.CONFIG.BASE_WATER_TILES, water_tile)
		end
	end
end
DECT.CONFIG.BASE_TREES = {
	"tree-01",
	"tree-02",
	"tree-03",
	"tree-04",
	"tree-05",
	"tree-06",
	"tree-07",
	"tree-08",
	"tree-09",
	"dead-dry-hairy-tree",
	"dead-grey-trunk",
	"dead-tree-desert",
	"dry-hairy-tree",
	"dry-tree",
	"tree-02-red",
	"tree-08-red",
	"tree-09-red",
	"tree-06-brown",
	"tree-08-brown",
	"tree-09-brown"
}
DECT.CONFIG.BASE_ROCKS = {"huge-rock", "big-rock", "big-sand-rock"}
DECT.CONFIG.BASE_COLORS = {
	{name = "red", tint = {r = 1.000, g = 0.266, b = 0.241}},
	{name = "green", tint = {r = 0.173, g = 0.824, b = 0.250}},
	{name = "blue", tint = {r = 0.343, g = 0.683, b = 1.000}},
	{name = "orange", tint = {r = 1.000, g = 0.630, b = 0.259}},
	{name = "yellow", tint = {r = 1.000, g = 0.828, b = 0.231}},
	{name = "pink", tint = {r = 1.000, g = 0.720, b = 0.833}},
	{name = "purple", tint = {r = 0.821, g = 0.440, b = 0.998}},
	{name = "black", tint = {r = 0.5, g = 0.5, b = 0.5}},
	{name = "brown", tint = {r = 0.757, g = 0.522, b = 0.371}},
	{name = "cyan", tint = {r = 0.335, g = 0.918, b = 0.866}},
	{name = "acid", tint = {r = 0.708, g = 0.996, b = 0.134}}
}

DECT.INCOMPATIBLE = {}
DECT.INCOMPATIBLE.MODS = {
	["Expanded_Color_Lamps"] = {
		name = "Expanded_Color_Lamps",
		component = "signals",
		reason = "signals"
	},
	["Thaumaturgic-Machinations"] = {
		name = "Thaumaturgic-Machinations",
		component = "landscaping",
		reason = "item"
	}
	-- ["PickerTweaks"] = {
	-- 	name = "PickerTweaks",
	-- 	component = "signals",
	-- 	reason = "item",
	-- 	setting = {type="startup", name="picker-better-lamp-colors", value=true}
	-- },
}

DECT.DEBUG = false

return DECT
