//uncomment the following
//translate([3,3,3])
//rotate(a=acos(1/(sqrt(3))),v=[0,1,0])
//rotate(a=asin(1/(sqrt(2))), v=[0,0,1])
//  cube([1,1,1]);
//
//translate([3,3,3])rotate([45,-35  ,0])
//cube([1,1,1]);

// about rotate:
//using arotate(a,v) in openscad can be confusing
// 1. create solid/object in opnescad
//2. visualize rotation you want and get axis of roation from that movement
// 3. place right hand to determine orientation of this axis of rotation
//4. build a vector along this axis, this goes into the 'v'
// 5. determine amount of rotation using trig or other methods, note use of math functions below in orieinting the cube body diagonal to the Z axis
// 6. perhaps visual that show the axis of rotation would help people who learn openscad 

//uncomment the following example
//translate([2,2,2])rotate(a=90-atan(1/sqrt(2)),v=[1,-1,0])
//    cube(1);
    
// a chandelier built from series cubes oriented to Z axis long their body diagonals, cutouts are spheres

////sphere(r=0.75,$fn=40);
//translate([0,0,0.87])sphere(r=0.7,$fn=40);
//
//}

//difference(){
//for(i=[0:10:360]){
//    rotate([0,0,i])
//rotate(a=90-atan(1/sqrt(2)),v=[1,-1,0])
//    difference(){
//    cube(size=1,center=true);
//    sphere(r=0.5 ,$fn=80);
//    }    
//   }
//translate([0,0,-1])sphere(r=0.65, $fn=80);
//   }

module wordcube(size,string="CUBE"){
	union(){
		cube(size=size);
		translate([0,size-size/8,size])rotate([0,0,0])linear_extrude(height=2)text(string);
		translate([size,0,size-size/8])rotate([90,0,90])linear_extrude(height=2)
		text(string);
		translate([size-size/8,size,0])rotate([-90,-90,0])linear_extrude(height=2)
		text(string);
	}
}




// the ultimate rotated cube body diagonal rotated chandileir object
// note the hyperbolic parabloids!
for(i=[0:30:90]){
    rotate([0,0,-i])
   difference(){
       scale([1,1,1.5])rotate(a=90-atan(1/sqrt(2)),v=[1,-1,0])
	   wordcube(100,"");
//   interior carving
   translate([0,0,135])scale([1.0,1.0,1.50])sphere(r=61.0,$fn=37); 
   // sbase
   sphere(r=50,$fn=10);
   }
}
