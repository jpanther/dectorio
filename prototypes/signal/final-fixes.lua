-- signal/final-fixes

if DECT.ENABLED["signals"] then

	-- Get signals and update mappings (in case some new ones are added by other mods)
	local colors = DECT.CONFIG.SIGNALS
	for _, signal in pairs(data.raw["virtual-signal"]) do
		if not (signal.subgroup == "virtual-signal-color") and signal.color then
			table.insert(colors, {type=signal.type, name=signal.name, color=signal.color})
		end
	end

	local lamp = data.raw.lamp["small-lamp"]
	lamp.signal_to_color_mapping = colors

	local lamp_glow = data.raw.lamp["dect-small-lamp-glow"]
	lamp_glow.signal_to_color_mapping = colors

end
