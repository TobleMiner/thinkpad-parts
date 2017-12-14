material_strength = 1.0;

//base body with mounting slot
difference() {
    rim_strength = 0.8;
    length = 9.8;
    width = 5.85;
    translate() {
        cube([21, 16.1, material_strength]);
        translate([21 - 3 - width, 2, 0]) scale([1, 1, 2.1]) slot(length, width);
    };
    translate([21 - 3 - width, 2, 0]) scale([1, 1, 2.1]) translate([rim_strength, rim_strength, 0]) slot(length - 2 * rim_strength, width - 2 * rim_strength);
};

level_actuator_material_strength = 2.7;
level_support_material_strength = 6.4;

translate([0, 16, 0]) {
    //uppper rail
    cube([15.5, 1.6, material_strength]);
    //switch lever connector
    cube([4.4, 5.8, material_strength]);
    translate([0, 1.6, 0]) {
        translate([-18.6 + 4.4, 0, 0]) {
            //switch lever actuator
            difference() {
                translate() {
                    //switch stabilizer
                    translate([0, 6.0, 0]) cube([0.55, 3.3, 3.6]);
                    difference() {
                        translate() {
                            //switch actuator
                            translate([2, 0, 0]) {
                                translate([0, 5.2, 0]) cube([0.55, 4.1, 6.4]);
                                translate([0, 5.2 + 4.2 - 0.65, 0]) cube([7.5, 0.55, 6.4]);
                            };
                            cube([18.6, 5.8, level_actuator_material_strength]);
                            translate([0, 5.8, 0]) {
                                cube([10.4, 3.5, level_actuator_material_strength]);
                            };
                        };
                        //alignment rail
                        translate([4.7, 0, 0]) cube([1.2, 9.3, 1.67]);
                    };
                };
                translate([0, 5.8 + 0.4, level_support_material_strength]) rotate([180, 0, -22.02]) {
                    cube([20, 8, level_support_material_strength]);
                };
            };
        };
        //spring rod
        translate([2.4 + 4.4, 0, 0.7]) {
            rotate([-90, 0, 0]) cylinder(8.3, 0.7, 0.7, $fn=100);
        };
    };
};

//catch
translate([4.4, -1.95, 0]) {
    cube([4.1, 1.95, material_strength]);
    translate([4.1, -2.5, 0]) {
        difference() {
            cube([4.8, 2.5 + 1.95, material_strength * 2]);
            translate([1, 0, 0]) rotate([180, 0, 45]) translate([0, 0, -material_strength * 2]) cube([10, 10, material_strength * 2]);
        };
    };
};

//stabilizer rails
translate([0, 0, -0.2]) {
    translate([1.5, 1.75, 0]) {
        cube([0.5, 7.85, 0.2]);
    };
    translate([21 - 1.32, 5.35, 0]) {
        cube([0.5, 8.8, 0.2]);
    };
};

//button
translate([5, 3.6, -1.3]) {
    cube([5.5, 4.8, 1.3]);
};

module slot(length, width) {
    translate([width/2, width/2, 0]) cylinder(1, r=width/2, $fn=100);
    translate([0, width/2, 0]) cube([width, length - width, 1]);
    translate([width/2, length - width/2, 0]) cylinder(1, r=width/2, $fn=100);
};

module routed_slot(length, width, material_strength) {
    difference() {
        slot(length, width);
        translate([material_strength, material_strength, 0]) slot(length - 2 * material_strength, width - 2 * material_strength);
    };
};

outer_slot_radius = 5.85 / 2;
inner_slot_radius = 4.2 / 2;

//mounting slot
//translate([11.9 + outer_slot_radius, outer_slot_radius + 2, 0]) {
//    scale([1, 1, 2.1]) routed_slot(9.8, 5.85, 0.8);
//    cylinder(2.1, r=outer_slot_radius, $fn=100);
//    translate([0, 9.8 - outer_slot_radius]) cylinder(2.1, r=outer_slot_radius, $fn=100);
//};
