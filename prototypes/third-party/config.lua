-- third-party/config

-- Alien Biomes
if mods["alien-biomes"] then
	-- Only supports blue water tiles
	DECT.CONFIG.BASE_WATER_TILES = {"water", "deepwater"}
	-- Remove the tile icons from signs
	table.insert(DECT.CONFIG.SIGN_BLACKLIST, "dect%-alien%-biomes")
end

-- Yuoki Industries
if mods["Yuoki"] or mods["yi_railway"] then
	-- Causes multiplayer desyncs when using icon sprites on signs
	log("Yuoki Industries detected, blacklisting sign icons.")
	local yuoki_blacklist = {"y_", "y%-", "ye_", "yi_", "yie_", "yir_", "z_yira_", "ypfw_"}
	for _, item in pairs(yuoki_blacklist) do
		table.insert(DECT.CONFIG.SIGN_BLACKLIST, item)
	end
end
