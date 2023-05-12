/*-----------------------------------------------------------------
File name     : agent.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/

class our_agent extends uvm_agent;

    `uvm_component_utils(our_agent)
    function new(string name= "our_agent", uvm_component parent =null);
        super.new(name,parent)
    endfunction //new()
endclass : our_agent //our_agent extends uvm_agent







