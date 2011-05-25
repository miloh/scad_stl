//  Feb 2011, by ftoad  cc-na
// build up module for bracket..

// SOME VARS

radius = 20;                     // was 22
height = 25;                    //  height of the cube, was 28
diameter = radius*2;
wall = 2.6;                          // was 4
filler_rod = 7;  
spacing = 4.9;  
pad = 0.1;
support =  radius - wall -spacing/2; // a portion of the X or Y exposed length along the parallel cubes 

// OB'ECT D'ART



translate([radius+pad*5,radius+pad*5,0]) wireshelf_bracket();

translate([radius+pad*5,-radius-pad*5,0]) wireshelf_bracket();

translate([-radius-pad*5,radius+pad*5,0]) wireshelf_bracket();

translate([-radius-pad*5,-radius-pad*5,0]) wireshelf_bracket();


//**********************************
// MODULES
//***********************************


// todo: this module must be modified with better translate() and correct amount of $pad to eliminate the upper level folding error in Z layers.. this is hard to describe -- the z layer folds inwards a bit where it should be making smooth curves from wall to wall..
module interiorcorner_fillet(){
translate([-support/2,0,0]) cube([1.5*support,1.5*support,height-wall-spacing]); 
translate([0,-support/2,0]) cube([1.5*support,1.5*support,height-wall-spacing]); 

translate([0,0,0]) cylinder(r1=support/2,r2=support/2, h=height-wall-spacing, $fn=100);  // test $fn=100
//translate([0,0,0]) cylinder(r1=support/2,r2=support/2, h=height-wall-spacing, $fa=5, $fs=0.1);   // rtoggle comment with above to test
}


module cylinder_fillet(){
difference(){
cylinder(h=height+wall*2+spacing,r=2*radius,$fa=5, $fs=0.1);
cylinder(h=height+wall*2+spacing, r=radius,$fa=5, $fs=0.1);
}
}


module top_cylinder_pruning(){
rotate([0,0,0]) translate([-spacing/2,-radius,spacing+wall]) cube([spacing,support,wall]);          // Y axis cylinder removal rod
rotate([0,0,90]) translate([-spacing/2,-radius,spacing+wall]) cube([spacing,support,wall]);          // x axis cylinder removal rod
rotate([0,0,180]) translate([-spacing/2,-radius,spacing+wall]) cube([spacing,support,wall]);          // y axis cylinder removal rod
rotate([0,0,270]) translate([-spacing/2,-radius,spacing+wall]) cube([spacing,support,wall]);          // x axis cylinder removal rod
}


module partial_bracket()
{

translate([0,0,0]) cylinder(h=wall,r=radius, $fa=5, $fs=0.1);  // bottom cylinder

//cutting down the upper cylinder thickness at crucial points
difference(){
translate([0,0,wall+spacing]) cylinder(h=wall,r=radius, $fa=5, $fs=0.1);  // top cylinder
top_cylinder_pruning();
}

translate([-radius,(spacing/2),wall+spacing]) cube([diameter,wall,height-spacing]); 		// X axis rect wall
translate([-radius,-wall-spacing/2,wall+spacing]) cube([diameter,wall,height-spacing]);	// X axis rect wall


rotate([0,0,90]) translate([-radius,(spacing/2),wall+spacing]) cube([diameter,wall,height-spacing]);  		// Y axis rect wall
rotate([0,0,90]) translate([-radius,-wall-spacing/2,wall+spacing]) cube([diameter,wall,height-spacing]);	// Y axis rect wall


translate([-filler_rod/2,-radius,wall]) cube([filler_rod,diameter,spacing]);          // Y axis filler rod
translate([-radius,-filler_rod/2,wall])  cube([diameter,filler_rod,spacing]);       // X axis filler rod  (shift up by height of Cylinder)

// translate([-2.5,-2.5,-33])  cube([5,5,84]);  // Z axis filler rod

//center support 
difference(){
	translate ([-2.5,-2.5,0]) cube([5+pad,5+pad,height+wall]);
	translate([0,0,4]) cylinder(r=2.49, h=height+wall ,$fa=5,$fs=0.2);
}



// fillet the  4wall sides for support wall1
difference(){
	translate([wall+spacing/2,wall+spacing/2,wall*2+spacing]) cube([ support+pad,support+pad,height-wall-spacing]);  // strengthen the upper walls
	rotate([0,0,0]) translate([support/2+wall+spacing/2,support/2+wall+spacing/2,2*wall+spacing]) interiorcorner_fillet();

}

// fillet the  4wall sides for support wall2
difference(){
	translate([-radius,wall+spacing/2,wall*2+spacing]) cube([ support+pad,support+pad,height-wall-spacing]);  // strengthen the upper walls
	rotate([0,0,90]) translate([support/2+wall+spacing/2,support/2+wall+spacing/2,2*wall+spacing]) interiorcorner_fillet();
}

// fillet the  4wall sides for support wall3
difference(){
	translate([-radius,-radius,wall*2+spacing]) cube([ support+pad,support+pad,height-wall-spacing]);  // strengthen the upper walls
	rotate([0,0,180]) translate([support/2+wall+spacing/2,support/2+wall+spacing/2,2*wall+spacing]) interiorcorner_fillet();
}

// fillet the  4wall sides for support wall4
difference(){
	translate([wall+spacing/2,-radius,wall*2+spacing]) cube([ support+pad,support+pad ,height-wall-spacing]); //strengthen the upper walls
	rotate([0,0,270]) translate([support/2+wall+spacing/2,support/2+wall+spacing/2,2*wall+spacing]) interiorcorner_fillet();
}

}

module wireshelf_bracket(){
	difference(){
		partial_bracket();
		cylinder_fillet([0,0,40]);
	}
}
