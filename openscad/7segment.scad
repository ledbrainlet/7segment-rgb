// Variables
show_full_segment = false;
show_partial_segment = true;

//Bom parameters
ledstrip_width = 10;        //set correctly
ledconnector_length = 100;   //from led strip end to corner
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
    difference() {
        //create all Objects for adding
        union() {    
            for (i = [1:branch_count]) {
                rotate([0, 0, i * 90]) {
                    translate([0, -((ledconnector_length/2)-(ledconnector_width/2)-connector_wall_thickness/2), 0])  {  //offsets the branch
                        union() {
                            //all add objects go here
                            cube([ledconnector_width+(connector_wall_thickness*2), ledconnector_length+connector_wall_thickness, connector_height], center=true); //main body of one branch
                        }
                        
                    }
                }
            }
        }
        //create all Objects for Subtraction
        union(){
            for (i = [1:branch_count]) {
                rotate([0, 0, i * 90]) {
                    translate([0,-((ledconnector_length/2)-(ledconnector_width/2)-connector_wall_thickness/2), 0])  {  //offsets the branch
                        union() {
                            //all subtract objects go here
                            translate([0, -(connector_wall_thickness/2), -connector_wall_thickness]) cube([ledconnector_width, ledconnector_length, connector_height], center=true); //main cut of the branch
                        }
                    }
                }
            }
        }
    }
}
