-- technology/lamp

-- Add coloured lamp to Optics technology
local base_optics = data.raw["technology"]["optics"]
table.insert(base_optics.effects, {type="unlock-recipe", recipe="dect-small-lamp-glow"})
