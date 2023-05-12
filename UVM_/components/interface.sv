/*-----------------------------------------------------------------
File name     : interface.sv
Developers    : Pranjal Mittal
Created       : 12/05/2023
Description   : it encapsulates signal which are similar and related. They are grouped inside one interface which is then driven by a driver.
                Similar signal can be ports on soc. With the declaration of interface, it becomes easy for the driver to toggle pin level information.
                The driver can do this by accessing the handle for the interface.
                Because of certain rules in SV, the interface should be set in ##MODULE## only then it can be available to other components.I.E, set methord
                is used in the top model to set the virtual interface handle. In the driver and monitor, the get methord is used to get the handle of virtual
                interface. 
-------------------------------------------------------------------*/

interface our_interface();

    //inputs

    //outputs
    
endinterface //our_interface