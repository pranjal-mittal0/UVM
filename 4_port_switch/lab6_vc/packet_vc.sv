/*-----------------------------------------------------------------
File name     : packet_vc.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 packet verification component class
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
    function void configure(input virtual interface port_if vif,int portno);  //vif is declared as virtual inter. port_if
        agt.drv.vif=vif;
        agt.mon.vif=vif;  //????????????ask why not agt.vif.mon. The virtual interface is passed to the driver and monitor via hierarchical 
        agt.seq.portno=portno;                                 //pathnames. Likewise, portno is passed to sequencer and monitor.
        agt.mon.portno=portno;
    endfunction
    task run(int runs);
        fork
            agt.mon.run(); // The monitor run must be called inside a fork join_none block to spawn its forever loop in a separate simulation thread and prevent the simulator locking up.
        join_none
        agt.drv.run(runs);

    endtask
endclass //packet_vc extends component_base