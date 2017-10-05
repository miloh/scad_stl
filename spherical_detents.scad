use <sphere_functions.scad>
use <arrayPolar.scad>
$fa=5.0;
$fs=0.5;
//$fn= 00;
eps = 0.05;
print_offset = 0.3;
function sphere_radius_from_cap(height, diameter) = (pow(height,2) + pow(diameter/2,2) ) /(2*height);

module orient_to(coordinate, normal) {   
      translate(coordinate)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      children();
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


// needs some uniform symmetry around the origin. works with centered solids
module sphere_detent_children(detent_radius, coordinate, normal , child_size, shell_thickness){
    intersection(){
        difference(){
          difference(){
            children();
            orient_to(coordinate,normal)sphere(r=detent_radius);
          }
          difference(){
            scale([1-shell_thickness/child_size, 1-shell_thickness/child_size, 1-shell_thickness/child_size])children();
            orient_to(coordinate,normal)sphere(r=detent_radius+shell_thickness/2);
          }
        }
    }
}


module anim(t) {
    difference(){
        sphere_detent_children(3, [5*cos(t*360),5*sin(t*360),-1], [0,0,0], 10, 2)
        union (){
          //cube([20,20,20],center=true);
          scale([1,1,1])translate([0,0,0])sphere(5);
        }
        // cross section to view
        translate([0,0,10])cube([40,40,20],center=true);
    }
}

module anim_sim(){
anim(0.1);
anim(0.5);
anim(0.9);
}


//anim_sim();
rotate([180,0,0])anim($t);
