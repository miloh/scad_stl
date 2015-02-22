// hexshell.scad
// a storage container with removable lids in a hex shape
// 14-2-2015

// measurements 
outside_diameter=88;
inside_diameter=65;
height=153;
layer_height=0.2;

// this calls up the different parts of the container, top/bottom/all
// uncomment one and leave the other commented 
//relative_height=0.80;
relative_height=0.20;
//relative_height=1.0;

// 
difference(){
hex_shell_storage();
translate([-500,-500,-height*relative_height])
cube([1000,1000,height]);
}

//this calls up the joint screw
//decascrew(height=height/2,radius=(outside_diameter-(outside_diameter-inside_diameter)/2)/2-2.25,slices=height/layer_height,twist=360);

// this is the body of the complete hex shell storage container
module hex_shell_storage(){
difference(){
linear_extrude(height=height,convexity=10,twist=0)
translate([0,0,0])
circle(r=outside_diameter/2,$fn=6);
translate([0,0,height/2])
capsule(height=height,radius=inside_diameter/2);
  translate([0,0,height/2])
  difference(){
  decascrew(height=height/1.2,radius=(outside_diameter-(outside_diameter-inside_diameter)/2)/2-1.0,slices=height/layer_height,twist=360);
  decascrew(height=height/1.2,radius=(outside_diameter-(outside_diameter-inside_diameter)/2)/2-3.5,slices=height/layer_height,twist=360);
  }
}
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

module decascrew(height=1,radius,$fn=12,twist=0,slices=1){
linear_extrude(height=height,convexity=10,twist=twist,slices=slices,center=true)
circle($fn,r=radius);
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

