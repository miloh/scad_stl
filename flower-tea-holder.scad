include <arrayPolar.scad>;
//arrayPolar( count, arc, radius, rotation, tilt)
$fn = 40;
eps = 0.01;

flower_pellet_radius = 35/2;
hold_scaler = 1.2;

module halfsphere(r=1){
  difference(){
  translate([0,0,0])sphere(r);
  translate([0,0,-r])cube(r*2+eps,center=true);
  }
}

module base(){
  difference(){
    hull(){
      translate([0,0,10])scale([1.6,1.6,1.4])sphere(r=flower_pellet_radius);
      translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius*1.3);
    }
    halfsphere(r=100);
    translate([0,0,10])scale([1.7,1.7,1.8])sphere(r=flower_pellet_radius);
    translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius*1.1);
  }
}

module base_less_center(){
  difference(){
    hull(){
    translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius*1.3);
    }
    halfsphere(r=100);
    translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius*1.1);
  }
}
module lid(){
intersection(){
difference(){
  union(){
      translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)scale([1.75,1.75,0.125])sphere($fn=15,r=flower_pellet_radius*1.3);
      translate([0,0,0])arrayPolar(count=5,radius=flower_pellet_radius*3)sphere(r=flower_pellet_radius*1.2);
      translate([0,0,0])rotate([0,0,30])arrayPolar(count=6,radius=flower_pellet_radius/1.50)scale([1,1,0.2])sphere(r=flower_pellet_radius*1.1);
      translate([0,0,0])rotate([0,0,90])scale([1.0,0.15,0.8])sphere(r=flower_pellet_radius*1.1);
      }
  rotate([180,0,0])halfsphere(r=100);
  }
  rotate([180,0,35])base_less_center();
}
}

translate([150,0,0])lid();
//translate([0,0,0])rotate([180,0,0])base();
