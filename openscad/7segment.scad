// Variables
show_full_segment = false;
show_partial_segment = false;

ledstrip_width = 10;
ledconnector_length = 15;
connector_wall_thickness = 2;
// Code
if(show_full_segment == true) {}

if(show_partial_segment == true) {

Connector(3);


}

module Connector(branch_count) {
    branch_rotation = 0; //to iterate for branch creation
    for (branch_count) {
        difference() {
            union() {
                //all add objects go here
                cube([], center=true);
            }
            union() {
                //all subtract objects go here
            }
        }


        branch_rotation = branch_rotation + 90; //increase by 90 so next branch gets ordered correctly
    }
}