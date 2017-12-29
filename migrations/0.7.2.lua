for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-decoratives"].value then
		if tech["plastics"].researched then
			rec["dect-traffic-bollard"].enabled = true
		end
	end
end
