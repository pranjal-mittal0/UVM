/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/

class our_monitor extends uvm_monitor;
    `uvm_component_utils(our_monitor)
    our_interface intf; // instantiated our interface

    //port
    uvm_analysis_port#(our_sequence_item) monitor_port;  //our_sequence_item is the packet class, and monitor_port is the name of the port. it is just the naming, we will create it in build phase.

    function new(string name= "our_monitor", uvm_component parent =null);
        super.new(name,parent)
    endfunction 


    //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components
        //get methord
        uvm_config_db #(virtual our_interface)::get(null,"*", "intf",intf);

        //creation of port
        monitor_port=new("Monitor_Port",this); //2 parameter, name and <this>  ??????????????????ask why this.
        //we can do the same thing in driver, but fortunately, we wont have to do it as it already has built in the base class of the driver that is uvm_driver. It already
        //has a port declared. and so is in sequencer. So we will just connect the existing ports which we can do it in a class which sits on the top of monitor, sequencer and
        //driver(a higher level) i.e agent class.
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
endclass //our_monitor extends uvm_monitor