-- signal.lua

local function char(num)
	return string.char(string.byte("a")+num-1)
end

if DECT.ENABLED["signals"] then

	-- Get signals
	local colors = DECT.CONFIG.SIGNALS

	-- Clear out any existing signals
	for name, signal in pairs(data.raw["virtual-signal"]) do
		if signal.order:find("colors") then
			data.raw["virtual-signal"][name] = nil
		end
	end

	-- Create new virtual color items if they don't already exist
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
					subgroup = "virtual-signal-color",
					order = "d[colors]-0["..char(i).."-"..color.name.."]"
				}
			})
		end
	end

	-- Reset black signal to correct icon
	if data.raw["virtual-signal"]["signal-black"] then
		local black = data.raw["virtual-signal"]["signal-black"]
		black.icons[1].tint = {r=0.16,g=0.16,b=0.16,a=0.70}
	end

	-- Update the lamps
	local lamp = data.raw.lamp["small-lamp"]
	lamp.signal_to_color_mapping = colors

end