/*-----------------------------------------------------------------
File name     : sequencer.sv
Developers    : Pranjal Mittal
Created       : 29/05/2023
Description   : lab5 sequencer class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class sequencer extends component_base;
    function new(string name,component_base parent);
        super.new(name,parent);
    endfunction //new()
endclass //sequencer extends component_base