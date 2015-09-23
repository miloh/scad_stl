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
apothem1 = radius*cos(180/num_sides);
apothem2 = (radius-thickness*1.6)*cos(180/num_sides);
height=60; // the total height of the container

// build the object
difference(){
  //minkowski(){
  //sphere(r=0.3,$fn=30);
  cylinder(r=radius,h=height,$fn=num_sides);
  //}
  translate([0,0,thickness])this_screwshell(0.1,1.3,thickness);
  capsule();
}


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

// screw_pitches (mm/revolution) in the 10s and up are great.  cannot do 
// metal pitch stuff with FFF yet!
module screw(screw_height,screw_radius,screw_pitch,starts){
    linear_extrude( height= screw_height, convexity=10, twist= 
    screw_height/screw_pitch*360,slices=screw_height*10)
    circle(r= screw_radius, $fn= starts);
    }

module this_screwshell(screwshell_offset1,screwshell_offset2,thickness){
  difference(){
    screw(height/1.1, apothem1 - thickness * screwshell_offset1 , 60, 12);
    translate([0,0,0])screw(height, apothem1 - thickness *
    screwshell_offset2 , 60, 12);
  }
}
