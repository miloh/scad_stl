//
//
// 7segment display part to be built on makerbots.. a cheap part commonly available can still be rebuilt
// with unique size, material, and color, for interesting effect
//  
// r. miloh alexander,  may, 2011
//cc-sa
//


//Variables
7seg_size = 50;  	   // the controlling variable of this design, typically the largest variable
g_ratio	= 1.61803;  // the golden ratio
x_ratio	= 0.8;		//multiplier tacked onto the generation of the inner occlusion square
led_size	= 5;              // for sizing parts to fit different leds 
surface_thickness=1.4;	//2 z layers is ~0.8 and its kind of cool but generally too thin w/o extra diffusion
inside_height=8;	// total extrusion height
box_height=10;
wall_size 	= 2.7;		//  parmetizing the 7seg to keep wall size from increasing with arbitrary 7seg sizes
outside_wall_modifier  = 1.05;	 	// offset to fix problems...
led_socket_ratio	= 2.3;  // led sockets


// some arrays
base_array = [7seg_size/g_ratio,7seg_size/2];   // used to create a section of 3.5 segments for a 7seg
wall_array 	= [wall_size,wall_size]; 			// used to determine wall size


//-------------------------------------------------------
// call up the part
//-------------------------------------------------------

// comment the following line out if you just want the enclosure
seven_segments();
//comment the following out if you just want the internals light barrier
translate([0,7seg_size/4,0]) seven_segments_box();




//-------------------------------------------------------
//
//
// modules 
//
//--------------------------------------------------------

module seven_segments_box(){
  translate([0,0,surface_thickness/2])  cube([7seg_size/g_ratio,7seg_size,surface_thickness],center=true);
   linear_extrude(height=box_height)enclosure();
}

// this module builds the outside of the 7segment part
module enclosure(){
  	difference(){
		square([7seg_size/g_ratio,7seg_size]*outside_wall_modifier, center=true);
		square([7seg_size/g_ratio,7seg_size]-wall_array,center=true);
		}
}

// this module extrudes the 2D layout modules below
module seven_segments(){
linear_extrude (height=inside_height)seven_segments_flat();		
}

// this module duplicates the top_segments module to make the complete 2D layout of the inner part of a 7seg
module seven_segments_flat(){	
	top_segments();
	translate([0,7seg_size/2])top_segments();
}

// this module creates the 2D X shaped layout with inner square
module top_segments(){	
	square((base_array/g_ratio)*x_ratio,center=true);	  // change this to a polygon with cutouts for leds...
	hype =sqrt (pow((7seg_size/(2*g_ratio)),2) + pow((7seg_size)/4,2));
	bar =2* (hype);
	angle= 2.25*atan(1/(2*g_ratio));
	rotate(angle)square([bar,wall_size],center=true);
	rotate(-angle)square([bar,wall_size],center=true);
echo (str(angle));
}


module  led_socket(){
	difference(){
	cylinder(h =  led_size,r1=led_size/2*led_socket_ratio, r2=led_size/2,$fa=1,$fs=0.2);
	translate([0,0,0]) cylinder(h = led_size, r=led_size/2,$fa=1,$fs=0.2);
	}
}
