// hexshell.scad
// hex shaped container with removable lids
// hex shell
// screw cavity
// capsule cavity
// 
// screw shell
//
// this design should allow all parts to be shell printed
//
// Revamp of an earlier hexshell design, making it 
// easily printed and parametizable 

// measurements 
thickness = 0.8; // the thickness of the screw 
spacing = 0.4; // additional spacing for the screw cavity
num_sides = 6;// regular polygons with n sides
radius = 25;// polygon radius, all internal dimensions flow from this
layer_height = 0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP
apothem1 = radius * cos(180/num_sides);
apothem2 = apothem1 * cos(180/(num_sides*2));
height=60; // the total height of the container

// build the casing object
// note minkowski is commented out because it distorts the measured dimension
difference(){
  //minkowski(){
  //  sphere(r=0.3,$fn=30);
    cylinder(r=radius,h=height,$fn=num_sides);
  //}
    translate([0,0,thickness/2])screwshell(apothem1-thickness,height,thickness+spacing,240,num_sides*2);
    capsule();
}
// build the joining shell
translate([radius*3,0,0])screwshell(apothem1-thickness,height,thickness,240,num_sides*2);

//
// modules
// all units in mm
//
// negative space.  remove from the center of the polycylinder.
// must derive shape from polycylinder inputs for parametrizability
module capsule(){
    translate([0,0,height-(apothem2)])sphere(r=apothem2-thickness,$fn=num_sides*10);
    translate([0,0,apothem2])sphere(r=apothem2-thickness,$fn=num_sides*10);
    translate([0,0,apothem2])cylinder(r=apothem2-thickness,h=height-(apothem2)*2,$fn=num_sides*10);
}

// screwshell created with thickness along radius centerline
module screwshell(radius,height,thickness,pitch,num_sides){
 linear_extrude(height-thickness, convexity=10,twist = pitch,slices = height/0.2){
  difference() {
    offset(r = thickness/2){
      circle(r=radius, center = true,$fn=num_sides);
    }
    offset(r = -thickness/2) {
      circle(r=radius, center = true,$fn=num_sides);
      }
    }
  } 
}
