// a hat for noisebridge
// based on the twirl hat by Chris K Palmer
// http://www.thingiverse.com/thing:30000
// note: object needs to to be edited to be manifold for openscad export

// define a $fn for facets in curves, change based on render time & output requirements
$fn=45;
eps=0.1;
use <arrayPolar.scad>

// orient_to is used for aligning the logo later to the imported stl part
module orient_to(origin, normal) {   
      translate(origin)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      children();
}

// import the stl part, in this case, a hat by CKP
translate([0,0,0])import("spiralhat6.stl",convexity=3);

// pointA and pointB are used to define where the logo should be placed --
// at [88,-3,100] and [95,-3,100], it is 
pointA = [85,-3,102];
pointB = [89,-3,104];
pointC = [-36,65,102];
pointD = [-39,69,105];
pointE = [-38,-74,102];
pointF = [-39,-77,104];
// comment out the following two lines for the final output
//translate(pointA)color([1,0,0])sphere(r=2);
//translate(pointB)color([0,0,1])sphere(r=2);
//translate(pointC)color([1,0,0])sphere(r=2);
//translate(pointD)color([0,0,1])sphere(r=2);
//translate(pointE)color([1,0,0])sphere(r=2);
//translate(pointF)color([0,0,1])sphere(r=2);

//this is it! a hat with 3 noisebridge logos nicely spaced along its facets.
difference(){
  translate([0,0,0])import("SpiralHat6_r.stl",convexity=3);
    union(){
      orient_to(pointA,pointB-pointA)#rotate([0,0,90])scale([0.5,0.5,1])translate([-25,-6,0])linear_extrude(5)import("noiselogo_inner.dxf",convexity=4);
      orient_to(pointC,pointD-pointC)rotate([0,0,90])scale([0.5,0.5,1])translate([-25,-6,0])linear_extrude(5)import("noiselogo_inner.dxf",convexity=4);
      orient_to(pointE,pointF-pointE)rotate([0,0,90])scale([0.5,0.5,1])translate([-25,-6,0])linear_extrude(5)import("noiselogo_inner.dxf",convexity=4);
  }
}

// advanced: use the arrayPolar function http://github.com/miloh/scad_stl/arrayPolar.scad to build a 'crown' of logos on the hat
//arrayPolar(count=10,arc=360,radius=100)
