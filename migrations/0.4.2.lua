for k,force in pairs(game.forces) do
 	force.recipes["stone-wall"].enabled = force.technologies["stone-walls"].researched
end