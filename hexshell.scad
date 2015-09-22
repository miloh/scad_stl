// hexshell.scad
// container with removable lids in a hex shape
// 14-Feb-2015

// measurements 
num_sides=6;// a number between 3-12 
diameter=88;// outermost diameter, all internal dimensions flow from  his
height=153; // the total height of the container
layer_height=0.2; // possibly needed for screw calculations
tolerance = 0.6; // use standard value for slide fits with 3DP

// hexshell new approach
// trying to revamp the hexshell design to make it 
// highly printable
// highly parametizable
// simpler openscad 

// outline modules we will use. 

// negative spce.  remove from the center of the polycylinder.
// must derive shape from polycylinder inputs for parametrizability
capsule(num_sides,diameter,height){
}

// must fit between polycylinder and capsule 
// used twice:  removed from polycylinder and built alone
screw(num_sides,height){
}

// the bounding object. split horizontally or both
polycylinder(num_sides,diameter,height){
}



