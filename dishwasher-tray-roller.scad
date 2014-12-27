//
// dishwasher bushing bushing and compression connection for rack wheels 
//
wheel_radius_outer = 22.2;
wheel_ID = 10.0;
washer_bushing_OD = 9.50;
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
      translate([0,0,8])cylinder(h=2, r1=washer_bushing_OD/2.0,r2=washer_bushing_OD/2.0+1,$fn=68,center=true);
      translate([0,0,-8])cylinder(h=2, r1=washer_bushing_OD/2.0+1,r2=washer_bushing_OD/2.0,$fn=68,center=true);
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
wheel_part();
