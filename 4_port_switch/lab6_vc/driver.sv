/*-----------------------------------------------------------------
File name     : driver.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 driver class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
class driver extends component_base;
    sequencer sref;
    virtual interface port_if vif;
    packet pkt;
    function new(string name, component_base parent);
        super.new(name,parent);        
    endfunction //new()
    task run(int runs);
        repeat(runs) begin
            sref.get_next_item(pkt);
            //$display("Driver (%s) sends packet IN @%t",path_name(),$time);
            //pkt.print();
            vif.drive_packet(pkt);
            
            // $display("Sequencer @%s",sref.path_name());
        end
    endtask //
endclass //driver extends component