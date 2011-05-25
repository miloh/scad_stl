//vars

length	= 50;
width 	= 31;
height	= 8.5;
inset		= 3;
offset 	= 2;
led_size	= 5;
thickness	= 0.8;
led_socket_ratio  = 2.3;


//  build a breadboard sized golden ratio  seven_segment LED top
// the function recieves led_size in mm as its input

led_sevSeg(5);

translate([10,10,10])led_socket();

// modules:
module led_sevSeg(led_size){
// the led_sevSeg module is composed of a solid recangle base with thin 8mm layers along the segments for light penetration, thick interfaces between the layers to prevent leaking from cell to cell, and LED holders

difference(){
cube([length, width, height]);
translate([inset/2,inset/2,thickness]) cube([length-inset, width-inset, height+offset-thickness]);
}


}

module  led_socket(){
	difference(){
	cylinder(h =  led_size,r1=led_size/2*led_socket_ratio, r2=led_size/2,$fa=1,$fs=0.2);
	translate([0,0,0]) cylinder(h = led_size, r=led_size/2,$fa=1,$fs=0.2);
	}
}


for 
translate([0,0,25])seg_trap();

module seg_trap(){
	polygon(points=[[0,0],[21,0],[16,-5],[4,-5]], paths=[[0,1,2,3]]);

}
//for {
//  rect1  big outside rect


// rect2 to remove fromrect1, leaving shell


// trapezoid, extruded
// mirror to 4 traps facing in on a square
