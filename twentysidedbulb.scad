module dodecahedron(r){hull()for(a=[0:72:288])rotate([atan(sqrt(5)/2-0.5),0,a])translate([-r/2,-r/2,-r/2])cube(r);}
//dodecahedron(r=10);

phi = (1+ sqrt(5))/2;
$fn=80;


module profile() linear_extrude(height = 10, center = true) polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]], paths=[[0,1,2,3,4,5]]);
module relief(r,h)
  union(){  
   sphere(r);  
   cylinder(r=r,h=h);
  };


r=1.5;
h=5;
zup = -13;

difference(){
scale([10,10,10])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) profile();
scale([9,9,9])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) profile();
rotate([180,0,0])translate([0,0,-h+zup])relief(r=r,h=h);
}
