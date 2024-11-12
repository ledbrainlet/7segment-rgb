// Variables
show_full_segment = false;
show_partial_segment = true;

//Bom parameters
ledstrip_width = 10;        //set correctly
ledconnector_length = 25;   //from led strip end to corner
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
                difference() {
                    union() {
                        //all add objects go here
                        cube([ledconnector_length+(connector_wall_thickness*2), ledconnector_width+(connector_wall_thickness*2), connector_height], center=true);
                    }
                    union() {
                        //all subtract objects go here
                    }
                }
            }

            branch_rotation = branch_rotation + 90; //increase by 90 so next branch gets ordered correctly
            echo(branch_rotation);
        }
    }
}