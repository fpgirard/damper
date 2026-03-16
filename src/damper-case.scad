include <BOSL2/std.scad>
$fn=128;

// Mount offset
w  = 61; l = 41; h = 16;    // x,y,z
usb_w = 12; usb_l = 17; usb_h = 12;
hole_w = 31; hole_l = 31;
wire_w = 14; wire_l = 10; wire_h = 6;
wall = 2.5;
post_d = 9; post_h = 6;
mag_d = 12.5; mag_h = 3;
floor = 3;

module mirror2(v) {
    children();
    mirror(v) children();
}
module base() { 
   difference() { 
       union() {
           difference() {
               cuboid([w+2*wall,l+2*wall,h+2*wall], rounding=5, edges="Z"); 
               translate([0,0,floor]) cuboid([w,l,h+6]);  } // main cabin}
           translate([7.5/2-1.5,0,.5]) { //posts
              for ( i = [-1,1] ) {    // Feet
                 for (j=[-1,1]) {
                    translate([i*(hole_w)/2,j*(hole_l)/2,-11]) {
                        cylinder(post_h,d=post_d);
                    }    
                  }
              }
           }
       }        
       translate([w/2,0,2]) rotate([0,90,0])cuboid([usb_w,usb_l,usb_h],rounding=3);   // power connectors
       //translate([5,l/2,-1]) cuboid([wire_w,wire_l,wire_h],rounding=2);   // motor wires!
       translate([0,0,-13]) cylinder(mag_h,d=mag_d);   // magnet
       translate([7.5/2-1.5,0,1.5]) {
         for ( i = [-1,1] ) {    // holes that penetrate box and posts
            for (j=[-1,1]) {
              translate([i*(hole_w)/2,j*(hole_l)/2,-14]) {
                  cylinder(post_h+3,d=4.9);
                    
              }
            }
         }
       }
    }
}
module cap() {
  difference() {
      union() {
        cuboid([w+2*wall,l+2*wall, wall], rounding=5, edges="Z"); 
        translate([0,0,2]) cuboid([w,l,wall]); // main cabin}
      }
      translate([w/2-22.5,-l/2+12,0]) cuboid([13,6,22]);
      translate([-25,0,-wall+1]) {
        linear_extrude(1) {
          rotate([0,0,90]) mirror([1,0,0]) text("VAL3000", size=6, valign="center", halign="center",direction="ltr");}}
    
  }
}
translate([0,60,0]) cap();
base();