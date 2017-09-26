// functions for working with sphere surfaces in openscad
// 
$fn = 12;
eps = 0.01;

use <orient_to.scad>
// given lat and long pair, output xyz cartesian coord 

// converts lat long to cartesian
// todo: add validators for latitude (values between [-90:90] and longitud[-180:180]
function latlong_to_cartesian(lat,lon,r) = [ r*cos(lat)*cos(lon),r*cos(lat)*sin(lon), r*sin(lat) ];

// converts polar to cartesian
//  phi = polar or zenith angle or colatitude, theta = azimuthal, or projection on XY, r = radius
function spherical_polar_to_cartesian(phi,theta,r) = [ r*sin(phi)*cos(theta),r*sin(phi)*sin(theta), r*cos(phi) ];

// uniform distribution on a sphere, valid inputs only between 0 1 
// todo: add validator for x between 0 and 1
function sphere_uniform_dist(x) = acos(2*x - 1);

// given radius and an n sided polyhedra, return points in every grid of area A = 4*Pi*r^2
// given a radius and number of points, gives a grid of regularly spaced x,y,z points
function sphere_ngon_points(radius,ngon_vertices) = spherical_polar_to_cartesian(0,360/num_points,radius);

// todo:  add functions to output efficient arrays to be used in poission disc distributions
// add functions for mitchell's algorithim for poission disc distribution


// testing output, decomment to test
//echo("latlong_to_cartesian(0,0,1)", latlong_to_cartesian(0,0,1));
//sphere(ball_radius);
//#translate(latlong_to_cartesian(30,180,ball_radius))sphere(r=1);

ball_radius = 20;
little_ball_radius = 0.1;
little_circle_radius = 2;
height = 20;
shell_thickness = 0.5;
iterations = 525;
seed = 42;
thetans = rands(-180,180,iterations,seed);
phis = rands(0,180,iterations,seed*2);
r_vect_3 = rands(0,1,iterations,seed*2);

// cones randomly placed on a sphere 
    for(i=[0:iterations-1])
    {
     color([i/526,i/526,0])orient_to(spherical_polar_to_cartesian(sphere_uniform_dist(r_vect_3[i]),thetans[i],ball_radius),spherical_polar_to_cartesian(sphere_uniform_dist(r_vect_3[i]),thetans[i],ball_radius))cylinder(r1=little_circle_radius,r2=0.01,h=height);
    }



// some work with curved slices of spheres
//difference(){
//  union(){
//    for(i=[0:iterations-1])
//    {
//      translate(sphercial_polar_to_cartesian(uniform_dist(r_vect_3[i]),thetans[i],ball_radius))sphere(little_ball_radius);
//    }
//  }
//    sphere(ball_radius-shell_thickness/2);
//  union(){
//    difference(){
//      sphere(ball_radius+little_ball_radius*2);
//      sphere(ball_radius+shell_thickness/2);
//    }
//  }
//}
