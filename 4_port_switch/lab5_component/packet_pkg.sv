/*-----------------------------------------------------------------
File name     : packet_pkg.sv
Developers    : Pranjal Mittal
Created       : 25/05/2023
Description   : lab5 inheritance and polymorphism 
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
//include package in bottoms up format
package packet_pkg;
    `include "packet_data.sv"
    `include "component_base.sv"
    `include "sequencer.sv"
    `include "driver.sv"
    `include "monitor.sv"
    `include "agent.sv"
    `include "packet_vc.sv"
endpackage