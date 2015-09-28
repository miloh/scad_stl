// shellbolts.scad by r. miloh
// polygon bolts with screwtop lids 
// this design should allow all parts to be shell printed
// Revamp of an earlier hexshell design, making it 
// easily printed and parametizable 

// todo: implement output of cross section, projections, and stls based on
// templating input (with python?) or command line inputs and make

// measurements 
$fn = 30;  // a good starting value
nozzle_width = 0.4; // nominal nozzle width
perimeters = 4; // number of perimeters for slicing
thickness = nozzle_width * perimeters; // a perimeter thickness, often some integer multiple of nozzle_width
num_sides = 6;// regular polygons with n sides
radius = 44.5;// polygon radius, all internal dimensions flow from this
layer_height = 0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP
function apothem(radius,num_sides) =  radius * cos(180/num_sides);
echo("Radius is ", radius, "For a ", num_sides, " sided polygon, the Apothem is ", apothem(radius,num_sides));
height=175; // the total height of the container
//
// shellbolt for tuco the cat, export seperate stls or together with translated polyscrew 
// bolt head
difference(){
  smooth_polycylinder(10,6,5.8,6);    
  translate([0,0,2])screwshell(apothem(10,6)-0.7,22,1,240,12);
 translate([0,0,2.4])capsule(apothem(apothem(10,6)-1.6,12),25,60);
}    
// bolt shell
translate([0,0,0]) polyscrew(apothem(10,6)-0.7,22 ,240, 12, 0.2);

// modules
// all units in mm
//
// smooth_polycylinder is a nicer yet dimensionally accurate polycylinder extruded from the minkowski
// sum of the n sided polygon
// *  has a dimensioning bug (outside of bounds)for large values of fillet
module smooth_polycylinder(radius,height,fillet_radius,num_sides){
    linear_extrude(height,twist=0,slices=1){
      minkowski(){
      circle(r=fillet_radius,$fn=80);
      circle(r=radius-fillet_radius,$fn=num_sides);
      }
    }
}

// creates a capsule of height and radius as smooth as you would like,
// used in this scad as negative space
module capsule(radius,height,smoothness){
    hull(){
      translate([0,0,height-radius])sphere(r=radius,$fn=smoothness);
      translate([0,0,radius])sphere(r=radius,$fn=smoothness);
    }
}

// screwshell created with thickness along radius centerline
module screwshell(radius,height,thickness,pitch,num_sides){
 linear_extrude(height, convexity=10,twist = pitch, slices = height/0.2){
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
// polyscrew for priting shells with vase settings
module polyscrew(radius,height,pitch,num_sides,layer_height){
    num_slices = height/ layer_height;
    linear_extrude(height,convexity=10,twist=pitch,slices=height/layer_height){
      circle(r=radius, center = true,$fn=num_sides);
       }
   }
