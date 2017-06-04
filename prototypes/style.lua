-- style.lua

local icons = {}
for i, icon in pairs(DECT.CONFIG.SIGN_ICONS) do
	for _, obj in pairs(data.raw[icon]) do
		if obj.icons == nil and obj.icon ~= nil then
			local monolith = {
				type = "monolith",
				monolith_image = {
					filename = obj.icon,
					priority = "extra-high-no-scale",
					width = 32,
					height = 32,
					x = 0
				}
			}
			table.insert(icons, obj.name)
			data.raw["gui-style"].default["dect-icon-"..obj.name] = {
				type = "button_style",
				parent = "button_style",
				width = 32,
				height = 32,
				top_padding = 1,
				right_padding = 1,
				bottom_padding = 1,
				left_padding = 1,
				font = "default-button",
				default_font_color = {r=0.92, g=0.92, b=0.92},
				default_graphical_set = monolith,
				hovered_graphical_set = monolith,
				clicked_graphical_set = monolith
			}
		end
	end
end

data:extend({{
	type = "flying-text",
	name = "DECT_SIGN_ICONS",
	time_to_live = 0,
	speed = 1,
	localised_description = icons
}})