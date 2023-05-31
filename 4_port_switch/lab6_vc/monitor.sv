/*-----------------------------------------------------------------
File name     : monitor.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 monitor class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class monitor extends component_base;
 virtual interface port_if vif;
 int portno;

 packet pkt;

  function new (string name, component_base parent);
    super.new(name, parent);
  endfunction

  task run();
   forever begin
     vif.collect_packet(pkt);
     $display("Port%0d Monitor (%s) captures packet IN @%t",portno, path_name(), $time);
     pkt.print();
    end
  endtask
endclass