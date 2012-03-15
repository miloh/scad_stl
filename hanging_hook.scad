
// Hang your coat for Bill 
// hanging_hook part
// by ftoad, 08/24/2011
// 

//************Variables**********************************************************

padding = 0.1;
rect_points = [[0,0], [16.45,0],[20,32],[16.45,69.78],[0,69.78],[-3.65,32]];  // turn this into the appropriate variable type
rect_path =[[0,1,2,3,4,5]] ;

square_points = [[0,0], [0,13.78],[16.84,13.78],[16.84,0]];
square_path = [[0,1,2,3]];
profile= 5;
fn_rule = 100;

hook_points = [[0,0],[6,0],[6,10],[4,15],[2,15],[0,10]];
hook_path = [[0,1,2,3,4,5]];

//************Modules **************************************************************



module base(){
   polygon(points= rect_points,paths=rect_path );
 } 

module inner_square(){
   polygon(points=square_points,paths=square_path);
}


module hook(){
   polygon(points = hook_points, paths=hook_path);
}


//************Build**************************************************************


difference(){
  linear_extrude(height=profile, $fn=fn_rule){
  base();
  }
  translate([0,20,-padding]) {
     linear_extrude(height=2*profile,$fn=fn_rule){
     inner_square();
     }
  }
}


    translate([5,15,profile]){
          linear_extrude(height=3,twist=0){
             hook();
          }
    }


