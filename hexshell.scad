// hexshell.scad
// container with removable lids in a hex shape
// 22-Sep-2015

// measurements 
num_sides=6;// regular polygons with n sides
radius=45;// polygon radius, all internal dimensions flow from this
layer_height=0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP
apothem = radius*cos(180/num_sides);
height=125; // the total height of the container
thickness=1;


// polycyln container, new approach
// revamp the hexshell design to make it 
// highly printable
// highly parametizable
// simpler openscad description 

// build the object
difference(){
  minkowski(){
  sphere(r=0.3,$fn=30);
  cylinder(r=radius,h=height,$fn=num_sides);
  }
  translate([0,0,height/4])screwshell();
  capsule();
}
//translate([150,175,0])screw(10,radius*3,screw_pitch,3);

// outline modules we will use. 

// negative space.  remove from the center of the polycylinder.
// must derive shape from polycylinder inputs for parametrizability
module capsule(){
    translate([0,0,height-(apothem-thickness*5)])sphere(r=apothem-thickness*5,$fn=num_sides*10);
    translate([0,0,apothem-thickness*5])sphere(r=apothem-thickness*5,$fn=num_sides*10);
    translate([0,0,height/4])cylinder(r=apothem-thickness*5,h=height-(apothem-thickness*5)*2,$fn=num_sides*10);
}

// all units in mm, please
// screw_pitches in the 10s and up are great.  cannot do 
// metal pitch stuff with FFF yet!
module screw(screw_height,screw_radius,screw_pitch,starts){
    linear_extrude( height= screw_height, convexity=10, twist= 
    screw_height/screw_pitch*360,slices=screw_height*10)
    circle(r= screw_radius, $fn= starts);
    }

module screwshell(){
  difference(){
    screw(height/2,apothem-thickness*1,150,6);
    screw(height/2,apothem-thickness*3,150,6);
  }
}
