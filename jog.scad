// jog wheels for rotary encoders are essentially large radius domes on cylinders
// with one or more small detents for tactile feedback.  knurls and texture 
// on the underside the jog wheel is the connector for various standard sizes of 
// rotary encoder shaft, split keyed or not

use <sphere_functions.scad>
$fa=1.0;
$fs=0.04;
// jog wheel measurements:  jog wheel is cylindrical with a domed cap 
// choice of measurements as follows are easy to obtain with calipers
outer_dia = 99.7;// diameter of base cylinder
thickness = 1.5; // thickness measured at the perp. edge of the jog lid
lip_height = 7.0; // measurement from underside of jog wheel to base of cylinder
outside_height = 9.50; // jog wheel height measured at the outside edge
center_height = 11.50; // jog wheel height measured at the center
shaft_length = 18.5; // underside length of shaft (helps ensure keepaways honored)
shaft_diameter = 5.2; // critical dimension
detent_dia = 15.0; // top tactile detent, easy to measure for replacement parts 
detent_depth = 1.85; //  top tactile detent depth 
detent_dome_offset = 15;
dome_height = center_height - outside_height; 
dome_thickness = outside_height - lip_height; // sometimes this differs from thickness
shaft_cylinder_dia = shaft_diameter + 15; // fix...
 

// module takes inputs (center, diameter, thickness), and outputs a dome 
module spherical_cap (height , diameter,thickness){
  sphere_radius_from_cap = (pow(height,2) + pow(diameter/2,2) ) /(2*height);
  translate([0,0,-sphere_radius_from_cap+height]) difference(){
    translate([0,0,0])sphere(sphere_radius_from_cap);
      translate([0,0,0]) sphere(sphere_radius_from_cap - thickness);
      translate([0,0,-height]) cube(sphere_radius_from_cap*2,center=true);
  }
}


// creates a solid dome with detent  
module shell_dome_with_detent(dia, height, detent_dia, detent_depth, shell_thickness, closeness){
function sphere_radius_from_cap(diameter,height) = (pow(height,2) + pow(diameter/2,2) ) /(2*height);
jog_dome_radius = sphere_radius_from_cap(dia, dome_height);
detent_dome_radius = sphere_radius_from_cap(detent_dia, detent_depth);
// first build the main sphere then difference it with the translated detent sphere
translate([0,0,-jog_dome_radius + height])difference(){
    sphere(jog_dome_radius);
    translate(spherical_polar_to_cartesian(asin(dia/(2*closeness*jog_dome_radius)),0,jog_dome_radius+detent_dome_radius-detent_depth)) sphere(detent_dome_radius);
    difference(){
    sphere(jog_dome_radius-shell_thickness);
    translate(spherical_polar_to_cartesian(asin(dia/(2*closeness*jog_dome_radius)),0,jog_dome_radius+detent_dome_radius-detent_depth-shell_thickness)) sphere(detent_dome_radius-shell_thickness);
    }
    translate([0,0,-height]) cube(jog_dome_radius*2,center=true);
    }
}


// module takes inputs and outputs a pot/encoder shaft with keysplit, for use with logical AND NOT 
module rotenc_shaft(shaft_dia, shaft_len, keysplit_height=1){
      difference(){
        cylinder(r=shaft_dia/2, h=shaft_len);
        scale([1,1.1,1])translate([shaft_dia/2,0,3*shaft_len/2-keysplit_height])cube([shaft_dia, shaft_dia, shaft_len], center=true);
      }
}
difference(){
translate([0,0,0])cylinder(r=outer_dia/2,h=outside_height);
translate([0,0,-thickness])cylinder(r=outer_dia/2-thickness,h=outside_height);
}
translate([0,0,outside_height])shell_dome_with_detent(outer_dia, dome_height, detent_dia, detent_depth/3, dome_height ,1.4 );
difference(){
translate([0,0,-shaft_length+center_height-dome_thickness/2])cylinder(r=shaft_cylinder_dia/2,h=shaft_length);
translate([0,0,-shaft_length+center_height-dome_thickness])rotenc_shaft(5,shaft_length, 10);
translate([0,0,-shaft_length+center_height-dome_thickness])rotate_extrude(convexity=1)translate([ shaft_cylinder_dia/2, 0,0])scale([0.9,3.6])circle(r = shaft_diameter );
}
