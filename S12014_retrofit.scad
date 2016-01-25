
// universal values
$fn = 30;
eps = 0.1;

// rough measurements from a S1 2014 3D printer
machine_height = 563;  // measured from metal body without acrylic sidepanel
machine_depth = 467; // measured from top arms to back.
machine_width = 435;  // measured between metal body arms
arm_height= 58; // metal body arms measured along outside top to lower side 
arm_width = 41;  // metal body arms measured across the top
side_panel_mount_screw_dist_TB = 501;  // top to bottom
side_panel_mount_screw_dist_FB = 371;   // front to back



// S1 2014 retrofit improvements checklist
//
//replace the wiring for motion
//brace the arms for tramming - allow controlled hoz and ver alignment over +/-4mm
//replace the build platform insert with a 3 point mounter version
//upgrade the gantry to reduce vibration
//replace the platform with 3 point system for easy adjustment
//drill out a set of mounting holes on the back
//fasten the vertical rods at the back of the machine
//reduce dust, debris and thermal interferance




module brace_arm(length=2,thickness=1,brace_OD=1,brace_ID=0.25){
    difference(){   
        hull(){
           translate([length/2,0,0] )cylinder(r=brace_OD/2,h=thickness);
           translate([-length/2,0,0])cylinder(r=brace_OD/2,h=thickness);
        }
        union(){
            hull(){
               translate([length/2+5,0,-thickness/2] )cylinder(r=brace_ID/2,h=thickness*2);
               translate([length/2-5,0,-thickness/2] )cylinder(r=brace_ID/2,h=thickness*2);
            }
           translate([-length/2,0,-thickness/2] )cylinder(r=brace_ID/2,h=thickness*2);
  
            hull(){
            translate([length/2-25,0,thickness/2])rotate([0,90,0])cylinder(r=brace_ID/4,h=brace_ID+26);
            translate([length/2-25,0,thickness])rotate([0,90,0])cylinder(r=brace_ID/4,h=brace_ID+26);
            }
                }
    }
}
    
brace_arm(side_panel_mount_screw_dist_TB,12,25,12);
