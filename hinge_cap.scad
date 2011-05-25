// TOILET SEAT HINGES FOR NOISEBRIDGE 
// hinge_cap part
// by ftoad, 03/15/2011
// CC-TA / toilet-seat alike


//************Variables**********************************************************


hinge_cap_points =[ [0,0], [52,0],[76,9],[63,24],[58,15],[57,10],[5,10],[0,0] ];  // turn this into the appropriate variable type
hinge_cap_path = [0,1,2,3,4,5,6] ;
hinge_cap_od = 19;
hinge_cap_id = 11.5;
centerX = 68;   //X center of hinge pivot
centerY = 17;   // Y center of hinge pivot
screwhole_cs  = 7.5;   //diameter of countersink screwholes
screwhole_shank = 4;   // diamter of screwhole shank
hinge_width=16;  //used as height for a linear_extrude
hinge_cap_hole_depth=12;
offset =0.05;


//**************************************************************************
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ... ], convexity = N);


//polygon(points = hinge_cap_points , paths =   hinge_cap_path , convexity = N);



module screwless_hinge(){

	module hingecap_baseplan(){
	polygon(points = [ [0,0], [52,0],[73,9],[63,24],[58,15],[53,10],[5,10],[0,0] ] , paths =[ [0,1,2,3,4,5,6] ], convexity = N);
	translate ([centerX,centerY,0]) circle (r=hinge_cap_od/2, center=true);
	}
	
	// note that translate() ops precede linear_extrude() otherwise they are SQUASHED to null!!!
	module hingecap_holeremove(){
	translate( [centerX , centerY,hinge_width-hinge_cap_hole_depth]) linear_extrude(height=hinge_cap_hole_depth,$fa=1,$fs=0.2)  circle(r=hinge_cap_id/2);
	}
	
	
	difference(){
	linear_extrude(height=hinge_width) hingecap_baseplan();
	hingecap_holeremove();
	}

}

module screwhole(a,b,c){
translate ([a,b,0]) cylinder(r=screwhole_shank/2, h=5+offset,$fa=5,$fs=0.2);
translate([a,b,5]) cylinder(r=screwhole_cs/2,h=5+offset,$fa=5,$fs=0.2);
}

// FINISH IT!  run a difference of the hinge less the modulized screwholes
difference(){
rotate([90,0,0])screwless_hinge();
screwhole(12,-hinge_width/2,0);
screwhole(35,-hinge_width/2,0);
}