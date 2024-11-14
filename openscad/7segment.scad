// Variables
show_full_segment = false;
show_partial_segment = true;

//Part parameters
connector_wall_thickness = 2;
connector_height = 15;

leds_per_channel = 14; //how many leds long should each channel be
channel_wall_thickness = 2;
channel_height = 15; //total channel height in mm

//Bom parameters
ledstrip_width = 10;        //set correctly
ledconnector_length = 35;   //from led strip end to corner
ledconnector_width = 15+(connector_wall_thickness*2);    //at the widest part, and adds wall thickness to make gluing possible
leds_per_meter = 144; 

//automatically calculated variables
channel_length = leds_per_channel*(1000/leds_per_meter);
channel_connection_length = ledconnector_length-ledconnector_width;

// Code
if(show_full_segment == true) {}

if(show_partial_segment == true) {
//connector(3);
channel();
}

module channel() {
    translate([0, 0, 0]) {  
        difference() {
            //all add Objects go here
            union() {
                cube([ledstrip_width+(channel_wall_thickness*2), channel_length+(channel_connection_length*2), channel_height], center=true); //main cube, add length to make connection to connector
            }
            //all subtract objects go here
            union() {
                translate([0, 0, channel_wall_thickness/2]) cube([ledstrip_width, channel_length+(channel_connection_length*2), channel_height-channel_wall_thickness], center=true);
                translate([0, (channel_length/2), channel_wall_thickness/2]) cube([ledstrip_width+(channel_wall_thickness*2), channel_connection_length, channel_height-channel_wall_thickness], center=true);
            }
        }
    }
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
                            translate([0, -(connector_wall_thickness/2), connector_wall_thickness]) cube([ledconnector_width, ledconnector_length, connector_height], center=true); //main cut of the branch
                        }
                    }
                }
            }
        }
    }
}
