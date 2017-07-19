for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if tech["concrete"].researched then
		rec["hazard-concrete"].enabled = true
	end
		
end