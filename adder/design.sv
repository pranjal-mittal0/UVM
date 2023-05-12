/*-----------------------------------------------------------------
File name     : design.sv
Developers    : Pranjal Mittal
Created       : 11/05/2023
Description   : adder rtl and interface design
*/
//_________________________________RTL_________________________//
`begin_keywords "1800-2017"    //LRM 1800-2017

timeunit 1ns; 
timeprecision 1ns;

module adder_rtl (
    input logic[3:0] a,
    input logic[3:0] b,
    output [4:0] y
);
    always_comb begin : B1

        y=a+b;
    end:B1
endmodule : adder_rtl

`end_keywords


//---------------------------interface-------------------------//
interface adder_if();
    logic[3:0] a;
    logic[3:0] b;
    logic[4:0] y;
endinterface: adder_if