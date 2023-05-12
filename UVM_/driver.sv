/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/
class our_driver extends uvm_driver;
    `uvm_component_utils(our_driver)
    function new(string name= "our_driver", uvm_component parent =null);
        super.new(name,parent)
    endfunction 
endclass //our_driver extends uvm_driver



