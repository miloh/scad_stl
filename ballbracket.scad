// making a bracket which consists of a complete cylinder sandwich and a orthogonal 4mm tall half cylinder sandwich with various reinforcements
// two cylinders with 5mm spacing, 4 rounded rectangles with heighth = radius,  length = diameter and radius, 4mm width
// 


pad = 0.1;        	// padding to maintain manifold
wall_width = 4;         // height of cylinders
diameter = 84;  //  
radius = 84/2; 
spacing = 5;






// difference(){
wireshelf_ball();
// translate([-42,-42,-51.9]) cube([85,85,52.1]);
//}

// here <----  add noisebridge relief logo to the base and make watertight

module wireshelf_ball()
{

translate([0,0,0]) cylinder(wall_width,42,42, $fa=5, $fs=0.1);  // bottom cylinder
translate([0,0,wall_width+spacing]) cylinder(wall_width,42,42, $fa=5, $fs=0.1);  // top cylinder, offset 4 plus spacing of 5mm


translate([0,0-2.5,9]) rotate([90,0,0]) cylinder(wall_width,42,42, $fa=5, $fs=0.1);  //  Y side rectangle 1
translate([0,wall_width+2.5,9]) rotate([90,0,0]) cylinder(wall_width,42,42, $fa=5, $fs=0.1);  //  Y side cylinder 2



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

