/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/
class our_driver extends uvm_driver;
    `uvm_component_utils(our_driver)
    our_interface intf; // instantiated our interface
    function new(string name= "our_driver", uvm_component parent =null);
        super.new(name,parent)
    endfunction 
        //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components

        //get methord
        uvm_config_db #(virtual our_interface)::get(null,"*", "intf",intf);
    endfunction
        //similar is syntax of set methord, in top.sv
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
        
    endfunction

    //run phase. 
    // it is the only phase which has time consuming statement. hence its a task not a funcion
    task run_phase(uvm_phase phase);
        //main logic
    endtask
endclass //our_driver extends uvm_driver



