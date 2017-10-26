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
	if settings.startup["dectorio-landscaping"].value then
		if tech["dect-landscaping"].researched then
			rec["dect-base-stone-rock"].enabled = true
			rec["dect-base-red-desert-rock-big-01"].enabled = true
			rec["dect-base-red-desert-rock-huge-01"].enabled = true
			rec["dect-base-red-desert-rock-huge-02"].enabled = true
		end
	end
end