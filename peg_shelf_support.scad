// peg shelf support
// by ftoad, 10/12/2017 
//

use <orient_to.scad>

// static
eps = 0.05;
print_eps = 0.40;
$fn = 50;

// measurements and dimensions

profile_radius = 19.75;
rect_height = 7.25;
rect_width = 32.15;
function minkowski_rect(width, height, minkowski_radius) =  [ [0,0] , [width-minkowski_radius,0], [width-minkowski_radius, height-minkowski_radius],[0, height-minkowski_radius]];
peg_dia = 5.00;
countersink_dia = 7.15;
countersink_depth = 1.20;
length = 60.0;
minkowski_radius = 2;

// a L notch to cut standard quarter circle molding profile
size = profile_radius*2;
L_notch_square_points = [ [0,0], [size,0], [size,-size], [0,-size], [-size, -size], [-size,0], [-size,size], [0,size] ];


// module


module profile (){ 
    difference(){
      union(){
        minkowski(){
          union(){
            circle(r = profile_radius-minkowski_radius, center=true);
            polygon(points=minkowski_rect(rect_width,rect_height,minkowski_radius),convexity=1);
          }
          circle(r= minkowski_radius);
        }
      }
      rotate([0,0,0])polygon( L_notch_square_points,convexity=1);
    }
}


module peg_part(r1, total_height, r2, countersink_height){
cylinder(r=r1,h=total_height, center=true);
cylinder(r=r2,h=countersink_height, center=true);
}

module block_part(){
difference(){
linear_extrude(length)profile();
orient_to([profile_radius+peg_dia/2,0,length/2], [0,1,0])peg_part( (peg_dia+print_eps)/2, rect_height*4,  (countersink_dia+print_eps)/2,
countersink_depth*2);
}
}


block_part();
