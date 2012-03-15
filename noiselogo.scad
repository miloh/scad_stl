// rma 
//  noisebridge logo  5/21/2011




//noisecoin();


translate([-24,-6,0])scale([,1,0])dxf_linear_extrude(
						file = "noiselogo_inner.dxf",						
						height = 5,
						convexity = 1,
						center=true);

//module noisecoin(){
//translate([0,0,3])logo();
//translate([35.7,52.3,0])cylinder(h = 3, r = 32.6, center = false,$fn=300);
//}
//
//
//
//
//
//
//scale([1,1,0])dxf_linear_extrude(file="noiselogotest.dxf",layer="Circuit",height=5,center=false);
//
//
//
//
//module circlet(){ 
//dxf_linear_extrude(file = "noiselogo.dxf", layer="Circle",
//  height = 5, center = false);
//}
