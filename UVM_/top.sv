/*-----------------------------------------------------------------
File name     : top.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : top component of UVM verification. Top module is static component and test component is 
                dynamic component created by the top module.
NOTES         : In the TB, we need to make connections between sequencer and driver; monitor and scoreboard.
                The monitor and driver will be connected to interface without any ports through virtual methrod. It is rule of OOPs
                Connections will be done using PORTs, EXPORTs and IMPLEMENTATION ports. the connection is from PORT to IMPLEMENTATION via EXPORTs.
-------------------------------------------------------------------*/



`include "uvm_macros.svh"					// this file contains definition of basic macros used in testbench
 import uvm_pkg::*;							// will give an access to uvm pkg. It is a factory package that
                                            // contains basic components like env, agent, driver, etc and object classes like sequence and seq item.

module top ();

    our_interface intf(); // instantiated our interface

    our_design uut();                       //instantiated our design

    //we need to use the set methord to set the interface in the database.
    initial begin
        //set methord
        uvm_config_db #(virtual our_interface)::set(null,"*", "intf",intf);          /////////////??????????meaning.
    end
    //similar is syntax of get methord, that we have to write in driver and monitor

    //we need to start the test by running the test component

    //we will use initial block.

    initial begin                           //test component
        run_test("out_test");  // this is a basic UVM functn that is used to run our test component. inside 
                    // inverted commas, we write which test we need to start.

    end

endmodule
                                            













