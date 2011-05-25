pad = 0.1;	// Padding to maintain manifold
ch = 15;
cr = 20;
ct = 2;
r = 4;
smooth = 180;	// Number of facets of rounding cylinder

// Inside Fillet
difference() {
	rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r+pad,ct-pad,0])
			square(r+pad,r+pad);
	rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r,ct+r,0])
			circle(r=r,$fn=smooth);
}