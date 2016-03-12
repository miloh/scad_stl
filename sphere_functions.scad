// functions for working with sphere surfaces in openscad
// 

// given lat and long pair, output xyz cartesian coord 
// note the earth is not spherical this will 

// testing variables, decomment and alter to test
$fn = 20;
ball_radius = 10;

// converts lat long to cartesian
// todo: add validators for latitude (values between [-90:90] and longitud[-180:180]
function latlong_to_cartesian(lat,lon,r) = [ r*cos(lat)*cos(lon),r*cos(lat)*sin(lon), r*sin(lat) ];

// converts polar to cartesian
//  phi = polar or zenith angle or colatitude, theta = azimuthal, or projection on XY, r = radius
function polar_to_cartesian(phi,theta,r) = [ r*sin(phi)*cos(theta),r*sin(phi)*sin(theta), r*cos(phi) ];

// uniform distribution on a sphere, valid inputs only between 0 1 
// todo: add validator for x between 0 and 1
function uniform_dist(x) = acos(2*x - 1);

// todo:  add functions to output efficient arrays to be used in poission disc distributions


// testing output, decomment to test
//echo("latlong_to_cartesian(0,0,1)", latlong_to_cartesian(0,0,1));
//sphere(ball_radius);
//#translate(latlong_to_cartesian(30,180,ball_radius))sphere(r=1);

// random distribution of N points over a sphere with radius R
// generate N random points between 

// uses rands
// 
// rands()
// params:  min_value, max_value, value_count, seed_value 

single_rand =  rands(0,1,1)[0];
echo(single_rand);
seed = 42;
iterations = 1000;
thetans = rands(-180,180,iterations,seed);
phis = rands(0,180,iterations,seed*2);
r_vect_3 = rands(0,1,iterations,seed*2);

//echo("Random Vector 1: ", random_vect_1);
//echo("Random Vector 2: ", random_vect_2);
//sphere(ball_radius);
//echo(phis);
//for (i=[0:iterations-1]){
//echo("random vector base: ",(r_vect_3[i]));
//echo("uniform distribution from random vector base:" ,uniform_dist(r_vect_3[i]));
//}


difference(){
union(){
for(i=[0:iterations-1])
{
   // regular distribution
//   translate(polar_to_cartesian(phis[i],thetans[i],ball_radius))sphere(r=1);
   // uniform distribution
   translate(polar_to_cartesian(uniform_dist(r_vect_3[i]),thetans[i],ball_radius))sphere(r=0.6);
}
}
sphere(ball_radius-0.1);
union(){
difference(){
sphere(ball_radius+1);
sphere(ball_radius+0.1);
}
}
}
