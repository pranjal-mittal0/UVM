/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 29/05/2023
Description   : lab5 monitor class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class monitor extends component_base;
    function new(string name, component_base parent);
        super.new(name,parent);
    endfunction //new()
    task run();
        $display("Monitor @%s",path_name());
    endtask
endclass //monitor extends component_base