use <arrayPolar.scad>
use <apothem.scad>
// apothem(radius,num_sides)
// radius_from_apothem(apothem,num_sides)
//arrayPolar( count, arc, radius, rotation, tilt)
$fn = 100;
eps = 0.1;

// measurements for a gear part
outer_diameter=50;  // mm
inner_diameter_upper=40.64; // mm
inner_diameter_slope=33.8; // mm
hex_nut_diameter = 29.9; // 30 mm a good standard socket size
threaded_axle_diameter=19; // mm this includes diameter of hex nut on axle
axle_spacing=1; // 

gear_num_teeth=8; // number of teeth
gear_height = 8;

// trapezoidal geartooth measurements
lx = 7.3; //  long side dimension
sx = 6.2; // short side dimension
tooth_height  =4; // height

// creates a trapezoidal gear tooth along the X axis, towards Y pos along the X axis
module trapezoidal_gear_tooth(long_length,short_length,height){
  linear_extrude(10)
  {
    union()
    {
      polygon(points =
      [[0,0],[long_length/2,0],[short_length/2,height],[0,height]], paths = [[0,1,2,3]], convexity =5);
      mirror([1,0,0])
      {
        polygon(points =
	[[0,0],[long_length/2,0],[short_length/2,height],[0,height]], paths = [[0,1,2,3]], convexity =5);
      }
    }
  }
}

module bikewrench()
{
  arrayPolar(8,360,inner_diameter_upper/2-tooth_height/2,0,0)
  translate([tooth_height/2,0,-6])rotate([0,0,90])trapezoidal_gear_tooth(lx,sx,tooth_height);
    difference ()
    {
      cylinder(r=outer_diameter/2,h=gear_height,center=true);
      rotate([0,180,0])
      cylinder(r1=inner_diameter_upper/2,r2=inner_diameter_slope/2,h=gear_height+eps,center=true);
    }
}


scale([1,1,1])
{
  difference()
  {
    
    union()
    {

      // the body of the tool from which the bikewrench part will be subtracted below
      cylinder(r=inner_diameter_upper/2,h=9);
      // built in hex turn nut, not $fn is 6 here for a hex turn nut
      //rotate([0,0,15])translate([0,0,8])cylinder(r=inner_diameter_upper/2-5,h=8,$fn=6);
      rotate([0,0,15])translate([0,0,9])cylinder(r=radius_from_apothem(hex_nut_diameter/2,6),h=9,$fn=6);
      echo("hex nut circumcircle diameter = ", radius_from_apothem(hex_nut_diameter/2,6)*2);
      // loop for some smooth transition between lower wrench and built in hex turn nut
      for(i = [0:10])
      {
        rotate([0,0,15])translate([0,0,8+i*0.1])cylinder(r=radius_from_apothem(hex_nut_diameter/2,6)+1-i*0.1,h=i*0.1,$fn=6);
      }
    }
    union()
    {
      // the wrench part we want to tighten the sprocket on the hub
      bikewrench();
      // spacing for the threaded axle rod and hex nuts
      translate([0,0,-1])cylinder(r=threaded_axle_diameter/2+axle_spacing/2,h=20);
    }  
  }
}
