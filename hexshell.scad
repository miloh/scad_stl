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
$fn = 30;  // a good starting value
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
    translate([0,0,0])smooth_polycylinder(height,radius,0.3,6);
    translate([0,0,thickness/2])screwshell(apothem1-thickness,height,thickness+spacing,240,num_sides*2);
    capsule(apothem2-thickness,height,num_sides*20);
}
// build the joining shell
translate([radius*3,0,0])screwshell(apothem1-thickness,height,thickness,240,num_sides*2);
translate([-100,-100,0])capsule(apothem2-thickness,height,num_sides*20);
//
// modules
// all units in mm
//
// smooth_polycylinder is a nicer yet dimensionally accurate polycylinder extruded from the minkowski 
// sum of the n sided polygon 
// this still has a dimensioning bug (outside of bounds)for large values of fillet
// bug can be fixed by using the radius of the incircle.. :-(
// or it can be massaged by using a smaller radius measurement
module smooth_polycylinder(height,radius,fillet_radius,num_sides){
    linear_extrude(height,twist=0,slices=1){
      minkowski(){
      circle(r=fillet_radius,$fn=80);
      circle(r=radius-fillet_radius,$fn=num_sides);
      }
    }
}

// negative space.  remove from the center of the polycylinder.
// must derive shape from polycylinder radius inputs for parametrizability
module capsule(radius,height,smoothness){
    translate([0,0,height-radius])sphere(r=radius,$fn=smoothness);
    translate([0,0,radius])sphere(r=radius,$fn=smoothness);
    translate([0,0,radius])cylinder(r=radius,h=height-radius*2,$fn=smoothness);
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
