/*-----------------------------------------------------------------
File name     : agent.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 agent class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class agent extends component_base;

 driver drv;
 sequencer seq;
 monitor mon;

  function new (string name, component_base parent);
    super.new(name, parent);
    drv = new("drv", this);
    seq = new("seq", this);
    mon = new("mon",this);
    drv.sref = seq;
  endfunction

  function void print();
    seq.print();
    drv.print();
    mon.print();
  endfunction
  endclass