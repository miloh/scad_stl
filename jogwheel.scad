// jog wheels for rotary encoders should be easy to describe in openscad: 
// large radius domes on cylinders with one or more small detents for tactile
// feedback.  number callouts, knurls, and texturre and varying connector shaft
// sizes for various standard sizes of rotary encoder shaft, split keyed or not

use <sphere_functions.scad>
$fa=6.0;
$fs=0.4;
$fn= 100;
eps = 0.05;
print_offset = 0.3;
function sphere_radius_from_cap(height, diameter) = (pow(height,2) + pow(diameter/2,2) ) /(2*height);
function thickness_as_fraction(scalar1, desired_thickness_scalar) = desired_thickness_scalar/scalar1 ;
function thickness_as_percent(scalar1, desired_thickness_scalar) = (desired_thickness_scalar/scalar1)*100 ;
// jog wheel measurements:  jog wheel is cylindrical with a domed cap 
// choice of measurements as follows are easy to obtain with calipers
outer_dia = 99.7;// diameter of base cylinder
thickness = 2.5; // thickness measured at the perp. edge of the jog lid
lip_height = 7.0; // measurement from underside of jog wheel to base of cylinder
outside_height = 9.50; // jog wheel height measured at the outside edge
center_height = 11.50; // jog wheel height measured at the center
shaft_length = 18.5; // underside length of shaft (helps ensure keepaways honored)
shaft_diameter = 6.0; // critical dimension
keysplit_length= 12.0; //  measured 12mm
detent_dia = 15.0; // top tactile detent, easy to measure for replacement parts 
detent_depth = 1.85; //  top tactile detent depth 
detent_dome_offset = 15;
dome_height = center_height - outside_height; 
dome_thickness = outside_height - lip_height; // sometimes this differs from thickness
shaft_cylinder_dia = shaft_diameter + 15; // fix...

module orient_to(coordinate, normal) {   
      translate(coordinate)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      children();
}

module half_sphere(radius=1,$fn=60){
    difference(){
      sphere(radius,center=true);
      translate([0,0,-radius*2.1/2]) cube(radius*2.1,center=true);
    }
}

// module takes inputs height (any position along radius), diameter, and 
// thickness, and outputs a 'spherical cap' 
module spherical_cap (height , diameter){
    this_radius = sphere_radius_from_cap(height,diameter);
    intersection(){
      translate([0,0,height - this_radius])sphere(this_radius);
      difference(){
      translate([0,0,this_radius*2.1/2]) cube(this_radius*2.1,center=true);
      //%translate([0,0,this_radius*2.1/2]) cylinder(diameter*1.01, h = this_radius * 2, center=true);
      translate([0,0,-this_radius*2.1/2]) cylinder(r=0.90*diameter/2,  h = this_radius * 2.1, center = true);
      }
    }
}

// module takes inputs (height [a position along the radius]), diameter, thickness), and outputs a dome 
module spherical_cap_shell (height , diameter, thickness){
    radius = sphere_radius_from_cap(height,diameter);
      cube(diameter*1.1,center=true);
    difference(){
      color("blue")translate([0,0, height - radius])
      sphere(radius);

      color("red")translate([0,0, height - (radius - thickness) ])
      sphere(radius - thickness );
    }
    }

// creates a solid dome with detent  
module shell_dome_with_detent(dia, height, detent_dia, detent_depth, shell_thickness, closeness){
jog_dome_radius = sphere_radius_from_cap(dome_height, dia);
detent_dome_radius = sphere_radius_from_cap(detent_depth, detent_dia);
// first build the main sphere then difference it with the translated detent sphere
translate([0,0,-jog_dome_radius + height])difference(){
    sphere(jog_dome_radius);
    translate(spherical_polar_to_cartesian(asin(dia/(2*closeness*jog_dome_radius)),0,jog_dome_radius+detent_dome_radius-detent_depth))rotate([0,asin(dia/(2*closeness*jog_dome_radius)),0])sphere(detent_dome_radius);
    difference(){
    sphere(jog_dome_radius-shell_thickness);
    translate(spherical_polar_to_cartesian(asin(dia/(2*closeness*jog_dome_radius)),0,jog_dome_radius+detent_dome_radius-detent_depth-shell_thickness))rotate([0,asin(dia/(2*closeness*jog_dome_radius))+180,0])half_sphere(detent_dome_radius);
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


// example of shell sphere with detent
my_radius = sphere_radius_from_cap(dome_height, outer_dia);
detent_radius = sphere_radius_from_cap(detent_depth, detent_dia);

translate([0,0,-my_radius+dome_height])
intersection(){
    translate([0,0,0])difference(){
        difference(){
            sphere(my_radius);
            orient_to(spherical_polar_to_cartesian(3.5,0,my_radius+detent_radius-detent_depth),[0,0,0])
            sphere(detent_radius);
        }
        difference(){
            sphere(my_radius-thickness);
            orient_to(spherical_polar_to_cartesian(3.5,0,my_radius+detent_radius-detent_depth),[0,0,0])
            sphere(detent_radius+thickness);
        }
    }
    union(){
        translate([-my_radius, -my_radius,my_radius-dome_height])cube(my_radius*2 ,center=false);
        translate([0,0,my_radius-dome_height])cylinder(r=outer_dia/2, h=outer_dia,center=true);
    }
}

// add the remaining parts to build the jogwheel
difference(){
translate([0,0,-outside_height])cylinder(r=outer_dia/2, h = outside_height  );
translate([0,0,-outside_height-eps])cylinder(r=outer_dia/2-thickness, h = outside_height*2  );
}

difference(){
translate([0,0,-dome_height-eps])rotate([180,0,0])cylinder(r2=shaft_cylinder_dia/4, r1= shaft_cylinder_dia , h = shaft_length-eps  );
translate([0,0,-dome_height-eps])rotate([180,0,0])rotenc_shaft(shaft_diameter+print_offset, shaft_length, keysplit_length+print_offset);
translate([0,0,-shaft_length-dome_height+thickness/2])rotate_extrude(convexity=1)translate([(shaft_cylinder_dia/4)+shaft_length,0,0])circle(r=shaft_length );
}

