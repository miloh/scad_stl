// Knurled Knob for a 6.5mm shaft
// by ftoad, 03/15/2011
// hinge_pin part
// CC-SA / toilet-seat alike




// knob variables

shaft_id		= 6.9;
shaft_length	= 15;
granularity		= 50;
od			= 20;
extra			= 0.1;
Pi 			= 3.14;

// the object


difference() {
rotate([180,0,0])blank_knob();
rotate([0,0,0])translate ([0,0,-shaft_length]) lozenge_polar_array();
}

//  modules to build the object



module blank_knob(){
   difference(){
    shafting();
    cylinder (r=shaft_id/2, h=shaft_length, $fn=granularity);
   }
}


// half sphere for the top of the knob
module half_sphere(r){
   difference(){
    sphere (r, $fn=granularity);
    translate([-od,-od,0]) cube([2*od,2*od,od]);
   }
}


// shaft of the knob
module shafting(){
 half_sphere( od/2); 
 cylinder  (r=od/2, h=shaft_length, $fn=granularity);
}

//lozenge to scoop out 'knurls'
module lozenge(){
  union(){
   cylinder ( r= (Pi*od)/10 , h=shaft_length, $fn=granularity);
   translate ([0,0,shaft_length])  sphere   (r = (Pi*od)/10, $fn=granularity);
   translate([0,0,0]) sphere ( r = (Pi*od)/10, $fn=granularity);
  }
}

module lozenge_polar_array(){
 for ( i = [0:4] ) {
  rotate( i*360/5 , [0,0,1]) translate( [od/2, od/2, 0] ) lozenge();
  }
} 


