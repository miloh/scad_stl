// hexshell.scad
// 14-2-2015


//hexinside(diameter=72.5);
//base();
//capsule(height=153,radius=74.5/2);


difference(){
hexshell(h=153,radius=88/2,$fn=6);
translate([0,0,153/2-20])
difference(){
hexinside($fn=12,h=25,twist=90,diameter=73.5);
hexinside($fn=12,h=25,twist=90,diameter=71.5);
}
translate([0,0,65/2+5])
capsule(height=153,radius=65/2);
 }



module capsule(height=1,radius=1){
union(){
translate([0,0,height/2])
sphere(r=radius,center=true);
cylinder(r=radius,h=height,center=true);
translate([0,0,-height/2])
sphere(r=radius,center=true);
}
}

module hexinside(h=153,diameter=74.5,$fn=30){
translate([0,0,10])
linear_extrude(height=h,convexity=10,twist=93,slices=153*5)
circle($fn,r=diameter/2);
}
module hexshell(h=1,radius=1,slices=h*5,twist=0,$fn=30){
linear_extrude(height=h,convexity=10,slices=slices,center=true)
translate([0,0,0])
circle(r=radius);
}
