use <sphere_functions.scad>
$fn=300;
$fa=1;
$fs=1;
// jog wheel measurements
outer_dia = 99.7; 
edge_thickness = 1.5; // thickness measured at the perp. edge of the jog lid
lip_height = 7.0;
outside_height = 9.50;
center_height = 11.50;
shaft_length = 18.5;
shaft_diameter = 5.2;
detent_dia = 15.0;
detent_depth = 1.85;
dome_height = center_height - outside_height;
dome_thickness = outside_height - lip_height;
shaft_cylinder_dia = shaft_diameter + 15;
// jog wheel 
taper="";

// module takes inputs (center, diameter, thickness), and outputs a dome 
module spherical_cap (height , diameter,thickness){
  sphere_radius = (pow(height,2) + pow(diameter/2,2) ) /(2*height);
  translate([0,0,-sphere_radius+height]) difference(){
    translate([0,0,0])sphere(sphere_radius);
      translate([0,0,0]) sphere(sphere_radius - thickness);
      translate([0,0,-height]) cube(sphere_radius*2,center=true);
  }
}

// module takes many inputs and outputs a jog wheel 
// no checking for dimensional overlaps
module jog_wheel( dia, lid_height, thickness, dome_height, dome_thickness, detent_dia, detent_depth){
    translate([0,0,lid_height/2]) difference(){
      cylinder(r=dia/2, h=lid_height, center=true);
      scale([1,1,1.1])cylinder(r=dia/2-thickness, h=lid_height, center=true);
    }
    difference(){
    translate([0,0,lid_height])spherical_cap (dome_height, dia, thickness );
    translate([dia*0.75/2,0,lid_height+0.50])rotate([0,183,0])sphere(d=detent_dia);
    }
    translate([dia*0.75/2,0,lid_height+0.80])rotate([0,183.5,0])spherical_cap (detent_depth, detent_dia, dome_thickness);
    intersection(){
    translate([0,0,lid_height])spherical_cap (dome_height, dia, dome_thickness );
    translate([dia*0.75/2,0,lid_height+0.75])difference(){
    sphere(detent_dia/2);
    sphere(detent_dia/2-thickness);
    }
    }
}

// module takes inputs and outputs a pot/encoder shaft with keysplit, for use with logical AND NOT 
module rotenc_shaft(shaft_dia, shaft_len, keysplit_height=1){
      difference(){
        cylinder(r=shaft_dia/2, h=shaft_len);
        scale([1,1.1,1])translate([shaft_dia/2,0,3*shaft_len/2-keysplit_height])cube([shaft_dia, shaft_dia, shaft_len], center=true);
      }
}

jog_wheel(outer_dia, outside_height, edge_thickness, dome_height, dome_thickness , detent_dia, detent_depth);

difference(){
translate([0,0,center_height-shaft_length-dome_thickness])cylinder(r=shaft_cylinder_dia/2, h=shaft_length);
translate([0,0,center_height-shaft_length])rotate_extrude(convexity=1)translate([ shaft_cylinder_dia/2, 0,0])scale([1,3])circle(r = shaft_diameter );
translate([0,0,-shaft_length/2-dome_thickness])rotate([0,0,0])rotenc_shaft(shaft_diameter,shaft_length,keysplit_height=shaft_length-dome_thickness);
}

