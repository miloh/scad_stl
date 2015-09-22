// playing with the excellent dodecahedron openscad oneliner by whosawhatsis
// https://plus.google.com/+Whosawhatsis
// https://twitter.com/whosawhatsis

module dodecahedron(r){hull()for(a=[0:72:288])rotate([atan(sqrt(5)/2-0.5),0,a])translate([-r/2,-r/2,-r/2])cube(r);}
//dodecahedron(r=10);

phi =((1+ sqrt(5))/2);
$fn=35;

module profile() linear_extrude(height = 10, center = true) polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]], paths=[[0,1,2,3,4,5]]);

module partial_cutout() linear_extrude(height = 10, center = true) 
    difference(){
      polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]],paths=[[0,1,2,3,4,5]]); 
      circle_array(spacing=0.12,size=0.15,number=3);
     };

module circle_array(size=1.0, spacing=1.0,number=3){
    for ( i = [0 : number-1] )
    {
        if (i % 2 ){ 
         rotate([0,0,i*180])translate([spacing*i, spacing*i, 0])circle(r=size,center=true);
        }else { 
          rotate([0,0,0])translate([spacing*i,spacing*i, 0])circle(r=size,center=true);
        }
    }
}

//circle_array(spacing=3.0, size=1.5,number=3);

difference(){
difference(){
scale([10,10,10])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) partial_cutout();
scale([9.5,9.5,9.5])intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) profile();
}
translate([-250,-250,-529])cube([500,500,500]);
}
