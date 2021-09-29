module multuplier_3_bit(data_1,data_2,data_out);
input [2:0] data_1;
input [2:0] data_2;
output [7:0] data_out;
assign data_out=data_1*data_2;
endmodule