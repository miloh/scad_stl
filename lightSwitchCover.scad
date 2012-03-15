// Light switch cover
// thing for rotary switches
// by ftoad, 08/24/2011
// 

//************Variables**********************************************************

padding = 0.1;
inner_circ_od = 10.10;
inner_circ_id = 6;
inner_circ_notch = 3.80;
outer_circ_diameter = 40;
skirt_addition = 5;
height = 12.25;
thickness = 2;
proportion = 2.5; // this is the slot proportion thingy distance..  is it half?  is it less?  is it more? 
fa_tune=3;  // what is $fa? 
fs_tune =0.1;   // what is $fs?  

//************Modules **************************************************************

translate([0,0,height/2.2]){ 
 union(){
 cylinder(thickness,outer_circ_diameter/2-thickness,outer_circ_diameter/2-thickness,center=true,$fa=fa_tune,$fs=fs_tune);
 translate([0,0,.2])cylinder(thickness*1.7,outer_circ_diameter/2-thickness,0,center=true,$fa=fa_tune,$fs=fs_tune);
}}

difference(){
 cylinder(height+thickness,outer_circ_diameter/2,outer_circ_diameter/2-thickness,true,$fa=fa_tune,$fs=fs_tune);
 cylinder(height+thickness+padding,outer_circ_diameter/2-thickness,outer_circ_diameter/2-2*thickness,true,$fa=fa_tune,$fs=fs_tune);
}
difference(){
 cylinder(height,r= inner_circ_od/2,center=true,$fa=fa_tune,$fs=fs_tune);
 cylinder(height+padding,r= inner_circ_id/2,center=true,$fa=fa_tune,$fs=fs_tune);
}

difference(){
cylinder(height,r= inner_circ_id/2,center=true,$fa=fa_tune,$fs=fs_tune);
translate([height/proportion,0,0]){cube(size= height+padding,center=true,$fa=fa_tune,$fs=fs_tune);}
}



//************Build**************************************************************
