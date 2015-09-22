$fn=30;
eps = 0.1;
lampheight=140;
top_aperture=42;
//cylinder(r1=140,r2=42, h=lampheight);

//module sconce(lampheight=140){
//    difference(){
//      union(){
//	    translate([0,0,10])cylinder(r1=lampheight/2-10,r2=top_aperture, h=lampheight);
//        scale([2,2,1.5])  translate([0,0,20])  sphere(r=lampheight/2);
//        scale([2,2,-1.5])  translate([0,0,-20])  sphere(r=lampheight/2);
//	  }
//      union(){
//		  translate([0,0,-lampheight*5/2])cube(lampheight*5,center=true);
//		  cylinder(r=top_aperture,h=lampheight*2);
//      }
//    }
//}
////
////
//difference(){
//sconce(lampheight=140);
//sconce(lampheight=137,top);
//}


difference(){
    difference(){
	scale([1,1,-1.5])  translate([0,0,-20])  sphere(r=lampheight/2);
	scale([1,1,-1.5])  translate([0,0,-20])  sphere(r=lampheight/2-1);
	cylinder(r=top_aperture/2,h=lampheight*2);
	 translate([0,0,-lampheight*5/2])cube(lampheight*5,center=true);
	}
//	union(){
	//	for (i=[0:15:359])
        rotate([0,0,0])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,30])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,60])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
        rotate([0,0,90])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,120])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,150])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
        rotate([0,0,180])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,210])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,240])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
        rotate([0,0,270])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,300])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	rotate([0,0,330])scale([1,1.5,9])  translate([lampheight/2+0.5,0,1])  sphere(r=2);
	
	//	for (i=[0:15:359])
      ///    rotate([0,0,i])translate([lampheight/2,0,0])scale([1.6,1.0,1])  sphere(r=lampheight/10);
//	    for (i=[0:30:359])
//			rotate([0,0,i])scale([0.5,0.5,0.5])  translate([100,100,lampheight*1.69])  sphere($fn=5,r=lampheight/16);
//	}
}
        //scale([2,2,-1.5])  translate([0,0,-20])  sphere(r=lampheight/2);
	
	
//		for (i=[0:15:360])
//			%rotate([0,0,i])scale([1,1,1])  translate([50,50,10])  sphere(r=lampheight/2);
	
