/*-----------------------------------------------------------------
File name     : packet_data.sv
Developers    : Pranjal Mittal
Created       : 25/05/2023
Description   : lab3 packet data item 
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.
%d displays using a fixed width to accommodate the largest possible value for the expression being displayed. 
%0d displays the minimum width, suppressing any leading 0's or spaces.
-----------------------------------------------------------------*/

// Follow instructions in lab book
  
// add print and type policies here

// packet class
typedef enum  { ANY,SINGLE,MULTIPLE,BROADCAST } packet_type;
typedef enum  { HEX,DEC,BIN } print_policy_type;
typedef enum  { UNIDED, IDED} tag_type; //1st one is default
class packet;

  local string name;

  rand bit [3:0] target;
  bit [3:0] source;
  rand bit [7:0] data;
  rand packet_type ptype;

  static int packet_count; //static property
  int tag; //dynamic property
  tag_type tag_mode;

  function new(string name, integer source);
    this.name=name;
    this.source = 1 << source;
    ptype = ANY;
    packet_count++;
    tag= packet_count;
  endfunction

  function string gettype();
    return ptype.name();  
  endfunction

  function string getname();
    return this.name;
  endfunction
  static function int getcount();
    return (packet_count);
  endfunction
  
  function void post_randomize();
    if (tag_mode ==IDED) data=tag;
  endfunction

  function void print(input print_policy_type pp=HEX);
    $display("----------------------------------");
    $display("name: %s, type: %s, packet_count: %0d, tag: %0d, tag_mode: %s",getname(), gettype(), packet_count, tag, tag_mode.name()); //.name is necessary
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
// constraint target_bits{(target&source)==4'b0; }
constraint ptype_order{solve ptype before target;}
 constraint packet_type_constraint{ ptype == SINGLE -> { target inside {1,2,4,8}; (target & source) == 4'b0; } //remember multiple constraints in branch needs to be enclosed in brackets
                                    ptype == MULTIPLE -> { target inside {3,[5:7],[9:14]}; (target & source) == 4'b0; } 
                                    ptype == BROADCAST -> target == 15;  //removing target& source constraint allows that the bit of source and target can be same
 }
 
endclass

