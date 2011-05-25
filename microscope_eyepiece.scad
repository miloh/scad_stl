// sat april 9 2011
// R M Alexander
// Eyepieces for microscopes

//*********  VARS  *****************************

eyepiece_shell_ratio 	=0.15;  // thickness of shell annulus/radius
eyepiece_od		=32;	//
eyepiece_height	=18;	
eyepiece_angle		= 10;  // for cap_height=2, this angle between 0 and ~15 degrees
cap_height		=2;
eyecap_diameter	=eyepiece_od*1.15;
granules			=90;	// var for $fn
//**** do not alter the var below...
eyepiece_id		=eyepiece_od*(1-eyepiece_shell_ratio);  	//

//********************  do the thing **********************

translate([eyepiece_od/1.5,0,0]) eyepiece(eyepiece_angle);
translate([-eyepiece_od/1.5,0,0]) eyepiece(eyepiece_angle);

//********************* modules STUFF*********************

module eyepiece(tiltangle){
	difference(){
	union(){
		difference(){
		 translate([0,0,0]) rotate([tiltangle,0,0]) cylinder(r=eyepiece_od/2, h= eyepiece_height, $fn=granules);
		 translate([0,0,0]) rotate([tiltangle,0,0]) cylinder(r=eyepiece_id/2, h= eyepiece_height, $fn=granules);
		}
	cylinder(r=eyecap_diameter/2, h=cap_height, $fn=granules);
	}
	#rotate([180,0,0]) cylinder(r=eyecap_diameter,h=eyepiece_height,center=false);
	}
}


