// looking at minkowski function


$fn = 60;

module poly_rect(width, height) {
polygon( points= [ [-width/2,-height/2] , [width/2,-height/2], [width/2,
height/2],[-width/2, height/2]], convexity=5);
}

module poly_rect_minkowski(width, height, minkowski_size) { 
polygon( points= [ [-width/2+minkowski_size,-height/2+minkowski_size] , [width/2-minkowski_size,-height/2+minkowski_size], [width/2-minkowski_size, height/2-minkowski_size],[-width/2+minkowski_size, height/2-minkowski_size]], convexity=5);
}

translate([40,0,0])
minkowski(){
square(10,center=true);
color("red")circle(1);
}


translate([20,0,0])minkowski(){
    union(){
      poly_rect(10,3);
      circle(2);
    }
    circle(1);
}


translate([0,0,0])minkowski(){
    union(){
      poly_rect_minkowski(10,3,1);
      circle(2);
    }
    circle(1);
}

