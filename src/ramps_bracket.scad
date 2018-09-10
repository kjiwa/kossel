/**
 * @author Kamil Jiwa <kamil.jiwa@gmail.com>
 * @license GPL-3.0
 */

module _tab(width, thickness, screw_diameter) {
  difference() {
    union() {
      cylinder(r=width / 2, h=thickness);
      translate([0, -width / 2, 0]) cube([width / 2, width, thickness]);
    }

    translate([0, 0, -thickness]) cylinder(r=screw_diameter / 2, h=3 * thickness, $fn=12);
  }
}

module ramps_bracket(length, width, height, thickness, screw_diameter) {
  translate([width, 0, 0]) difference() {
    cube([length + 2 * thickness, width, height + thickness]);
    translate([thickness, -thickness, thickness])
        cube([length, width + 2 * thickness, height + thickness]);
  }

  translate([width / 2, width / 2, 0])
      _tab(width, thickness, screw_diameter);
  translate([3 * width / 2 + 2 * thickness + length, width / 2, 0])
      rotate([0, 0, 180])
      _tab(width, thickness, screw_diameter);
}

ramps_bracket(62, 20, 15, 4, 3);
