// hexshell.scad
// container with removable lids in a hex shape
// 22-Sep-2015

// measurements 
num_sides=6;// regular polygons with n sides
radius=50;// polygon radius, all internal dimensions flow from this
height=100; // the total height of the container
layer_height=0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP

// polycyln container, new approach
// revamp the hexshell design to make it 
// highly printable
// highly parametizable
// simpler openscad description 

// build the object
//capsule();
polycylinder();
translate([0,0,height])screw();
// outline modules we will use. 

// negative space.  remove from the center of the polycylinder.
// must derive shape from polycylinder inputs for parametrizability
module capsule(){
    translate([0,0,height/2+diameter/2])sphere(r=diameter/2,$fn=num_sides*10);
    translate([0,0,-height/2+diameter/2])sphere(r=diameter/2,$fn=num_sides*10);
    cylinder(r=apothem-thickness*5,h=height,$fn=num_sides*10);
}

// must fit between polycylinder and capsule 
// used twice:  removed from polycylinder and built alone
module screw(){
    linear_extrude(height,convexity=10,twist=0,slices=1,center=true)
    circle(r=apothem-thickness*2,$fn=num_sides*10);
    }


// the bounding object. split horizontally or both
module polycylinder(){
    cylinder(r=radius,h=height,$fn=num_sides);
}



