-- recipe/lamp

-- Add glowing coloured lamp
local lamp = util.table.deepcopy(data.raw["recipe"]["small-lamp"])
lamp.name = "dect-small-lamp-glow"
lamp.result = "dect-small-lamp-glow"
data:extend({lamp})