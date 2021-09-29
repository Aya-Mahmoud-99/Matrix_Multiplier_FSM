module matrix_multiplier(clk,rst,concatinated_matrix);
  input clk,rst;
  output [71:0] concatinated_matrix;
  wire k_rst,col_rst,row_rst;
  wire ld_D,enable_count_COL,enable_count_ROW,enable_count_K;
  wire [1:0] A_col,B_col,R_col,A_row,B_row,R_row;
  wire finish_K,finish_ROW,finish_COL;
  wire [1:0] k,row,col;
matrix_multiplier_fsm fsm(clk,!rst,finish_K,finish_ROW,finish_COL,k,row,col,k_rst,col_rst,row_rst,ld_D,enable_count_COL,enable_count_ROW,enable_count_K,A_col,B_col,R_col,A_row,B_row,R_row);
matrix_multiplier_data_path dp(clk,!rst,k_rst,col_rst,row_rst,ld_D,enable_count_COL,enable_count_ROW,enable_count_K,A_col,B_col,R_col,A_row,B_row,R_row,finish_K,finish_ROW,finish_COL,k,row,col,concatinated_matrix);
endmodule