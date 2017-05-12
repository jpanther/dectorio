-- Dectorio configuration

local DECT = {}

-- ENABLED COMPONENTS
-- These options are configured through the in-game options (Options > Mods > Startup)
-- Don't change them here!
DECT.ENABLED = {
    ["signals"] = settings.startup["dectorio-signals"].value,
    ["walls"] = settings.startup["dectorio-walls"].value,
    ["landscaping"] = settings.startup["dectorio-landscaping"].value,
    ["wood-floor"] = settings.startup["dectorio-wood-floor"].value,
    ["painted-concrete"] = settings.startup["dectorio-painted-concrete"].value,
}

-- CONFIGURABLE OPTIONS
-- These options can be changed to suit individual play-style
DECT.CONFIG = {
    -- How likely it is that decorations are removed when placing flooring
    -- (0 = keep all decorations, 0.5 = remove 50% of decorations, 1 = remove all decorations)
    ["decorative_removal_probability"] = 1,

    -- Whether the base concrete recipe should be modified to use iron sticks in place of iron ore
    -- (true = recipe uses iron sticks, false = recipe uses iron ore)
    ["modified_concrete_recipe"] = true,

    -- Whether painted concrete (when enabled) disables the base game hazard concrete
    -- (true = only painted concrete is used, false = both painted and original hazard concrete variants are available)
    ["disable_hazard_concrete"] = true,
}

DECT.CONFIG.SIGNALS = {
    -- All the signal colors to be changed/added
    -- RGB values from 0 to 255, alpha is optional
    -- The order of the signals is the order they will appear in-game
    -- NOTE: New virtual signals will need localised names to be provided in '/locale/[language]/signals.cfg'
    {type="virtual", name="signal-red", color={r=255,g=38,b=0}},            -- Maraschino
    {type="virtual", name="signal-orange", color={r=253,g=89,b=35}},        -- Orange
    {type="virtual", name="signal-tangerine", color={r=255,g=147,b=0}},     -- Tangerine
    {type="virtual", name="signal-yellow", color={r=255,g=251,b=0}},        -- Lemon
    {type="virtual", name="signal-green", color={r=0,g=249,b=0}},           -- Spring
    {type="virtual", name="signal-cyan", color={r=0,g=253,b=255}},          -- Turquoise
    {type="virtual", name="signal-aqua", color={r=0,g=150,b=255}},          -- Aqua
    {type="virtual", name="signal-blue", color={r=4,g=51,b=255}},           -- Blueberry
    {type="virtual", name="signal-purple", color={r=148,g=55,b=255}},       -- Grape
    {type="virtual", name="signal-pink", color={r=255,g=64,b=255}},         -- Magenta
    {type="virtual", name="signal-white", color={r=255,g=255,b=255}},       -- Snow
    {type="virtual", name="signal-grey", color={r=192,g=192,b=192}},        -- Magnesium
    {type="virtual", name="signal-black", color={r=41,g=0,b=126}},          -- UV black light

    {type="item", name="raw-wood", color={r=128,g=71,b=0,a=220}},           -- Mocha (dark)
    {type="item", name="coal", color={r=33,g=33,b=33,a=220}},               -- Lead
    {type="item", name="stone", color={r=146,g=104,b=0,a=220}},             -- Asparagus (light)
    {type="item", name="iron-ore", color={r=46,g=193,b=255,a=220}},         -- Aqua (light)
    {type="item", name="iron-plate", color={r=145,g=145,b=145,a=220}},      -- Tin
    {type="item", name="steel-plate", color={r=192,g=192,b=192,a=220}},     -- Magnesium
    {type="item", name="copper-ore", color={r=227,g=131,b=0,a=220}},        -- Tangerine (dark)
    {type="item", name="copper-plate", color={r=255,g=126,b=121,a=220}},    -- Salmon
    {type="item", name="uranium-ore", color={r=163,g=250,b=0,a=220}},       -- Lime (light)

    {type="fluid", name="water", color={r=0,g=110,b=192,a=175}},            -- Aqua (light)
    {type="fluid", name="crude-oil", color={r=26,g=26,b=26,a=175}},         -- Lead (dark)
    {type="fluid", name="heavy-oil", color={r=160,g=12,b=0,a=175}},         -- Orange (dark)
    {type="fluid", name="light-oil", color={r=182,g=106,b=0,a=175}},        -- Tangerine (light)
    {type="fluid", name="petroleum-gas", color={r=96,g=32,b=96,a=175}},     -- Grape (light)
    {type="fluid", name="sulfuric-acid", color={r=240,g=208,b=32,a=175}},   -- Lemon
    {type="fluid", name="lubricant", color={r=48,g=134,b=96,a=175}},        -- Fern
}

return DECT