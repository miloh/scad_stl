$fn=70;
ring_radius=1.5;
annulus_diameter=30;
oval_width_diameter=22;
oval_height_diameter=33;
set_tip=0.1;


module zomelet_holder(){
    difference(){
      scale([0.8,1.0,1.3])rotate_extrude() translate([(annulus_diameter/2)+ring_radius,0,0]) circle(r=ring_radius);
      union(){
	mirror([0,1,0])rotate([90,0,0])
	cylinder(r1=oval_width_diameter/2,r2=set_tip,h=oval_height_diameter/2);
	rotate([90,0,0])
	cylinder(r1=oval_width_diameter/2,r2=set_tip,h=oval_height_diameter/2); 
	}
    }	
//for visual reference, this is the rough shape of the zomelet
rotate([90,0,0])scale([1,1,33/22])sphere(r=22/2);
}

//print this one 'part A'
difference(){ 
    %scale([1.05,1.05,1.05])zomelet_holder(); 
    %scale([1.1,1.1,1.0])rotate([0,90,0])zomelet_holder(); }

// and print this one 'part B'
//scale([1.05,1.05,1.05])rotate([0,90,0])zomelet_holder();
