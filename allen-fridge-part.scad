// Al's Fridge part.
// fixing a handle


// Measurements derived from a sample part in hand

$fn = 20;
// all measurements in mm
width = 21.5;
length = 45.0;
interior_length = 33.3;
hole = 4;

module half_shape(){
  linear_extrude(height=10)rotate([0,0,90])
  polygon (
    points = [[0,0],[0,21.5/2.0],[10,24/2.0],[10,21.5/2.0],[43.3,21.5/2],[43.3,0]],
    convexity = 10
  );
}

difference(){
union(){
half_shape();
mirror()half_shape();
}
rotate([0,0,90])translate([16,0,-25/2]) cylinder(h=25,r=hole/2);
rotate([0,0,90])translate([16,0,-1]) cylinder(h=2.1,r=hole+2/2);
translate([0,0,1])scale([0.9,0.9,1])union(){
half_shape();
mirror()half_shape();
}
}


