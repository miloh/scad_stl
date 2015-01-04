//
// Refridgerator door load lock
//
//variables = values;
base_thickness = 2.5;
base_lip = 6.0;
base_lip_inset = 5.5;
base_width = 41.45;
base_extruded_height = 37.5;

loadlock_width = 57.5;
loadlock_length = 109.9; 
loadlock_extruded_height = 5.2;
loadlock_base_triangle_thickness = 5.2;
loadlock_triangle_base = base_extruded_height; 

// base_part
module base_part(){
// form a polygon outlining the 2d shape of the base.
// extrude this shape by the amount in base_extruded_height
translate([loadlock_triangle_base/2,base_thickness,base_extruded_height])rotate([0,90,0])linear_extrude(height=loadlock_base_triangle_thickness)polygon(points=[[0,0],[loadlock_triangle_base,0],[loadlock_triangle_base/2,22]]);
$fn=50;
minkowski(){
  linear_extrude(height=base_extruded_height)polygon(points=[ [0,0], [base_width,0], [base_width,base_lip], [base_width-base_thickness,base_lip], [base_width-base_thickness,base_thickness], [base_thickness*2,base_thickness], [base_thickness*2,base_lip_inset], [base_thickness,base_lip_inset], [base_thickness,base_thickness], [0,base_thickness] ]);
  cylinder(r=0.3,h=1);
  }
}
module loadlock_part(){
//create a 2d rect with loadlock_width and loadlock_length
//smoth the corners with a 2d minkowski
// extrude the output 2d shape by loadlock_extruded_height
// remove a notch in the shape of the joint for later assembly
difference(){
  minkowski(){
    linear_extrude(height=loadlock_extruded_height) circle(3);
    linear_extrude(height=loadlock_extruded_height) square([loadlock_width,loadlock_length]);
  }
  translate([loadlock_width/2-loadlock_base_triangle_thickness/2,-base_thickness-5,base_extruded_height/2+2*base_thickness])rotate([0,90,0])linear_extrude(height=loadlock_base_triangle_thickness)polygon(points=[[0,0],[loadlock_triangle_base,0],[loadlock_triangle_base/2,22]]);
  }
}
// call the parts and make decisions about orienting them w/r/t each other for printing or combination
union(){
translate([0,-10,0])rotate([90,0,0])base_part();
translate([0,0,0])loadlock_part();
}
