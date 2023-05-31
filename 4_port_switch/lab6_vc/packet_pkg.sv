/*-----------------------------------------------------------------
File name     : packet_pkg.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/

package packet_pkg;

`include "packet_data.sv"
`include "component_base.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "packet_vc.sv"

endpackage
