bowl = 50;
bowl_r = 50;
stem = 60;
stem_r = 5;
neck_r = 10;
thickness = 2;

curve_r = 10;

$fa = 5;
$fs = 0.1;
eps = 0.01;

module profile() {
        hull() {
                translate([stem_r, 0])
                        square([thickness, eps]);

                translate([neck_r + curve_r, stem])
                        circle(r = curve_r);

                translate([bowl_r, stem + bowl - eps])
                        square([thickness, eps]);
        }
}

rotate_extrude()
        difference() {
                profile();
                translate([thickness, 0])
                        profile();
        }

