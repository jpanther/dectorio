-- entity/sign-icons

if DECT.ENABLED["signs"] then

	local categories = DECT.CONFIG.SIGN_CATEGORIES
	local blacklist = DECT.CONFIG.SIGN_BLACKLIST
	local whitelist = DECT.CONFIG.SIGN_WHITELIST

	for _, cat in pairs(categories) do
		if data.raw[cat] then
			for _, obj in pairs(data.raw[cat]) do
				local blacklisted = false
				for _, blacklisted_name_pattern in pairs(blacklist) do
					if obj.name:find(blacklisted_name_pattern) then
						for _, whitelisted_name in pairs(whitelist) do
							if obj.name ~= whitelisted_name then
								blacklisted = true
							end
						end
					end
				end
				if not blacklisted then
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
							order = cat,
							icons = {
								{
									icon = sprite.file,
									tint = sprite.tint
								}
							},
							icon_size = 32,
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

end
