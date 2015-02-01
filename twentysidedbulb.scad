module dodecahedron(r){hull()for(a=[0:72:288])rotate([atan(sqrt(5)/2-0.5),0,a])translate([-r/2,-r/2,-r/2])cube(r);}
//dodecahedron(r=10);

phi =10*((1+ sqrt(5))/2);
$fn=40;

module profile() linear_extrude(height = 10, center = true) polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]], paths=[[0,1,2,3,4,5]]);

module partial_cutout() linear_extrude(height = 10, center = true) difference(){
polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]],
paths=[[0,1,2,3,4,5]]); circle(r=0.15); }

difference(){
difference(){
scale([10,10,10])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) partial_cutout();
scale([9.5,9.5,9.5])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) profile();
}
translate([-250,-250,-529])cube([500,500,500]);
}
