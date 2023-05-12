/*-----------------------------------------------------------------
File name     : env.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/


class our_env extends uvm_env;
    `uvm_component_utils(our_env)
    function new(string name= "our_env", uvm_component parent =null);
        super.new(name,parent)
    endfunction //new()
endclass :our_env //our_env extends uvm_env








