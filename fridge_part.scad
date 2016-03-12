
translate ([0,3,0])

difference(){
cube([10,26,10]);
# translate([1,3,3]) 
cube([9,20,8]);
}

translate([10,5,0])

difference(){
difference() {
cube([35,22,6]);
# translate([5,11,0]) {
cylinder(h=6, r=2);
cylinder(h=1, r=4);}
}
#translate([1,0,5]){
cube([16,22,1]);}
}

translate([0,10,0])
cube([2,12,10]);
