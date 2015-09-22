eps = 0.1;
$fn=10;

//muggy params
mug_od = 83;
mug_height = 100;
rim_thickness = 5;
// muggy derived params

mug_id = mug_od - rim_thickness*2;
module minkowskimug(){
	
minkowski(){
difference(){
cylinder(r=mug_od/2,h=mug_height);
translate([0,0,rim_thickness])cylinder(r=mug_id/2,h=mug_height+eps);
}
sphere(1);
}
}
module  nominkowskimug(){
$fn=80;
difference(){
    union(){
		translate([0,0,mug_height])
		rotate_extrude()
		translate([mug_od/2-rim_thickness,0,0])
		circle(r=rim_thickness);
        cylinder(r=mug_od/2,h=mug_height);
     }
     translate([0,0,rim_thickness])cylinder(r=(mug_id-rim_thickness)/2,h=mug_height+eps);
}
}


scale([1,1,1])
translate([mug_od/2,0,mug_od/1.5])
rotate([90,0,0])
rotate_extrude($fn=40,convexity=10)
scale([5,1,1])
translate([mug_od/3,0,0])
rotate([45,45,45])
circle($fn=40,r=10);


nominkowskimug();
//
//module mugprofile(){ polygon( points=[[0,0],[mug_od/2,0],[mug_od/2,mug_height],[mug_od/2-rim_thickness,mug_height],[mug_od/2-rim_thickness,rim_thickness],[0,rim_thickness],[0,0]] );
//}
//
//
//
//
//
//rotate([90,0,0])minkowski(){	
// 	mugprofile();
//	circle(1);
//}

//
//difference(){
//    circle(r=10);
//    square(10);
//}
