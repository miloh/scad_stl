// polyshells_bolts.scad by r. miloh
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
// build the casing object
// note minkowski is commented out because it distorts the measured dimension
difference(){
    translate([0,0,0]) smooth_polycylinder(height,radius,0.8,num_sides);
    translate([0,0,height*0.05]) screwshell(apothem(radius,num_sides) - thickness, height * 0.9  , thickness, 240, num_sides * 2);
    translate([0,0,1.1]) capsule(apothem(apothem(radius,num_sides) - thickness ,num_sides*2) - thickness ,height-2.2 ,num_sides * 20);
}
// build joining screwshell
// should build this screwshell seperatly from the rest as splitting the
// overall stl file will result in seperation of the aligned interior structure
// note that changing the height will change the pitch...  shorten it some other way.
translate([radius*3,0,0])screwshell(apothem(radius,num_sides) - thickness , height * 0.9, thickness/2 , 240, num_sides * 2);
//

// complete construction
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
