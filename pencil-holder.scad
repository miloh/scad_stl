// a pencil holder for hyperboloid pencil distribution
use <arrayPolar.scad>
//reminder: arrayPolar( count, arc, radius, rotation, tilt)

$fn = 20;

// a pencil module for illustration purposes
module pencil(length=1,diameter=1, issharp=0, facets=8){
 if (issharp != 0) 
 {
     translate([0,0,0])cylinder(r=diameter/2, h=length,center=true);
     translate([0,0,length/2+1])cylinder(r1=diameter/2,r2=0,h=2,center=true);
 }
 else
 {
     translate([0,0,0])cylinder(r=3 ,h=length,center=true);
 }
}

// a hex faceted pencil holder module
module pencil_holder(){
  difference(){
    translate([0,0,0])cylinder(r=74,h=20,$fn=20);
    union(){
      rotate([0,0,0])translate([0,0,-0.1])cylinder(r=52,h=21,$fn=12);
      arrayPolar(count=12,arc=360,radius=0,rotation=30)
      {
        translate([51.0,0,21])rotate([0,45,0])cube([4,30,11],center=true);
        translate([51.0,0,0.1])rotate([0,-45,0])cube([4,30,11],center=true);
      }
      arrayPolar(count=20,arc=360,radius=0){
        translate([74,0,19])rotate([0,-45,0])cube([2,24,24],center=true);
        translate([74,0,1])rotate([0,45,0])cube([2,24,24],center=true);
      }
    }
  }
}

//rotate([0,90,0])pencil(length=30,issharp=1);
//rotate([0,0,90])tooth();

//rotate([0,40,0])
//pencil(length=5,issharp=1);

// an example pencil holder. 
difference(){
 translate([0,0,-25])rotate([0,0,-3]) pencil_holder();
  union()
  {
     #arrayPolar(20,360,85,0,0)
     rotate([20,40,1])
     pencil(length=135,diameter=9,issharp=1,$fn=30);
     translate([0,0,35])
     #arrayPolar(20,360,66,60,0)
     rotate([20,-10,180])
     pencil(length=135,diameter=9,issharp=1,$fn=30);
  }
}

