/*-----------------------------------------------------------------
File name     : component_base.sv
Developers    : Pranjal Mittal
Created       : 30/05/2023
Description   : lab6 component base class
Notes         : From the Cadence "Essential SystemVerilog for UVM" training
-------------------------------------------------------------------
This is for lab work for the above training.

-----------------------------------------------------------------*/
virtual class component_base;
    protected string name;
    component_base parent;
    function new(string name, component_base parent);
        this.name=name;
        this.parent=parent;
    endfunction

    virtual function string get_name();
        return name;
        
    endfunction

    function string path_name();
        component_base ptr=this;
        path_name = name;
        while (ptr.parent != null) 
        begin
        ptr = ptr.parent;
        path_name = {ptr.name, ".", path_name};
        end
    endfunction

    virtual function void print();
        $display("@ %s",this.path_name());;
        
    endfunction
endclass