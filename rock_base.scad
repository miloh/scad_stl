// light sensitive rock shines in the darkness.  sold at ikea circa 2015 2016
// this is the base useful for CSG, so one can fabricate new cover structures for it

$fn = 200;
eps = 0.1;

// measurements for the base of an ikea light rock, 2016
outer_diameter = 125.5;  // all units mm
outer_diameter_lip = 1.52;
rim_height = 1.52;
outer_height = 22.8 - rim_height; 
light_module_diameter = 10;


// base for a ikea light rock
module ikea_light_rock() 
    {
    union()
      {
      cylinder(r=outer_diameter/2,h=outer_height);
      cylinder(r=outer_diameter/2+outer_diameter_lip, h =1.15);
      translate([0,0,outer_height])sphere(r=light_module_diameter,center=true);
      }
    }

// call up the module
//ikea_light_rock();

