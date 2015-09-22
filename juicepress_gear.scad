// gear for juice press
// 14 teeth
// 32.70mm OD
// 21.7 ID, 
// 17.00mm diameter inner circle squared off ID key with 13.00mm width
// 5.25mm tooth height
// 14.34  height

$fn = 100;
eps = 0.1;
use <MCAD/involute_gears.scad>
module mygear(){
        gear (
	circular_pitch=368,
	rim_thickness = 14.34,
	rim_width = 23.7,
	bore_diameter=17.00,
	hub_thickness = 14.34,
	circles=0,
	involute_facets=14,
	number_of_teeth=14
	);
}


union(){
  mygear();
  squareouts();
}

module squareouts(){
difference(){
translate([0,0,14.34/2])cylinder(r=17.00/2,h=14.34,center=true);
//translate([0,0,14.34/2.5])cube ([32.70,32.70,14.34],center=true);
//intersection(){
translate([0,0,14.34/2])cube ([17.00,13.00,14.34+eps],center=true);
  }
}

