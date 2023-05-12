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

        //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components
        
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
        
    endfunction

    //run phase. 
    // it is the only phase which has time consuming statement. hence its a task not a funcion
    task run_phase(uvm_phase phase);
        //main logic
    endtask
endclass: our_sequencer //our_sequencer extends uvm_sequencer
