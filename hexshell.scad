// hexshell.scad
// 14-2-2015



// measurements 
outside_diameter=88;
inside_diameter=65;
height=153;
layer_height=0.2;
// test modules

//hexshell
difference(){
linear_extrude(height=height,convexity=10,twist=0)
translate([0,0,0])
circle(r=outside_diameter/2,$fn=6);
translate([0,0,height/2])
capsule(height=height,radius=inside_diameter/2);
}

//slices=height/layer_height
//jarbody();
//translate([0,0,120])jarcap();
//
//module jarbody(){
//union(){
//difference(){
//hexshell(h=153,radius=88/2,$fn=6);
//translate([0,0,65/2+5])
//capsule(height=153,radius=65/2);
// }
//translate([0,0,153/2-28])
//difference(){
//hexinside($fn=12,h=25,twist=90,diameter=73.5);
//hexinside($fn=12,h=25,twist=90,diameter=71.5);
//}
//}
//}

module jarcap(){
  difference(){
    difference(){
      hexshell(h=26,radius=88/2,$fn=6);
      translate([0,0,-65/2-5])
      capsule(height=26,radius=65/2);
    }
    
    translate([0,0,-35])
    difference(){
      hexinside($fn=12,h=25,twist=90,diameter=73.0);
      hexinside($fn=12,h=26,twist=90,diameter=72.0);
    }
  }
}

// modules maybe not worth saving

module hexinside(h=1,diameter=1,$fn=30,twist=0,slices=1){
translate([0,0,10])
linear_extrude(height=h,convexity=10,twist,slices=slices)
circle($fn,r=diameter/2);
}

// modules maybe for elsewhere

// capsule takes height and radius and creates a vertical capsule shape, centered at the origin
// should check to make sure the height >= 2 * radius
// height - radius * 2 = cylinder height
module capsule(height=1,radius=1,$fn=25){
  union(){
  translate([0,0,height/2-radius])
  sphere(r=radius,$fn=$fn);
  translate([0,0,-height/2+radius])
  sphere(r=radius,$fn=$fn);
  cylinder(r=radius,h=height-radius*2,center=true);
  }
}

