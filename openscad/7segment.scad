// Variables
show_full_segment = false;
show_partial_segment = true;

//Bom parameters
ledstrip_width = 10;        //set correctly
ledconnector_length = 35;   //from led strip end to corner
ledconnector_width = 15;    //at the widest part

//Part parameters
connector_wall_thickness = 2;
connector_height = 15;

// Code
if(show_full_segment == true) {}

if(show_partial_segment == true) {

connector(3);


}

module connector(branch_count) {
    branch_rotation = 0; //to iterate for branch creation
    union() {
        for (i = [1:branch_count]) {
            rotate([0, 0, branch_rotation]) {
                translate([0, -((ledconnector_length+connector_wall_thickness)/4), 0])  {  //offsets the branch
                    difference() {
                        union() {
                            //all add objects go here
                            cube([ledconnector_width+(connector_wall_thickness*2), ledconnector_length+connector_wall_thickness, connector_height], center=true); //main body of one branch
                        }
                        union() {
                            //all subtract objects go here
                            translate([0, connector_wall_thickness, -connector_wall_thickness]) cube([ledconnector_width, ledconnector_length, connector_height], center=true); //main cut of the branch
                        }
                    }
                }
            }

            branch_rotation = branch_rotation + 90; //increase by 90 so next branch gets ordered correctly
            echo(branch_rotation);
        }
    }
}