//
//s = [0.5, 0.3 ,0.1];
//
//s = rands(0,1,10);
//
//for(i=[0:9]){
//phi = acos(2*s[i]-1);
//echo(phi);
//}
//
//echo (s);

// some setups
$fn = 60;
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ...], convexity = N);
size = 1;
L_notch_square_points = [ [0,0], [size,0], [size,-size], [0,-size], [-size, -size], [-size,0], [-size,size], [0,size] ];

// a primitive for rotate extrude
rotate_extrude(convexity=1)
translate([5,0])rotate([0,0,0])difference(){
circle ( [1,1]);
rotate([180,0])polygon ( L_notch_square_points, convexity=1);
}

// a band with a curved outside
translate([20,0,0])rotate_extrude(convexity=1)translate([5,0])difference(){
circle ( [1,1]);
translate([-1,0])square ( [2,2],center=true);
}

// a band with the inside curved
translate([-20,0,0])rotate_extrude(convexity=1)translate([5,0])difference(){
circle ( [1,1]);
translate([1,0])square ( [2,2],center=true);
}

