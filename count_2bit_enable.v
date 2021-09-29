module count_2bit_enable (clk,rst,en,finish,count_temp);

input clk;
input rst;
input en;
output finish;
output reg [1:0] count_temp;

always @ (posedge clk or posedge rst)
begin
if (rst) 
  count_temp <= 2'd0;
else if(en)
    count_temp <= count_temp + 2'd1;
end
assign finish = count_temp[0] && count_temp[1];

endmodule