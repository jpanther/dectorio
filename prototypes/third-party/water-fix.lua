-- third-party/water-fix

-- Attempt to detect water-fix
if data.raw.item.concrete then
	if data.raw.tile.water.allowed_neighbors == nil and data.raw.tile.water.needs_correction == false and data.raw.item.concrete.place_as_tile.condition_size == 1 then

		-- Apply smaller condition size to all tiles
		for _, item in pairs(data.raw.item) do
			if item.name ~= "landfill" and item.place_as_tile then
				item.place_as_tile.condition_size = 1
			end
		end

	end
end
