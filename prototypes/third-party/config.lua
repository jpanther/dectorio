-- third-party/config

-- Configuration overrides for supporting various third-party mods

-- ALIEN BIOMES
-- ---------------------------------
if mods["alien-biomes"] then
	-- Only supports blue water tiles
	DECT.CONFIG.BASE_TILES = {}
	DECT.CONFIG.BASE_WATER_TILES = {"water", "deepwater"}
	DECT.CONFIG.BASE_ROCKS = {}
	DECT.CONFIG.BASE_TREES = {}
	-- Remove the tile icons from signs
	table.insert(DECT.CONFIG.SIGN_BLACKLIST, "dect%-alien%-biomes")
end

-- FACTORISSIMO 2
-- ---------------------------------
if mods["Factorissimo2"] then
	-- Reduces some sign icon repetition
	log("Factorissimo 2 detected, blacklisting sign icons.")
	local f2_blacklist = {"factory%-1%-", "factory%-2%-", "factory%-3%-"}
	for _, item in pairs(f2_blacklist) do
		table.insert(DECT.CONFIG.SIGN_BLACKLIST, item)
	end
end

-- YUOKI INDUSTRIES
-- ---------------------------------
if mods["Yuoki"] or mods["yi_railway"] then
	-- Causes multiplayer desyncs when using icon sprites on signs
	log("Yuoki Industries detected, blacklisting sign icons.")
	local yuoki_blacklist = {"y_", "y%-", "ye_", "yi_", "yie_", "yir_", "z_yira_", "ypfw_"}
	for _, item in pairs(yuoki_blacklist) do
		table.insert(DECT.CONFIG.SIGN_BLACKLIST, item)
	end
end

-- ARBORIUM
-- ---------------------------------
if mods["Arborium"] then
	-- Disable tree crafting (as Arborium handles this)
	DECT.CONFIG.BASE_TREES = {}
end

-- KS POWER
-- ---------------------------------
if mods["KS_Power"] then
	-- Add signal support for Diesel fuel fluid
	table.insert(DECT.CONFIG.SIGNALS, {type="fluid", name="diesel-fuel", color={r=0.70,g=0.70,b=0.00,a=0.68}})
end
