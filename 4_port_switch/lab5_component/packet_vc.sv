/*-----------------------------------------------------------------
File name     : packet_vc.sv
Developers    : Pranjal Mittal
Created       : 26/05/2023
Description   : lab5 packet_vc class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class packet_vc extends component_base;
    agent agt;
    function new(string name, component_base parent);
        super.new(name, parent);
        agt=new("agt",this);        
    endfunction //new()
    task run();
        agt.mon.run();
        agt.drv.run();
    endtask
endclass //packet_vc extends component_base