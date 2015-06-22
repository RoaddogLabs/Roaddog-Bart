// Prusa i3 lm8uu holder

$fn=0;
$fa=0.1;
$fs=0.3;

bearing_diameter=15;
bearing_length=24;
wall_thickness=2;
hole_spacing=20;
hole_diameter=3.5; //M3
screw_head_diameter=6;

module bearing_holder()
{
  difference(){
  rotate([0,90,0])
  translate([-bearing_diameter/2-wall_thickness-2, 0, 0])
    cylinder(h=bearing_length, r=bearing_diameter/2 +wall_thickness, center=true);

  rotate([0,90,0])
  translate([-bearing_diameter/2-wall_thickness-2,0,0])
    cylinder(h=bearing_length+1, r=bearing_diameter/2, center=true);

  translate([0,0,bearing_diameter])
  cube([bearing_length+2, 4, 15], true);

  }
} 

module mounting_plate()
{
  difference(){
  translate([0,0,2])
  cube ([bearing_length,hole_spacing+(hole_diameter*2) +4,4], true);

  rotate([0,90,0])
  translate([-bearing_diameter/2-wall_thickness,0,0])
    cylinder(h=bearing_length+1, r=bearing_diameter/2, center=true);
  for (i=[-hole_spacing/2, hole_spacing/2]){
    translate([0,i,0])
    cylinder(h=10,r=hole_diameter/2, center=true);
translate([0,i,5+2])
    cylinder(h=10,r=screw_head_diameter/2, center=true);
    }
  }
  
}
difference(){
  union(){
    mounting_plate();
    bearing_holder();
    }
 for (i=[-hole_spacing/2, hole_spacing/2]){
    
  translate([0,i,15+4])
    cylinder(h=30,r=screw_head_diameter/2, center=true);
    }

}

