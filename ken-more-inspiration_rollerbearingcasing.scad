// July 2015, by ftoad cc-na
// Ken-more something something Inspiration
// bearing roller for the ends of the spinning bristle thing 
// works, but causes the rest of the machine to melt because it's so good.
// just buy a new vac-uum mac-hine

//internal part is a steel shaft with steel 6xx bearing.  
//2 printed parts enclose this part and become part of the bristle thing assembly

$fn = 140;
e = 0.05;

// SOME VARS

// radial bearing dimensions, units in inches
bearing_bore =  1/4.0 * 25.4; // converted to mm
bearing_OD = 5/8.0 * 25.4; // converted to mm
bearing_thickness = 6; // mm
shaft_diameter = 1/4.0 * 25.4; // converted to mm, shaft has knurling for grip
shaft_length =  1 * 25.4;   // converted to mm
ringcover_diameter = 1 *25.4; // converted to mm

square_peggy =  7/16*25.4 ; // smokey chicken square
square_side = 42 ; // mm
chamfer_length = 23 ; // mm
peggy_height = 3; // mm
square_side_height = 1; // mm
cylinder_height = 4; // mm this cylinder rotates close to partB
outer_diameter = 42; // mm
inner_wheel_diameter = 39; // mm, don't use this value as is, use some fractional amount to have a thick ring
knurl_wheel_diameter = 7/16.0 * 25.4; //  mm
bearing_pressfit_housing_diameter =  26.0; // mm
bearing_pressfit_housing_height = 10.0; // mm
 
// OB'ECT D'ART

partA();
translate([0,0,-9.5])rotate([180,0,0])partB();

//**********************************
// MODULES
//***********************************

// this part requires a precise press fit onto the bearing assembly
module partA(){
  difference(){
  // union of the main body of the part
    union(){
      translate([0,0,25.0/2])cylinder(r= knurl_wheel_diameter/2.0, h=25.0 ,center=true);
      translate([0,0,bearing_pressfit_housing_height/2])cylinder(r= bearing_pressfit_housing_diameter/2.0,h= bearing_pressfit_housing_height+e,center=true);
      translate([0,0,cylinder_height/2])cylinder(r=(inner_wheel_diameter-5)/2.0-e*4,h=cylinder_height,center=true);
    }
  // union of the parts to remove for the ring fit and the bearing press fit
    union(){
      translate([0,0,bearing_thickness/2])cylinder(r=bearing_OD/2+3.5+2*e,h=bearing_thickness+2,center=true);
      translate([0,0,25.0/2])cylinder(r=shaft_diameter/2+e*4,h=25.0+e,center=true);
    }
  }
}
 

// this part requires a precise fit onto the vacuum roller head
module partB(){
  // this following intersection of the main object and the last cyilnder chamfers the corners with a circular shape
  intersection(){
  // unions of the outside shapes 
    union(){
      translate([0,0,square_side_height/2-e])cube([square_side,square_side,square_side_height],center=true); // outer square
      translate([0,0,(peggy_height+square_side_height)/2-e])cube([square_peggy-e,square_peggy-e,peggy_height],center=true);// inner peggy
  // remove the outer annulur ring fit
        difference(){
          translate([0,0,-bearing_thickness/2+e])cylinder(r=bearing_OD/2+3,h=bearing_thickness,center=true); // bearing holder
          translate([0,0,-bearing_thickness/2+2*e])cylinder(r=bearing_OD/2+e*2,h=bearing_thickness,center=true); // bearing holder
	}
 // remove the inner cylinder bearing press fit 
        difference(){
        translate([0,0,-cylinder_height/2])cylinder(r=outer_diameter/2.0,h=cylinder_height,center=true);
        translate([0,0,-cylinder_height/2-e])cylinder(r=(inner_wheel_diameter-4)/2.0,h=cylinder_height+e,center=true);
        }
      }
  cylinder(r=24,h=square_side_height+peggy_height+cylinder_height,center=true);
  }
};
