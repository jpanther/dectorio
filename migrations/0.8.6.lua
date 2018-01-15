for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-waterfill"].value then
		if tech["landfill"].researched then
			rec["dect-base-water"].enabled = true
			rec["dect-base-water-green"].enabled = true
			rec["dect-base-deepwater"].enabled = true
			rec["dect-base-deepwater-green"].enabled = true
		end
	end
end
