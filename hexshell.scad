// hexshell.scad
// hex shaped container with removable lids
// 22-Sep-2015
// revamp hexshell design to make it 
// easily printed and parametizable 

// todo:  fix the interaction between twist and slices in the screw module

// measurements 
thickness=1;
num_sides=6;// regular polygons with n sides
radius=25;// polygon radius, all internal dimensions flow from this
layer_height=0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP
apothem1 = radius * cos(180/num_sides);
apothem2 = apothem1 * cos(180/(num_sides*2));
height=60; // the total height of the container

// build the object
//difference(){
  //minkowski(){
  //sphere(r=0.3,$fn=30);
//  cylinder(r=radius,h=height,$fn=num_sides);
  //}
//
translate([0,0,thickness])screwshell(apothem1,height,thickness,240,num_sides*2);
//  capsule();
//}
// joining shell
//translate([0,0,0])this_screwshell(0.5,100,thickness);


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
 linear_extrude(height, convexity=10,twist = pitch,slices = height/0.2){
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
