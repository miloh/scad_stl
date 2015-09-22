// a $50,000.00 plastic printing machine was once used to print these. as demo
//models.

//moneyclip.

// description:
//moneyclip has a front surface along the X axis lets say, then a wide curve and
//another straight segment at some angle wrt the X axis.  there is a friction
//section at the mouth, with a raised rectangle on one side and a matching
//recessed rectangle on the other there's a surface for text on the outside along
//the X axis so its easy to orient

// proceedure:
// build with a polyline, extrude vertically,
// manually place the text section using boolean operations
// place the friction part.

// Dimensions in mm
eps=0.1;
height = 28.0; // narrow side
width = 67;
depth = 5; 
thickness = 3;


  difference(){
  translate([0,13.5/2,0])cylinder(r=13.5/2,h=28);
  translate([0,13.5/2,-eps/2])cylinder(r=13.5/2-3,h=28+eps);
  translate([0,0,-5])cube([10,10.0,45]);
  }

difference(){
  difference(){
  cube([67,3,28]);
  minkowski(){
  sphere(r=0.4);
  translate([58,2.5,-3.5])cube([3,0.6,35]);
  }
  }
  hull(){
    scale([1.0,1.0,1.0])translate([0,13.5-3+eps,0])rotate(-7.5)cube([60,3,28]);
    scale([1.0,1.0,1.0])translate([60,3+eps,0])rotate(7.5)cube([7,3,28]);
    }
 }


  hull(){
  translate([0,13.5-3,0])rotate(-7.5)cube([60,3,28]);
  translate([60,3,0])rotate(7.5)cube([7,3,28]);
  }
