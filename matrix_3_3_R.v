module matrix_3_3_R(clk,en,row,col,data_in,data_out,concatinated_matrix);
reg [7:0] Matrix [8:0];
input en;
input clk;
input [1:0] row,col;
input [7:0] data_in;
output reg [7:0] data_out;
output [71:0] concatinated_matrix;

initial begin
    $display ("loading rom.");
     Matrix[0]=8'd0;
	 Matrix[1]=8'd0;
	 Matrix[2]=8'd0;
	 Matrix[3]=8'd0;
	 Matrix[4]=8'd0;
	 Matrix[5]=8'd0;
	 Matrix[6]=8'd0;
	 Matrix[7]=8'd0;
	 Matrix[8]=8'd0;
	 
end
always @(posedge clk)
begin
   if(en) Matrix[row*3+col]=data_in;
	data_out=Matrix[row*3+col];	
end
assign concatinated_matrix={Matrix[0],Matrix[1],Matrix[2],Matrix[3],Matrix[4],Matrix[5],Matrix[6],Matrix[7],Matrix[8]};

endmodule