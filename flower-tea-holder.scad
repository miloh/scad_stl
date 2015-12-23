include <arrayPolar.scad>;
//arrayPolar( count, arc, radius, rotation, tilt)
$fn = 50;
eps = 0.01;

flower_pellet_radius = 35/2;

module halfsphere(r=1){
  difference(){
  translate([0,0,0])sphere(r);
  translate([0,0,-r])cube(r*2+eps,center=true);
  }
}

translate([0,0,0])scale([1.6,1.6,1.4])sphere(r=flower_pellet_radius);
translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius);

