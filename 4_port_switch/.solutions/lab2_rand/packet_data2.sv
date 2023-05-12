/*-----------------------------------------------------------------
File name     : packet_data.sv
Developers    : Brian Dickinson
Created       : 01/08/19
Description   : lab2 packet data class with randomization constraints
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2019
-----------------------------------------------------------------*/

  // print policy for formatting packet print
 typedef enum {HEX,BIN,DEC} pp_t;
 typedef enum {ANY,SINGLE,MULTICAST,BROADCAST} ptype_t;

// packet class
class packet;

  local string name;

  rand bit [3:0] target;
  bit [3:0] source;
  rand bit [7:0] data;
  //     ptype_t ptype;
  rand ptype_t ptype;

  // constructor sets source and packet type
  function new ( string name, int idt);
    this.name = name;
    source = 1 << idt;
    ptype = ANY;
  endfunction

  // basic constraint (over-ridden for broadcast packet)
  //constraint ts_bits {(target & source) == 4'b0;}
  constraint t_not0 {target != 0;}

  // solve-before constraint to change distribution
  constraint ptype_order {solve ptype before target;}
  
  // conditional constraint on target for packet type
  constraint packet_type {ptype == SINGLE -> { target inside {1,2,4,8}; (target & source) == 4'b0; }
                          ptype == MULTICAST -> { target inside {3,[5:7],[9:14]}; (target & source) == 4'b0; } 
                          ptype == BROADCAST -> target == 15;} 

 // print with policy
  function void print(input pp_t pp = BIN);
    $display("----------------------------------");
    $display("name: %s, type: %s",getname(), gettype());
    case (pp)
      HEX: $display("from source %h, to target %h, data %h",source,target,data);
      DEC: $display("from source %0d, to target %0d, data %0d",source,target,data);
      BIN: $display("from source %b, to target %b, data %b",source,target,data);
    endcase
    $display("----------------------------------");
  endfunction

  function string getname();
      return name;
  endfunction
 
  // get packet type
  function string gettype();
      return ptype.name();
  endfunction
 
  endclass

