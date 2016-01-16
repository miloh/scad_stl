// Al's Fridge part.
// fixing a handle


// Measurements derived from a sample part in hand

$fn = 20;
// all measurements in mm
part_width = 21.5;
part_length = 45.0;
part_height = 5;
interior_length = 33.3;
hole = 4;
part_thickness = 2;


module trappyzoid(){
linear_extrude(height=6){
polygon (points=
 [[0,0],
 [-2,0],
 [0,-10],
 [part_width,-10],
 [part_width+2,0],
 [part_width,0],
 ],convexity=10);
}
}
difference(){
  union(){
    difference(){
    trappyzoid();
    scale([0.85,0.80,1])translate([1.8,-1.5,1.5])trappyzoid();
    }
    //base
    cube([part_width,part_length,part_thickness]);
    // walls 
    cube([part_thickness,part_length,part_height]);
    cube([part_width,part_thickness,part_height]);
    translate([part_width-part_thickness,0,0])cube([part_thickness,part_length,part_height]);
    translate([0,part_length-part_thickness,0])cube([part_width,part_thickness,part_height]);
    translate([part_width/2,10,part_thickness])cylinder(h=3,r=12/2);
  }
  union(){
translate([part_width/2,10,-10])cylinder(h=25,r=4/2);
translate([part_width/2,10,-0.1])cylinder(h=1,r=7/2);
  }
}
