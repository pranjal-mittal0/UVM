/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/
class our_monitor extends uvm_monitor;
    `uvm_component_utils(our_monitor)
        function new(string name= "our_monitor", uvm_component parent =null);
            super.new(name,parent)
        endfunction 
endclass //our_monitor extends uvm_monitor