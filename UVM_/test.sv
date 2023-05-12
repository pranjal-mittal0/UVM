/*-----------------------------------------------------------------
File name     : test.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : top component of UVM verification. Top module is static component and test component is 
                dynamic component created by the top module.
-------------------------------------------------------------------*/

class our_test extends uvm_test;  //inherting our class from uvm test class will give access to uvm test classes
                                  // without having to declare them again and again.
    `uvm_component_utils(our_test)//this will register our class with UVM Factory. UVM factory is like a library. 
                                  // this will make the code modular and reusable.   
    function new(string name= "our_test", uvm_component parent =null);               // constructor(name, uvm component<this will say that this
                                                                                     // constructor is uvm component>).
        super.new(name,parent);                                                      // super keyword is used to refer to all the properties in the parent class.

    endfunction //new()


    //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components
        
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
        
    endfunction

    //run phase. 
    // it is the only phase which has time consuming statement. hence its a task not a funcion
    task run_phase(uvm_phase phase);
        //main logic
    endtask

    //these phases are added to other components as well, as they are universal
endclass //our_test extends uvm_test