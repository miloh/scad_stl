include <shellbolts.scad>
// measurements 
$fn = 30;  // a good starting value for facets number
nozzle_width = 0.4; // nominal nozzle width
perimeters = 4; // number of perimeters for slicing
thickness = nozzle_width * perimeters; // a perimeter thickness, often some integer multiple of nozzle_width
layer_height = 0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP
boltHead_height = 6; // the total height of the container
boltHead_radius = 10;
bolt_sides = 6; // sides of the bold
screw_sides = 12; // starts for the screw
bolt_height = 22;
screw_twist = 240; // degrees
//
// shellbolt for tuco the cat, export seperate stls or together with translated polyscrew 
//
// bolt head
difference(){
  filleted_polycylinder(boltHead_radius, boltHead_height,5.8, bolt_sides);
  translate([0,0,2])screwshell(apothem(boltHead_radius,bolt_sides)-nozzle_width*2, bolt_height, thickness, screw_twist, screw_sides, layer_height);
  translate([0,0,2.5])capsule(apothem(apothem(boltHead_radius,bolt_sides)-nozzle_width*4, screw_sides*2), bolt_height, $fn);
}    
// bolt shell
translate([boltHead_radius*2,0,0])
polyscrew(apothem(boltHead_radius,bolt_sides)-nozzle_width*2, bolt_height,screw_twist, screw_sides, layer_height);
