//
// Spill guard for countertop mixer bowl 
//

// important dimensions
bowl_diameter = 8.75*25.4; // mm
spillguard_dia_inner = bowl_diameter - 5/8 * 25.4;
spillguard_dia_outer = bowl_diameter + 60;


// general purpose modules
// these might not be used here

module half_cylinder(height=1,radius=1,$fn=25,center=true){
    difference(){
      rotate([90,0,0])cylinder(h=height,r=radius,center=true);
      translate([0,0,-radius*5]) cube(radius*10,center=true);
    }
}

module half_sphere(radius=1,$fn=60){
    difference(){
      sphere(radius,center=true);
      translate([0,0,-radius*5]) cube(radius*10,center=true);
    }
}

module ring(outer_radius=1, inner_radius=0.5,height=1,$fn=50,center=true){
  difference(){
  cylinder(h=height, r= outer_radius,$fn=$fn,center=true);
  cylinder(h=height+1, r= inner_radius,$fn=$fn,center=true);
  }
}


// Model modules -- the following modules should be used for the parts 

// Front Part
module spill_guard(){
// top ring
ring(outer_radius=bowl_diameter/2,inner_radius=spillguard_dia_inner/2.0,height=5,$fn=70);
// outside catch ring
translate([0,0,-2.0])ring(outer_radius=bowl_diameter/2+5,inner_radius=bowl_diameter/2,height=3,$fn=70);
// inside locating ring
translate([0,0,-2.0])ring(outer_radius=bowl_diameter/2-5,inner_radius=bowl_diameter/2-8,height=3,$fn=70);
// cone shape inwards
translate([0,0,1.5])cylinder(h=25,r1=spillguard_dia_inner/2.0,r2=spillguard_dia_inner/2.0-25.4,$fn=70);
// cone shape outwards (pourspout)
translate([0,0,1.5])cylinder(h=50,r1=spillguard_dia_inner/2.0,r2=spillguard_dia_outer/2.0,$fn=70);
}

// module declarations
spill_guard();

