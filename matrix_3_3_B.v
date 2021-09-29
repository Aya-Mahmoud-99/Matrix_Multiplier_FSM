module matrix_3_3_B(clk,row,col,data_out);
reg [2:0] Matrix [8:0];
input clk;
input [1:0] row,col;
output reg [2:0] data_out;

initial begin
    $display ("loading rom.");
    Matrix[0]=3'd1;
	 Matrix[1]=3'd2;
	 Matrix[2]=3'd3;
	 Matrix[3]=3'd1;
	 Matrix[4]=3'd2;
	 Matrix[5]=3'd3;
	 Matrix[6]=3'd1;
	 Matrix[7]=3'd2;
	 Matrix[8]=3'd3;
	 
end
always @(posedge clk)
begin
	data_out=Matrix[row*3+col];	
end

endmodule