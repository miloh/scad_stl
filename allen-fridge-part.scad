// Al's Fridge part.
// fixing a handle


// Measurements derived from a series of projection drawings in
// SAVE_20151129_190751.jpeg

// due to blurry image, assume precision is no better 
// than 0.25 square quadrille  or ~1.25mm

// break out top outline points for later adjustment
// draw half the graph and mirror it, assuming symmetry
// going clockwise from the lower mid center of the 'top' projection 
pointA = [      0.0   ,  0 ];
pointB = [ -2/5*25.4   , 0 ];
pointC = [ -2/5*25.4   , 6.2/5*25.4 ];
pointD = [ -2.5/5*25.4 , 6.2/5*25.4 ];
pointE = [ -2/5*25.4   , 9/5*25.4   ];
pointF = [       0.0   , 9/5*25.4   ];


// break out right outline points
// complete contour for this projection
// going clockwise from the lower left corner of the 'right' projection 
pointG = [      0.0   ,  0 ];
pointH = [      0.0  , 1.4/5*25.4   ];
pointI = [ 7.5/5*25.4  , 1.4/5*25.4 ];
pointJ = [ 8.5/5*25.4 , 1.0/5*25.4 ];
pointK = [ 8.5/5*25.4  , -0.6/5*25.4   ];
pointL = [ 7/5*25.4    , -0.6/5*25.4   ];
pointM = [ 6/5*25.4    , 0.4/5*25.4   ];
pointN = [ 3.2/5*25.4    , 0.4/5*25.4   ];
pointO = [ 3.2/5*25.4    , 0   ];

intersection(){
linear_extrude(height=6/5*25.4){
    union(){
      polygon(points = [pointA,pointB,pointC,pointD,pointE,pointF], convexity=10);
      mirror(){
        polygon(points = [pointA,pointB,pointC,pointD,pointE,pointF], convexity=10);
        }
    }
}

translate([-12,0,4])rotate([90,0,90])
linear_extrude(height=5/5*25.4){
    union(){
      polygon(points = [pointG,pointH,pointI,pointJ,pointK,pointL,pointM,pointN,pointO], convexity=10);
    }
}
}
// add a function for all of these quadrilles to mm conversions 
// that we are using
// reminder  of how to build a function in openscad:
// function name ( parameters ) = value ;)
function quadrille_to_mm(quadrilles) =  quadrilles/5*25.4;
function q_2_mm(quadrilles) =  quadrilles/5*25.4;

module trapezoid(){
  linear_extrude(height=2/5*25.4){
   polygon(points =
   [[0,0],[q_2_mm(2.5),0],[q_2_mm(2),q_2_mm(2)],[q_2_mm(-2),q_2_mm(2)],[q_2_mm(-2.5),0]],convexity=10);
  }
}


#trapezoid();
