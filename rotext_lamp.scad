outerdiameter=50;
height=100;

//
rotate_extrude($fn=20,convexity=10)
translate([outerdiameter/3,0,0])
scale([4,4,10])
rotate([60,60,90])
circle($fn=18,r=5);



