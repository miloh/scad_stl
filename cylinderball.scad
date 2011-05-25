
wireshelf_bracket();


module wireshelf_bracket()
{


translate([0,0,0]) cylinder(4,42,42, $fa=5, $fs=0.1);  // bottom cylinder
translate([0,0,4+5]) cylinder(4,42,42, $fa=5, $fs=0.1);  // top cylinder, offset 4 plus spacing of 5mm


translate([0,0-2.5,9]) rotate([90,0,0]) cylinder(4,42,42, $fa=5, $fs=0.1);  //  Y side cylinder 1
translate([0,4+2.5,9]) rotate([90,0,0]) cylinder(4,42,42, $fa=5, $fs=0.1);  //  Y side cylinder 2



translate([-5-2.5,0,9]) rotate([0,90,0]) cylinder(5,42,42,$fa=5, $fs=0.1);  // X side cylinder 1
translate([0+2.5,0,9]) rotate([0,90,0]) cylinder(5,42,42, $fa=5, $fs=0.1);  // X side cylinder 2



// add a rectangle in to make the center solid 
// this can be done as the intersection of the 4 cylinders....
// or as a couple of rectangles that get translated


//rectangles that get tranlated to fill in btwn intersections

translate([-2.5,-42,4]) cube([5,84,5]);          // Y axis filler rod
translate([-42,-2.5,4])  cube([84,5,5]);       // X axis filler rod  (shift up by height of Cylinder)
translate([-2.5,-2.5,-33])  cube([5,5,84]);  // Z axis filler rod

}

