//  Oct 2013, by miloh
// build up module for magnetic clutch for flip display aka solari display
// unfinished -- but a good idea!

// SOME VARS

radius = 50;                     // was 22
height = 75;                    //  height of the cube, was 28
diameter = radius*2;
filler_rod = 15;  
spacing = 1;  
pad = 0.1;

//  magnetic clutch part!

primary_rotor(){
}
secondary_rotor(){
}

//**********************************
// MODULES
//***********************************

module primary_rotor(){
difference(){
cylinder(h=height,r=2*radius,$fa=5, $fs=0.1);
cylinder(h=height,r=2*radius,$fa=5, $fs=0.1);
}
}



module secondary_rotor(){
difference(){
cylinder(h=height+wall*2+spacing,r=2*radius,$fa=5, $fs=0.1);
cylinder(h=height+wall*2+spacing,r=2*radius,$fa=5, $fs=0.1);
}
}


module cylinder_fillet(){
difference(){
cylinder(h=height+wall*2+spacing,r=2*radius,$fa=5, $fs=0.1);
cylinder(h=height+wall*2+spacing, r=radius,$fa=5, $fs=0.1);
}
}

