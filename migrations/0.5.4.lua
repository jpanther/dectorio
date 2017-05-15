for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-walls"].value then
		if tech["dect-advanced-walls"].researched then
			rec["dect-chain-wall"].enabled = true
		end
	end
		
end