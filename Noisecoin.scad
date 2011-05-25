// rma 
//  noisebridge logo  5/21/2011


coin();


module coin(){
union(){
	translate([0,0,4])logo();
	translate([35.7,52.3,0])cylinder(h = 4, r = 32.9, center = false,$fn=100);
	
	}
}


module logo(){ 

linear_extrude(file = "Logo2.dxf",
  height = 6,convexity=5, center = false);
}


