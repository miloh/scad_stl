// peg shelf support
// by ftoad, 10/12/2017 
//

use <orient_to.scad>

// static
eps = 0.05;
print_eps = 0.19;
$fn = 50;

// measurements and dimensions

profile_radius = 19.75;
rect_height = 7.25;
rect_width = 32.15;
rect_points = [ [0,0] , [ rect_width,0], [rect_width,rect_height],[0,rect_height]];
peg_dia = 5.45;
countersink_dia = 7.85;
countersink_depth = 2.35;
length = 20.0;

// a L notch to cut standard quarter circle molding profile
size = profile_radius*2;
L_notch_square_points = [ [0,0], [size,0], [size,-size], [0,-size], [-size, -size], [-size,0], [-size,size], [0,size] ];


// module


module profile (){ 
          difference(){
            minkowski(){
	    union(){
                circle(r = profile_radius, center=true);
                polygon(points=rect_points,convexity=1);
	    }
                circle(r= 1);
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
//orient_to([profile_radius+peg_dia/2,rect_height/2,length/2], [0,1,0])cylinder(r=(peg_dia+print_eps)/2,h=rect_height*2,center=true);
orient_to([profile_radius+peg_dia/2,0,length/2], [0,1,0])peg_part(
(peg_dia+print_eps)/2, rect_height*4,  (countersink_dia+print_eps)/2,
countersink_depth*2);
}
}


block_part();

