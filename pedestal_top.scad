// pedestal cut plan
// top part
// by ftoad, 05/17/2012
// CC-SA 

// top of the t slot pedestal for type a machines series one prototypes
// designed for the makerfaire 2012
// other parts: shelf & base, L side & R side, and Front

//************Variables**********************************************************
// top of the pedestal is 22x22 inches
// all units convert from mm to inches for output


mm_per_inch=25.4
inches_per_mm = 
mm_to_inch= (1/25.40

top = [ [0,0],[33,0],[33,33],[0,33],[0,0]];
top_paths = [0,1,2,3,4];

polygon(points = top,paths = top_paths, convexity = N);


//*************************************************************************
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ... ], convexity = N);


//polygon(points = hinge_cap_points , paths =   hinge_cap_path , convexity = N);



//module t_slot(){
	
//}
