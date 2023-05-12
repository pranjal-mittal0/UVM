/*-----------------------------------------------------------------
File name     : sequencer.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/

class our_sequencer extends uvm_sequencer;

    `uvm_component_utils(our_sequencer)
    function new(string name= "our_sequencer", uvm_component parent =null);
        super.new(name,parent)
    endfunction 
endclass: our_sequencer //our_sequencer extends uvm_sequencer
