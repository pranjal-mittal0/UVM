
/*-----------------------------------------------------------------
File name     : testbench.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : combinational adder verification

//-----------------NOTES-----------------//
// In UVM sequence, sequencer and driver are three paramaterized classes.//
//---------------------------------------//
*/
//here interface does not contain clocking block and modport and concept of virtual sequence and sequencer


	

`include "uvm_macros.svh"					// will give an access to uvm macros
 import uvm_pkg::*;							// will give an access to uvm pkg


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//---------------- transaction class -------------------

// keep track of all i/p's and o/p's of the RTL(DUT) except global signals i.e clk we r dealing with them in hvl_top.

class seq_itm extends uvm_sequence_item;
    rand logic [3:0] a;                                 // class properties 
    rand logic [3:0] b;                                 // i/p port's qualified with rand bcz we want to take help of pesudo random
         logic [4:0] y;                                 // o/p port's kept as it is.

    `uvm_object_utils_begin(seq_itm)					// factory registration and field macros
		`uvm_field_int(a,UVM_DEFAULT + UVM_DEC)			// UVM_DEFAULT or UVM_ALL_ON flag to make use of  all the inbuilt methords
		`uvm_field_int(b,UVM_DEFAULT + UVM_DEC)		    //like print, copy, comparable
		`uvm_field_int(y,UVM_DEFAULT + UVM_DEC)		    // UVM_DEC flag is to print the properties in decimal format
	`uvm_object_utils_end				

    function new(input string name="seq_itm");           // object class in UVM based class hierarchy hence one argument
        super.new(name);
        
    endfunction:new //new()
endclass:seq_itm //seq_itm extends uvm_sequence_item

// ------------------- sequence class  ----------------------

class sequence1 extends uvm_sequence #(seq_itm);        //as uvm_sequence is a paramaterized class, we parameterise with type of transaction i.e seq_itm
    function new(input string name="sequence1");
        super.new(name);
    endfunction //new()
endclass //sequence1 extends uvm_sequence #(seq_itm)