for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-landscaping"].value then
		if tech["dect-landscaping"].researched and data.raw["tree"]["coral-lava-01"] then
			alien_biomes = {
				"grass-red","grass-orange","grass-yellow","grass-yellow-fade","grass-dry","grass-medium","grass","grass-blue-fade","grass-blue","grass-purple-fade","grass-purple",
				"dirt-red","dirt-brown","dirt-tan","dirt","dirt-dull","dirt-grey","dirt-red-dark","dirt-brown-dark","dirt-tan-dark","dirt-dark","dirt-dull-dark","dirt-grey-dark",
				"sand-red","sand-orange","sand-gold","sand","sand-dull","sand-grey","sand-red-dark","sand-orange-dark","sand-gold-dark","sand-dark","sand-dull-dark","sand-grey-dark",
				"snow","volcanic-cool","volcanic-medium","volcanic-hot"
			}
			for _, tile in pairs(alien_biomes) do
				rec["dect-alien-biomes-"..tile].enabled = true
			end
		end
	end
end