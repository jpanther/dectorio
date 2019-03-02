-- entity/sign-icons

if DECT.ENABLED["signs"] then

	for _, cat in pairs(DECT.CONFIG.SIGN_CATEGORIES) do
		if data.raw[cat] then
			for _, obj in pairs(data.raw[cat]) do
				local sprite = {}
				if obj.icons == nil and obj.icon ~= nil then
					if obj.icon_size == 32 then
						sprite.file = obj.icon
						sprite.tint = nil
					end
				else
					if obj.icon_size == 32 then
						sprite.file = obj.icons[1].icon
						sprite.tint = obj.icons[1].tint
					end
				end
				if sprite.file then
					new_icon = {
						type = "simple-entity",
						name = "dect-icon-"..obj.name,
						flags = {"placeable-off-grid", "not-on-map"},
						selectable_in_game = false,
						render_layer = "higher-object-above",
						picture = {
							filename = sprite.file,
							priority = "extra-high",
							width = 32,
							height = 32,
							scale = 0.7,
							shift = {-0.02, -0.14},
							tint = sprite.tint
						}
					}
					data:extend({new_icon})
				end
			end
		end
	end

end
