/*-----------------------------------------------------------------
File name     : sequence_item.sv
Developers    : Pranjal Mittal
Created       : 12/05/2023
Description   : it is also called packet or data class. It contains the information, variables that driver
                needs in order to excecute pin level transactions.
Notes         : The reason it is called object class is because they are only created in test bench when required and
                are destroyed once they serve their purpose.
                Packet contains the signals that need to be toggled inside the DUT, hence we will declare those signals as variables.
                inputs are called request items and outputs are called response items.
-------------------------------------------------------------------*/

class our_packet extends uvm_sequence_item;
    `uvm_object_utils(our_packet)
    //request items
    rand bit[7:0] input_1;
    rand bit[7:0] input_2;
    //response items
    bit [15:0] output_3;
    function new(string name="our_packet");
        super.new(name);

    endfunction //new()
endclass //our_packet extends uvm_sequence_item