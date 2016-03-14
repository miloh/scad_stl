$fn=35;

module orient_to(origin, normal) {   
      translate(origin)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      children();
}


// testing
//pointA = [1,0,5];
//pointB = [1,3,7];
//
//color([1,0,0])translate(pointA) sphere(r=0.1);
//
//color([0,0,1])translate(pointB)sphere(r=0.1);
//
//orient_to(pointA,pointB-pointA)cylinder(r=0.1,h=norm(pointB-pointA));

