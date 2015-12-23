//
// 70's General Electric 
// Dishwasher roller and bushing for dishtray rack
//
wheel_radius_outer = 22.2;
wheel_ID = 10.1;
washer_bushing_OD = 9.30;
mounting_rod_dia = 5.50;

module half_cylinder(high=1,rad=1,$fn=60,center=true){
    difference(){
      rotate([90,0,0])cylinder(h=high,r=rad,center=true);
      translate([0,0,-rad*5]) cube(rad*10,center=true);
    }
}

module half_sphere(radius=1,$fn=60){
    difference(){
      sphere(radius,center=true);
      translate([0,0,-radius*5]) cube(radius*10,center=true);
    }
}

module ring(){
  difference(){
  cylinder(h=19, r= wheel_radius_outer,$fn=68,center=true);
  cylinder(h=25, r= wheel_ID/2,$fn=68,center=true);
  }
}

module shaping(){
union(){
translate([0,0,-6])cylinder(h=10,r1=wheel_radius_outer, r2=wheel_radius_inner, $fn=68,
center=true);
translate([0,0,5])cylinder(h=10, r= wheel_radius_outer-2.4, $fn=68, center=true);
}
}
// Bushing Part
module bushing_part(){
difference(){
  difference(){
    union(){
      cylinder(h=18,r=washer_bushing_OD/2.0,$fn=68,center=true);
      translate([0,0,8])cylinder(h=2.5,
      r1=washer_bushing_OD/2.0,r2=washer_bushing_OD/2.0+0.5,$fn=68,center=true);
      translate([0,0,-8.0])cylinder(h=3, r1=washer_bushing_OD/2.0+1.5,r2=washer_bushing_OD/2.0,$fn=68,center=true);
    }
    cylinder(h=30,r=mounting_rod_dia/2.0,$fn=68,center=true);
  }
  translate([5,0,7.5])rotate([0,90,0])cylinder(h=10,r=mounting_rod_dia/2.0,$fn=68,center=true); 
}
}

// Wheel Part
module wheel_part(){
  difference(){
  ring();
  shaping();
  }
}
//   attempt at minkowski sum didn't go so well.  recompile openscad?
//  $fn=10;
//  minkowski(){
//    sphere(r=10);
//    ring();
//  }


bushing_part();
$fn = 45;
arc = 360;
count = 7;
radius = wheel_radius_outer/1.8;
difference(){
wheel_part();
  for (i = [0:count - 1]){
    angle = arc / count  * i;
    translate(radius * [sin(angle),-cos(angle),0])
    cylinder(r=wheel_ID/4.0, h = 25,center=true);
  }
}
