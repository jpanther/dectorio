for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if tech["dect-concrete-paint"].researched then
		rec["hazard-concrete"].enabled = true
	end
	if tech["optics"].researched then
		rec["dect-small-lamp-glow"].enabled = true
	end
				
end