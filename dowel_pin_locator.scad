// dowel pin locdator design.

$fn=35;

ir = 0.25;
or = 0.75;
fab_or = 1;
theta = 360/8;
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ...], convexity = N);

module tine(){
  union(){
  linear_extrude(0.01)polygon( [[0,0], [or*cos(theta),or*sin(theta)], [or*cos(-theta),or*sin(-theta)]]);
  translate([or,0,0.22])rotate([0,-90,0])translate([-or,0,0.22])linear_extrude(0.01)polygon( [[or*cos(theta), or*sin(theta)],[or*cos(-theta), or*sin(-theta)], [fab_or*cos(0),fab_or*sin(0)]]);
  }
}
//tine();
// for(variable = [start : increment : end])

for (phi =[0:359/45]) {
  if (phi % 2 == 0 ){
    rotate([0,0,phi*90])rotate([180,0,0])tine();
  }
  else  { 
    rotate([0,0,phi*90])rotate([0,0,0])tine();
  }
}


