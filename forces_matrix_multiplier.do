add wave -position insertpoint  \
sim:/matrix_multiplier/clk \
sim:/matrix_multiplier/rst \
sim:/matrix_multiplier/k_rst \
sim:/matrix_multiplier/col_rst \
sim:/matrix_multiplier/row_rst \
sim:/matrix_multiplier/ld_D \
sim:/matrix_multiplier/enable_count_COL \
sim:/matrix_multiplier/enable_count_ROW \
sim:/matrix_multiplier/enable_count_K \
sim:/matrix_multiplier/A_col \
sim:/matrix_multiplier/B_col \
sim:/matrix_multiplier/R_col \
sim:/matrix_multiplier/A_row \
sim:/matrix_multiplier/B_row \
sim:/matrix_multiplier/R_row \
sim:/matrix_multiplier/finish_K \
sim:/matrix_multiplier/finish_ROW \
sim:/matrix_multiplier/finish_COL \
sim:/matrix_multiplier/k \
sim:/matrix_multiplier/row \
sim:/matrix_multiplier/col \
sim:/matrix_multiplier/dp/r/Matrix \
sim:/matrix_multiplier/fsm/current_state \
sim:/matrix_multiplier/fsm/next_state
add wave -position insertpoint  \
sim:/matrix_multiplier/dp/a/Matrix
add wave -position insertpoint sim:/matrix_multiplier/dp/b/*
add wave -position insertpoint  \
sim:/matrix_multiplier/dp/mul/data_out
add wave -position insertpoint  \
sim:/matrix_multiplier/dp/adder/data_out
add wave -position insertpoint  \
sim:/matrix_multiplier/dp/mul/data_1 \
sim:/matrix_multiplier/dp/mul/data_2 \
sim:/matrix_multiplier/dp/mul/data_out 
add wave -position insertpoint  \
sim:/matrix_multiplier/dp/a/data_out
force -freeze sim:/matrix_multiplier/clk 1 0, 0 {50000 ps} -r 100000
force -freeze sim:/matrix_multiplier/rst 1 0
force -freeze sim:/matrix_multiplier/rst 0 120000
force -freeze sim:/matrix_multiplier/rst 1 240000
