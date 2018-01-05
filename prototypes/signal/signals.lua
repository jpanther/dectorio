-- signal/signals

local function char(num)
	return string.char(string.byte("a")+num-1)
end

if DECT.ENABLED["signals"] then

	-- Coloured signals
	-- ----------

	-- Get signals
	local colors = DECT.CONFIG.SIGNALS

	-- Clear out any existing signals that conflict
	for name, signal in pairs(data.raw["virtual-signal"]) do
		if signal.subgroup == "virtual-signal-color" then
			data.raw["virtual-signal"][name] = nil
		end
	end

	-- Create new virtual colour items if they don't already exist
	for i, color in pairs(colors) do
		if color.type=="virtual" then
			local tint = {r=color.color.r, g=color.color.g, b=color.color.b, a=0.70}
			data:extend({
				{
					type = "virtual-signal",
					name = color.name,
					icons = {
						{ icon = "__base__/graphics/icons/signal/signal_grey.png", tint = tint }
					},
					icon_size = 32,
					subgroup = "virtual-signal-color",
					order = "d[colors]-0["..char(i).."-"..color.name.."]"
				}
			})
		end
	end

	-- Reset black signal to 'correct' icon
	if data.raw["virtual-signal"]["signal-black"] then
		local black = data.raw["virtual-signal"]["signal-black"]
		black.icons[1].tint = {r=0.16,g=0.16,b=0.16,a=0.70}
	end

	-- Update the lamps
	local lamp = data.raw.lamp["small-lamp"]
	lamp.signal_to_color_mapping = colors

	local lamp_glow = data.raw.lamp["dect-small-lamp-glow"]
	lamp_glow.signal_to_color_mapping = colors


	-- Icon signals
	-- ----------

	local iconsets = {
		["arrow"] = {
			name = "arrow",
			background = {r=1.00,g=0.58,b=0.14,a=0.2},
			order = "eb",
			icons = {"down", "up", "left", "right", "vertical", "horizontal", "universal", "reset"}
		},
		["misc"] =  {
			name = "misc",
			background = {r=0.65,g=0.38,b=0.99,a=0.2},
			order = "ea",
			icons = {"clock", "alarm", "battery", "power", "nuclear", "rocket", "temperature", "finish", "gears", "star"}
		},
	}

	-- Create new virtual signals with icons
	for i, iconset in pairs(iconsets) do
		data:extend({
			{
				type = "item-subgroup",
				name = iconset.name,
				group = "signals",
				order = iconset.order
			}
		})

		local pos = 1
		for j, icon in pairs(iconset.icons) do

			data:extend({
				{
					type = "virtual-signal",
					name = "dect-signal-"..iconset.name.."-"..icon,
					localised_name = { "dect-signal."..iconset.name.."-"..icon },
					icons = {
						{ icon = "__base__/graphics/icons/signal/signal_grey.png", tint = iconset.background },
						{ icon = "__Dectorio__/graphics/signal/"..iconset.name.."-"..icon..".png" }
					},
					icon_size = 32,
					subgroup = iconset.name,
					order = iconset.order.."["..iconset.name.."]-"..char(pos).."["..icon.."]"
				}
			})
			pos = pos + 1
		end
	end

end
