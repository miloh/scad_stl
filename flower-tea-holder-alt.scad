include <arrayPolar.scad>;
//arrayPolar( count, arc, radius, rotation, tilt)
$fn = 50;

//arrayPolar(count=5, radius =15,tilt=45 )
//hull(){
//translate([0,0,])sphere(r=10);
//linear_extrude(1)circle(r=30);
//}
eps = 0.01;
module halfsphere(r=1){
  difference(){
  translate([0,0,0])sphere(r);
  translate([0,0,-r])cube(r*2+eps,center=true);
  }
}

module flower_pellet(){
sphere(r);
}

difference(){
hull(){
translate([0,0,10])sphere(r=30);
linear_extrude(1)circle(r=59);
}
union(){
translate([0,0,7])arrayPolar(count=7,radius=40)flower_pellet(r=36/2);
translate([0,0,-10])arrayPolar(count=1)flower_pellet(r=36/2);
}
}
