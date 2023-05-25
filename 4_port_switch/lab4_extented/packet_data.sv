/*-----------------------------------------------------------------
File name     : packet_data.sv
Developers    : Pranjal Mittal
Created       : 25/05/2023
Description   : lab4 inheritance and polymorphism 
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
  rand bit [3:0] target;
  bit [3:0] source;
  rand bit [7:0] data;
  rand packet_type ptype;
  function new(string name, integer source);
    this.name=name;
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

 //class constraint
  constraint target_length{  target !=0; }
  constraint target_bits{|(target & source) != 1'b1; }
  // solve-before constraint to change distribution
  // constraint ptype_order{solve ptype before target;}
  // constraint packet_type_constraint{ ptype == SINGLE -> { target inside {1,2,4,8}; (target & source) == 4'b0; } //remember multiple constraints in branch needs to be enclosed in brackets
  //                                   ptype == MULTIPLE -> { target inside {3,[5:7],[9:14]}; (target & source) == 4'b0; } 
  //                                   ptype == BROADCAST -> target == 15;  //removing target& source constraint allows that the bit of source and target can be same
  //}
 
endclass

class psingle extends packet;
  constraint single_constraint{ target inside {1,2,4,8};}
  function new(string name,integer source);
    super.new(name,source);
    ptype=SINGLE;
  endfunction //new()
  
endclass //psingle extends packet
class pmulticast extends packet;
  constraint multicast_constraint{ target inside {3,[5:7],[9:14]};}
  function new(string name,integer source);
    super.new(name,source);
    ptype=MULTIPLE;
  endfunction //new()
  
endclass //pmulticast extends packet
class pbroadcast extends packet;
  constraint broadcast_constraint{ target == 15;}
  function new(string name,integer source);
    super.new(name,source);
    ptype=BROADCAST;
  endfunction //new()
  constraint target_bits{ }
  
  
endclass //pbroadcast extends packet
