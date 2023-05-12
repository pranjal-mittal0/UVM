/*-----------------------------------------------------------------
File name     : agent.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/

class our_agent extends uvm_agent;

    `uvm_component_utils(our_agent)
    //instantiate classes
    our_sequencer sequencer;
    our_driver    driver;
    our_monitor   monitor;


    function new(string name= "our_agent", uvm_component parent =null);
        super.new(name,parent)
    endfunction //new()

        //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components
        //build sequencer, monitor and driver.
        //these three are on same hierarchical level, and are not building any further classes.
        sequencer=our_sequencer::type_id::create("our_sequencer",this);
        driver=our_driver::type_id::create("our_driver", this);
        monitor=our_monitor::type_id::create("our_monitor",this);
            // our_sequencer is component type which is the name of our sequencer class.                                                                     
            //create is a factory methord with 2 parameter, name of object and this(a static methord to create objects)
            //similarly in env.sv, we need to create agent 
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
        //ports are connected here.
        driver.seq_item_port.connect(sequencer.seq_item_export); //driver's port's name is seq_item_port which is connected to sequencer's port whose name is seq_item_export.
                                                                //these names are given by creator of UVM. if we design our own ports then we can name whatever we want.
    endfunction

    //run phase. 
    // it is the only phase which has time consuming statement. hence its a task not a funcion
    task run_phase(uvm_phase phase);
        //main logic
    endtask
endclass : our_agent //our_agent extends uvm_agent







