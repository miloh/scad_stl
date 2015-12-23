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

//difference(){
//hull(){
//translate([0,0,20])sphere(r=30);
//linear_extrude(1)circle(r=66);
//}
//translate([0,0,11])arrayPolar(count=7,radius=47)flower_pellet(r=34/2);
//}

difference(){
hull(){
translate([0,0,29])scale([1,1,1.4])sphere(r=20);
linear_extrude(1)circle(r=41);
}
translate([0,0,13])arrayPolar(count=3,radius=23)flower_pellet(r=35/2);
}

