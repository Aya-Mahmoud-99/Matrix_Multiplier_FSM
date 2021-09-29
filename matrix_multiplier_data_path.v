module matrix_multiplier_data_path(clk,rst,k_rst,col_rst,row_rst,ld_D,enable_count_COL,enable_count_ROW,enable_count_K,A_col,B_col,R_col,A_row,B_row,R_row,finish_K,finish_ROW,finish_COL,k,row,col,concatinated_matrix);
  input clk,rst;
  input k_rst,col_rst,row_rst;
  inout ld_D,enable_count_COL,enable_count_ROW,enable_count_K;
  input [1:0] A_col,B_col,R_col,A_row,B_row,R_row;
  output finish_K,finish_ROW,finish_COL;
  output [1:0] k,row,col;
  wire [7:0] data_out_MUL,data_out_ADD,data_out_R;
  wire [2:0] data_out_A,data_out_B;
  output [71:0] concatinated_matrix;

  count_2bit_enable k_m(clk,k_rst,enable_count_K,finish_K,k);
  count_2bit_enable row_m(clk,row_rst,enable_count_ROW,finish_ROW,row);
  count_2bit_enable col_m(clk,col_rst,enable_count_COL,finish_COL,col);
  matrix_3_3_A a(clk,A_row,A_col,data_out_A);
  matrix_3_3_B b(clk,B_row,B_col,data_out_B);
  multuplier_3_bit mul(data_out_A,data_out_B,data_out_MUL);
  matrix_3_3_R r(clk,ld_D,R_row,R_col,data_out_ADD,data_out_R,concatinated_matrix);
  adder_3_bit adder(clk,rst,data_out_R,data_out_MUL,data_out_ADD);
  endmodule