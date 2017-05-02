for k,force in pairs(game.forces) do
 	force.recipes["paint-radiation"].enabled = force.technologies["concrete-paint"].researched
end