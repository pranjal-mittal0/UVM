/*-----------------------------------------------------------------
File name     : env.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : 
-------------------------------------------------------------------*/


class our_env extends uvm_env;
    `uvm_component_utils(our_env)

    //instantiate classes
    our_agent agent;
    function new(string name= "our_env", uvm_component parent =null);
        super.new(name,parent)
    endfunction //new()

        //build phase
    function void build_phase(uvm_phase phase); //phase is just name of phase, for ease of use, we use phase
        //build other components
        //build agent class
        agent=our_agent::type_id::create("agent",this);//create agent.                /////////////////////////////////////// ??????????????????ask why this.
                    // our_agent is component type which is the name of our agent class.                                                                     
            //create is a factory methord with 2 parameter, name of object and this(a static methord to create objects)
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
endclass :our_env //our_env extends uvm_env








