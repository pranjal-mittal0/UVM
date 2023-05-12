/*-----------------------------------------------------------------
File name     : sequence.sv
Developers    : Pranjal Mittal
Created       : 12/05/2023
Description   : this class will randomise the packet class and sent it to driver using sequencer.
-------------------------------------------------------------------*/

class our_sequence extends uvm_sequence;
    `uvm_object_utils(our_sequence)
    //packet class instantiation
    our_packet packet;
    function new(string name="our_sequence");
        super.new(name);        
    endfunction //new()

    //as component had run phase, this has body task
    task  body(); //the sequence will take packet class and randomize it to create interesting scenarios.
        //creation of the memory for the handle(packet) or object of our_packet, for that we will use type ID create methord. Since it is object class, it wont have the phases,
        //so we will use type ID create methord in the body task.
    packet=our_packet::type_id::create("our_packet");  //////////???????????? /////////////////////////////////////// ??????????????????ask why not this

    //now we need to write commands to generate the stimulus for that we can write repeat loop

    repeat(10) begin  //10 times to generate the stimulus.
        start_item(packet);  //this will start the stimulus generation of the packets, i.e i/ps and o/ps
        packet.randomize();  //this will randomise the i/ps with rand keywords
        finish_item(packet); //this will finish the stimulus generation of the packet.
        //the whole start, randomise and finish will go for 10 times.
    end


    endtask 


endclass //our_sequence extends uvm_sequence