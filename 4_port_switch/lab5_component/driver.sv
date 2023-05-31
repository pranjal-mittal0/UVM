/*-----------------------------------------------------------------
File name     : driver.sv
Developers    : Pranjal Mittal
Created       : 29/05/2023
Description   : lab5 driver class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class driver extends component_base;
    sequencer sref;

    function new(string name, component_base parent);
        super.new(name,parent);        
    endfunction //new()
    task run();
        $display("Driver @%s",path_name());
        $display("Sequencer @%s",sref.path_name());
    endtask //
endclass //driver extends component