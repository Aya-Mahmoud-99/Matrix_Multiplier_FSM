  module matrix_multiplier_fsm(clk,rst,finish_K,finish_ROW,finish_COL,k,row,col,k_rst,col_rst,row_rst,ld_D,enable_count_COL,enable_count_ROW,enable_count_K,A_col,B_col,R_col,A_row,B_row,R_row);
  input clk,rst;
  input finish_K,finish_ROW,finish_COL;
  input [1:0] k,row,col;
  output reg k_rst,col_rst,row_rst;
  output reg ld_D,enable_count_COL,enable_count_ROW,enable_count_K;
  output reg[1:0] A_col,B_col,R_col,A_row,B_row,R_row;
  reg [3:0] current_state, next_state;
  always@ (finish_K,finish_ROW,finish_COL,k,row,col,current_state)
  begin
        case (current_state)
    4'b0000:
        begin
        A_row=row;
        A_col=k;
        B_row=k;
        B_col=col;
        R_row=row;
        R_col=col;
        ld_D=0;
        k_rst=0;
        row_rst=1;
        enable_count_COL=0;
        enable_count_ROW=0;
        enable_count_K=0;
        next_state=4'b0001;
        col_rst=0;
        R_row=row;
        R_col=col;
        end
    4'b0001:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=1;
            enable_count_COL=0;
            enable_count_ROW=0;
            enable_count_K=0;
            next_state=4'b0010;
            R_row=row;
            R_col=col;
        end
    4'b0010:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            ld_D=0;
            row_rst=0;
            col_rst=0;
            R_row=row;
            R_col=col;
            k_rst=1;
            enable_count_COL=0;
            enable_count_ROW=0;
            enable_count_K=0;
            next_state=4'b0011;
        end
    4'b0011:
    begin
        A_row=row;
        A_col=k;
        B_row=k;
        B_col=col;
        R_row=row;
        R_col=col;
        row_rst=0;
        col_rst=0;
        k_rst=0;
        ld_D=1;
        enable_count_K=0;
        enable_count_ROW=0;
        enable_count_COL=0;
        next_state=4'b0100;
    end
    4'b0100:
        begin
        A_row=row;
        A_col=k;
        B_row=k;
        B_col=col;
        R_row=row;
        R_col=col;
        k_rst=0;
        row_rst=0;
        col_rst=0;
        ld_D=0;
        enable_count_K=1;
        R_row=row;
        R_col=col;
        enable_count_ROW=0;
        enable_count_COL=0;
        next_state=4'b0101;
        end
    4'b0101:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=0;
            enable_count_K=0;
            R_row=row;
            R_col=col;
            enable_count_ROW=0;
            enable_count_COL=0;
            if(finish_K)
                next_state=4'b0110;
            else
                next_state=4'b0011;
        end
    4'b0110:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=0;
            enable_count_K=0;
            enable_count_ROW=0;
            enable_count_COL=1;
            R_row=row;
            R_col=col;
            next_state=4'b0111;
        end
    4'b0111:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=0;
            enable_count_K=0;
            enable_count_COL=0;
            R_row=row;
            R_col=col;
            enable_count_ROW=0;
            if(finish_COL)
                next_state=4'b1000;
            else
                next_state=4'b0010;

        end
    4'b1000:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            enable_count_K=0;
            enable_count_COL=0;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=0;
            enable_count_ROW=1;
            R_row=row;
            R_col=col;
            next_state=4'b1001;
        end
    4'b1001:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            enable_count_K=0;
            enable_count_COL=0;
            ld_D=0;
            k_rst=0;
            row_rst=0;
            col_rst=0;
            enable_count_ROW=0;
            R_row=row;
            R_col=col;
            if(finish_ROW)
                next_state=4'b1010;
            else
                next_state=4'b0001;
        end
    4'b1010:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
            enable_count_K=0;
            enable_count_COL=0;
            ld_D=0;
            k_rst=0;
            col_rst=0;
            enable_count_ROW=0;
            next_state=4'b1010; 
            row_rst=0;
            R_row=row;
            R_col=col;
        end
    default:
        begin
            A_row=row;
            A_col=k;
            B_row=k;
            B_col=col;
            R_row=row;
            R_col=col;
           enable_count_K=0;
           enable_count_COL=0;
           ld_D=0;
           k_rst=0;
           R_row=row;
           R_col=col;
           row_rst=0;
           col_rst=0;
           enable_count_ROW=0;
           next_state=4'b1010;
        end
    endcase
  end

  always @(posedge clk, posedge rst)
  begin
    if (rst) 
      current_state <= 4'b0000;
    else 
      current_state <= next_state;
  end
  endmodule