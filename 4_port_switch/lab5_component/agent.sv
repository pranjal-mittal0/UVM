/*-----------------------------------------------------------------
File name     : agent.sv
Developers    : Pranjal Mittal
Created       : 26/05/2023
Description   : lab5 agent class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class agent extends component_base;
    sequencer seq;
    driver drv;
    monitor mon;
    function new(string name, component_base parent);
        super.new(name,parent);       
        drv=new("drv",this);
        seq=new("seq",this);
        mon=new("mon",this);
        drv.sref=seq; //connection of driver to sequencer.
    endfunction //new()
endclass //agent extends component_bastring name, component_base parentse