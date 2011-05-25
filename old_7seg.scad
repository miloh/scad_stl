// new 7 segment design
// r.m.a 5-16-2011
// cc-sa



7seg_size=50;   //  this controls the size of the longest dimension, typically the height of the 7 segment
g_ratio = 1.618;  // this ratio and 7seg_size helps determine subsequent dimensions

wall_size = 3;    // the whole point of parametizing this display is to keep wall size constant as overal dimensions grow.   led_size probably 	
led_size = 3;      // this is for mating the leds to the display.  3mm and 5mm leds are typical.




union(){ 
	7segment();
	difference(){
		square([50,25],center=true);
		square([48,23],center=true);
	}

}




module 7segment(){

	translate([25/2,0])rotate(45)7seg_wall_interior();
	translate([-25/2,0])rotate(45)7seg_wall_interior();
	rotate(90)polygon(points= [[-12.5,-0.75],[12.5,-0.75],[12.5,0.75],[-12.5,0.75]], paths=[[0,1,2,3]]);

	module 7seg_wall_interior(){
		union (){
		rotate(0)translate([-17.68,-0.75])bar();
		rotate(90)translate([-17.68,-0.75])bar();
		rotate(45)square (size= 12.5, center=true );
	 	}
	}

	module bar(){
	polygon(points= [ [0,0],[35.36,0], [35.36,1.5],[0,1.5]], paths=[ [0,1,2,3]]);
	}
}

