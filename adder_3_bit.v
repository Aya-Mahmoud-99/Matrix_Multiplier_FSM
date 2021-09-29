module adder_3_bit(clk,rst,data_1,data_2,data_out);
input clk,rst;
input [7:0] data_1;
input [7:0] data_2;
output [7:0] data_out;
assign data_out=data_1+data_2;
endmodule