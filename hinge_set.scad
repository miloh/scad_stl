// TOILET SEAT HINGES FOR NOISEBRIDGE 
// hinge_cap part
// by ftoad, 03/15/2011
// CC-TA / toilet-seat alike

// TOILET SEAT HINGES FOR NOISEBRIDGE
// by ftoad, 03/15/2011
// hinge_pin part
// CC-SA / toilet-seat alike



//************hinge_cap_Variables**********************************************************


hinge_cap_points =[ [0,0], [52,0],[76,9],[63,24],[58,15],[57,10],[5,10],[0,0] ];  // turn this into the appropriate variable type
hinge_cap_path = [0,1,2,3,4,5,6] ;
hinge_cap_od = 19;
hinge_cap_id = 11.5;
centerX1 = 68;   //X center of hinge pivot
centerY1 = 17;   // Y center of hinge pivot
screwhole_cs  = 7.5;   //diameter of countersink screwholes
screwhole_shank = 4;   // diamter of screwhole shank
hinge_cap_width=16;  //used as height for a linear_extrude
hinge_cap_hole_depth=12;
offset =0.05;

//************hinge_pin_Variables**********************************************************


hinge_pin_points =[ [0,0], [50.5,0],[55,3.5],[55,10],[44,10],[-6,10] ];  // turn this into the appropriate variable type
hinge_pin_path = [0,1,2,3,4,5] ;
hinge_pin_od = 17;
hinge_pin_id = 11.3;
hinge_pin_length = 23;
centerX2 = 52.5;   //X center of hinge pivot
centerY2 = 20;   // Y center of hinge pivot
// referenced above screwhole_cs  = 7.5;   //diameter of countersink screwholes
// referenced above screwhole_shank = 4;   // diamter of screwhole shank
hinge_pin_width=16;  //used as height for a linear_extrude
offset =0.05;


//**************************************************************************


module screwless_hinge_cap(){

	module hingecap_baseplan(){
	polygon(points = [ [0,0], [52,0],[73,9],[63,24],[58,15],[53,10],[5,10],[0,0] ] , paths =[ [0,1,2,3,4,5,6] ], convexity = N);
	translate ([centerX1,centerY1,0]) circle (r=hinge_cap_od/2, center=true);
	}
	
	// note that translate() ops precede linear_extrude() otherwise they are SQUASHED to null!!!
	module hingecap_holeremove(){
	translate( [centerX1 , centerY1,hinge_cap_width-hinge_cap_hole_depth]) linear_extrude(height=hinge_cap_hole_depth,$fa=1,$fs=0.2)  circle(r=hinge_cap_id/2);
	}
	
	difference(){
	linear_extrude(height=hinge_cap_width) hingecap_baseplan();
	hingecap_holeremove();
	}

}

module hingecap(){
// BUILD !  run a difference of the hinge less the modulized screwholes
difference(){
rotate([90,0,0])screwless_hinge_cap();
screwhole(12,-hinge_cap_width/2,0,0);
screwhole(35,-hinge_cap_width/2,0,0);
}
}

module screwhole(a,b,c,part){
// part == 0 for cap
if ( part == 0) {
 translate ([a,b,0]) cylinder(r=screwhole_shank/2, h=5+offset,$fa=5,$fs=0.2);
 translate([a,b,5]) cylinder(r=screwhole_cs/2,h=5+offset,$fa=5,$fs=0.2);
 }
//  part == 1 for pin
if (part == 1){
  // the shank/shaft on hinge_pin models are switched wrt to the hinge_cap model
 translate ([a,b,5]) cylinder(r=screwhole_shank/2, h=5+offset,$fa=5,$fs=0.2); 
 translate([a,b,0]) cylinder(r=screwhole_cs/2,h=5+offset,$fa=5,$fs=0.2);
 }
}


// 



// CAP MODULES FOLLOWS 
module screwless_hinge_pin(){
	module hingepin_baseplan(){
		polygon(points= [ [0,0], [50.5,0],[55,3.5],[55,10],[55,20],[44,20],[44,10],[-6,10] ], paths = [[0,1,2,3,4,5,6,7]],convexity=N);
		translate([centerX2,centerY2,0])  circle (r=hinge_pin_od/2,center=true);
	}
	
	// note that translate() ops precede linear_extrude() otherwise they are SQUASHED to null!!!
	module hingepin(){
		translate( [centerX2 , centerY2,hinge_pin_width]) linear_extrude(height=hinge_pin_length,$fa=1,$fs=0.2)  circle(r=hinge_pin_id/2,center=false);
	}
	
	
	linear_extrude(height=hinge_pin_width) hingepin_baseplan();
	hingepin();
}


module hingepin(){
// BUILD!  run a difference of the hinge less the modulized screwholes
difference(){
rotate([90,0,0])screwless_hinge_pin();
screwhole(7.5,-hinge_pin_width/2,0,1);
screwhole(26,-hinge_pin_width/2,0,1);
}
}





//
// BUILD THE TWO PARTS (HINGE_PIN AND HINGE_CAP
//
rotate([0,0,0])translate([0,0,13])hingepin(){}
rotate([0,0,0])translate([0,0,0])hingecap(){}



