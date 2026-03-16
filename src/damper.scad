include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=128;
// Aqara T1 Shutoff Valve
frame = 42;
span = 31;
thick = 17.5;
shank = 23;
post = 35;

module mirror2(v) {
    children();
    mirror(v) children();
}
module base() {
  difference() {
     hull() { 
         cuboid ([frame,frame,thick], rounding=5, edges="Z"); 
         translate([post,0,0]) cylinder(thick,d=20, center=true);
     } // frame
     cylinder(d=shank,h=thick,center=true); // cutout for shaft shank
     mirror2([0,1,0]) mirror2 ([1,0,0]) translate([span/2,span/2,0]) screw_hole("M3,17.5",head="socket",counterbore=3); // mount holes
     translate([post,0,0]) screw_hole("M5", length=thick);
     translate([-frame/2+3/2,frame/2-3/2,10]) cuboid ([frame,frame,thick], rounding=5, edges="Z");
     }
}
base();  // mount