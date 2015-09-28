//shellbolts.scad by r. miloh 
//a few modules for making polygon bolts with screwtop lids this design allows
//all parts to be quickly printed as shells Revamp of an earlier hexshell design,
//making it   easily printed and parametizable 

// todo: implement output of cross section, projections, and stls based on
// templating input (with python?) or command line inputs and make
//
// Modules:
//
// filleted_polycylinder:  a nicer yet dimensionally accurate polycylinder extruded from the minkowski
// sum of the n sided polygon
// *  has a dimensioning bug (outside of bounds)for large values of fillet
module filleted_polycylinder(radius,height,fillet_radius,num_sides){
    linear_extrude(height,twist=0,slices=1){
      minkowski(){
      circle(r=fillet_radius,$fn=80);
      circle(r=radius-fillet_radius,$fn=num_sides);
      }
    }
}
// creates a capsule of height and radius as smooth as you would like,
// used in shell bolts as negative space
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
