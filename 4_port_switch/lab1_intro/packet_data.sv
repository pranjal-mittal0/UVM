/*-----------------------------------------------------------------
File name     : packet_data.sv
Developers    : Pranjal Mittal
Created       : 05/05/2023
Description   : lab1 packet data item 
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/

// Follow instructions in lab book
  
// add print and type policies here

// packet class
typedef enum  { ANY,SINGLE,MULTIPLE,BROADCAST } packet_type;
typedef enum  { HEX,DEC,BIN } print_policy_type;
class packet;

  local string name;
  bit [3:0] target;
  bit [3:0] source;
  bit [7:0] data;
  packet_type ptype;
  function new(string name, integer source);
    this.name=name;
    // case(source)
    //   0: this.source=4'b0001;
    //   1: this.source=4'b0010;
    //   2: this.source=4'b0100;
    //   3: this.source=4'b1000;
    //   default : this.source=4'b0001;
    // endcase
    this.source = 1 << source;
    ptype = ANY;
  endfunction

  function string gettype();
    return ptype.name();  
  endfunction

  function string getname();
    return this.name;
  endfunction

  function void print(input print_policy_type pp=HEX);
    $display("----------------------------------");
    $display("name: %s, type: %s",getname(), gettype());
    case (pp)
      HEX: $display("from source %h, to target %h, data %h",source,target,data);
      DEC: $display("from source %0d, to target %0d, data %0d",source,target,data);
      BIN: $display("from source %b, to target %b, data %b",source,target,data);
    endcase
    $display("----------------------------------\n");

  endfunction
 // add print with policy
 
endclass

