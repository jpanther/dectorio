-- entity/sign-icons

if DECT.ENABLED["signs"] then

	local categories = {"item", "fluid", "tool", "ammo", "armor", "capsule", "gun", "mining-tool", "module"}
	local blacklist = {"barrel", "loader", "simple%-entity", "player%-port", "computer", "coin", "small%-plane", "railgun", "vehicle%-machine%-gun", "tank%-machine%-gun", "factory%-1%-", "factory%-2%-", "factory%-3%-", "signpost", "dect%-signal%-", "infinity%-chest", "infinity%-pipe", "heat%-interface", "pollution", "escape%-pod%-power", "dummy%-steel%-axe"}

	for _, cat in pairs(categories) do
		if data.raw[cat] then
			for _, obj in pairs(data.raw[cat]) do
				local blacklisted = false
				for _, blacklisted_name in pairs(blacklist) do
					if obj.name:find(blacklisted_name) then
						blacklisted = true
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
