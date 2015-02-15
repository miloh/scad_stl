// hexshell.scad
// 14-2-2015


//hexinside(diameter=72.5);
base();


  module base(){
  difference(){
  hexshell();
  hexinside();
  }
}


module hexinside(diameter=74.5){
translate([0,0,10])
linear_extrude(height=153,convexity=10,twist=93,slices=153*5)
circle($fn=12,r=diameter/2);
}
module hexshell(){
linear_extrude(height=153,convexity=10,twist=0,slices=153*5)
translate([0,0,0])
circle($fn=6,r=88/2);
}
