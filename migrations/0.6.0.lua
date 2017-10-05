for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-painted-concrete"].value then
		if tech["dect-concrete-paint"].researched then
			rec["hazard-concrete"].enabled = true
		end
	end
	if tech["optics"].researched then
		rec["dect-small-lamp-glow"].enabled = true
	end
				
end