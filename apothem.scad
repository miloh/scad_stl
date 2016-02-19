// Constructing polygons with the 'circle' command and $fn set to 'N' number of
// sides is common quick construction technique in openscad. 
//
// apothem is the distance from the center of a regular N gon to a midpoint of a side
//
// Calculate the apothem given the radius and a specific N-gon (this approaches
// the radius as N-->infinity   
function apothem(radius,num_sides) =  radius * cos(180/num_sides);
//
// Calculate the radius given an apothem and a specific N-gon 
// validate that num_sides is an integer >= 3
function radius_from_apothem(apothem,num_sides) = apothem / cos(180/num_sides);

