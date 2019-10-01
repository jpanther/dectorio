-- third-party/industrial-revolution

if mods["IndustrialRevolution"] then

	-- if Industrial Revolution is present we need to make sure all the tile variants are put on the same layers as IR's
	local tile_layer = {
		gravel = data.raw.tile["stone-gravel"].layer or 60,
		stone = data.raw.tile["stone-path"].layer or 61,
		concrete = data.raw.tile["concrete"].layer or 62,
		paint = data.raw.tile["hazard-concrete-left"].layer or 63,
		-- 64 transition layer
		refined = data.raw.tile["refined-concrete"].layer or 65,
		refined_paint = data.raw.tile["refined-hazard-concrete-left"].layer or 66,
		-- 67 transition layer
		grid = (data.raw.tile["refined-hazard-concrete-left"].layer + 2) or 68,
		wood = (data.raw.tile["refined-hazard-concrete-left"].layer + 3) or 69,
	}

	if DECT.ENABLED["wood-floor"] then
		data.raw.tile["dect-wood-floor"].layer = tile_layer.wood
	end

	if DECT.ENABLED["concrete"] then
		data.raw.tile["dect-concrete-grid"].layer = tile_layer.grid
	end

	if DECT.ENABLED["gravel"] then
		-- Dectorio gravel tiles are disabled in IR but this is included for consistency
		for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
			data.raw.tile["dect-"..variant.name.."-gravel"].layer = tile_layer.gravel
		end

		data.raw["tile"]["stone-path"].layer = tile_layer.stone
	end

	if DECT.ENABLED["painted-concrete"] then
		local directions = {
			{this="left", next="right"},
			{this="right", next="left"}
		}
		for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
			for _, direction in pairs(directions) do
				data.raw["tile"]["dect-paint-"..variant.name.."-"..direction.this].layer = tile_layer.paint
				data.raw["tile"]["dect-paint-refined-"..variant.name.."-"..direction.this].layer = tile_layer.refined_paint
			end
		end
	end

end
