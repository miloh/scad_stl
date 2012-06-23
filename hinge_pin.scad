// TOILET SEAT HINGES FOR NOISEBRIDGE
// by ftoad, 03/15/2011
// hinge_pin part
// CC-SA / toilet-seat alike



//************Variables**********************************************************


hinge_pin_points =[ [0,0], [50.5,0],[55,3.5],[55,10],[44,10],[-6,10] ];  // turn this into the appropriate variable type
hinge_pin_path = [0,1,2,3,4,5] ;
hinge_pin_od = 17;
hinge_pin_id = 11.3;
hinge_pin_length = 23;
centerX = 52.5;   //X center of hinge pivot
centerY = 20;   // Y center of hinge pivot
screwhole_cs  = 7.5;   //diameter of countersink screwholes
screwhole_shank = 4;   // diamter of screwhole shank
hinge_width=16;  //used as height for a linear_extrude
offset =0.05;


//**************************************************************************
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ... ], convexity = N);
//polygon(points = hinge_cap_points , paths =   hinge_cap_path , convexity = N);


module screwless_hinge_pin(){
	module hingepin_baseplan(){
		polygon(points= [ [0,0], [50.5,0],[55,3.5],[55,10],[55,20],[44,20],[44,10],[-6,10] ], paths = [[0,1,2,3,4,5,6,7]],convexity=N);
		translate([centerX,centerY,0])  circle (r=hinge_pin_od/2,center=true);
	}
	
	// note that translate() ops precede linear_extrude() otherwise they are SQUASHED to null!!!
	module hingepin(){
		translate( [centerX , centerY,hinge_width]) linear_extrude(height=hinge_pin_length,$fa=1,$fs=0.2)  circle(r=hinge_pin_id/2,center=false);
	}
	
	
	linear_extrude(height=hinge_width) hingepin_baseplan();
	hingepin();

}

module screwhole(a,b,c){
 // the shank/shaft on this hinge_pin model are switched wrt to the hinge_cap model
translate ([a,b,5]) cylinder(r=screwhole_shank/2, h=5+offset,$fa=5,$fs=0.2); 
translate([a,b,0]) cylinder(r=screwhole_cs/2,h=5+offset,$fa=5,$fs=0.2);
}
//
//// FINISH IT!  run a difference of the hinge less the modulized screwholes
difference(){
rotate([90,0,0])screwless_hinge_pin();
screwhole(7.5,-hinge_width/2,0);
screwhole(26,-hinge_width/2,0);
}
