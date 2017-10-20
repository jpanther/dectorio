-- entity/lamp

-- Add glowing coloured lamp
local lamp = util.table.deepcopy(data.raw["lamp"]["small-lamp"])
lamp.name = "dect-small-lamp-glow"
lamp.icon = "__Dectorio__/graphics/icons/small-lamp-glow.png"
lamp.minable.result = "dect-small-lamp-glow"
lamp.glow_size = 25
lamp.glow_color_intensity = 0.8
lamp.glow_render_mode = "multiplicative"
lamp.light_when_colored.size = 0
lamp.light_when_colored.intensity = 0
data:extend({lamp})