|
| top_module.cmd
|
| Comments
| Elec422/527 Sudoku project
| define vectors for easier display

vector p_in_diff_cell_val p_in_diff_cell_val_1 p_in_diff_cell_val_0
| vector in_rand_setup in_rand_setup\[3\] in_rand_setup\[2\] in_rand_setup\[1\] in_rand_setup\[0\]
| vector in_rand_A in_rand_A\[3\] in_rand_A\[2\] in_rand_A\[1\] in_rand_A\[0\]
| vector in_rand_B in_rand_B\[3\] in_rand_B\[2\] in_rand_B\[1\] in_rand_B\[0\]

| vector out_state out_state\[3\] out_state\[2\] out_state\[1\] out_state\[0\]
| vector out_fill_flag out_fill_flag\[15\] out_fill_flag\[14\] out_fill_flag\[13\] out_fill_flag\[12\] out_fill_flag\[11\] out_fill_flag\[10\] out_fill_flag\[9\] out_fill_flag\[8\] out_fill_flag\[7\] out_fill_flag\[6\] out_fill_flag\[5\] out_fill_flag\[4\] out_fill_flag\[3\] out_fill_flag\[2\] out_fill_flag\[1\] out_fill_flag\[0\]

| vector p_out_real_board_0 p_out_real_board_0_2 p_out_real_board_0_1 p_out_real_board_0_0
| vector p_out_real_board_1 p_out_real_board_1_2 p_out_real_board_1_1 p_out_real_board_1_0
| vector p_out_real_board_2 p_out_real_board_2_2 p_out_real_board_2_1 p_out_real_board_2_0
| vector p_out_real_board_3 p_out_real_board_3_2 p_out_real_board_3_1 p_out_real_board_3_0
| vector p_out_real_board_4 p_out_real_board_4_2 p_out_real_board_4_1 p_out_real_board_4_0
| vector p_out_real_board_5 p_out_real_board_5_2 p_out_real_board_5_1 p_out_real_board_5_0
| vector p_out_real_board_6 p_out_real_board_6_2 p_out_real_board_6_1 p_out_real_board_6_0
| vector p_out_real_board_7 p_out_real_board_7_2 p_out_real_board_7_1 p_out_real_board_7_0
| vector p_out_real_board_8 p_out_real_board_8_2 p_out_real_board_8_1 p_out_real_board_8_0
| vector p_out_real_board_9 p_out_real_board_9_2 p_out_real_board_9_1 p_out_real_board_9_0
| vector p_out_real_board_10 p_out_real_board_10_2 p_out_real_board_10_1 p_out_real_board_10_0
| vector p_out_real_board_11 p_out_real_board_11_2 p_out_real_board_11_1 p_out_real_board_11_0
| vector p_out_real_board_12 p_out_real_board_12_2 p_out_real_board_12_1 p_out_real_board_12_0
| vector p_out_real_board_13 p_out_real_board_13_2 p_out_real_board_13_1 p_out_real_board_13_0
| vector p_out_real_board_14 p_out_real_board_14_2 p_out_real_board_14_1 p_out_real_board_14_0
| vector p_out_real_board_15 p_out_real_board_15_2 p_out_real_board_15_1 p_out_real_board_15_0

vector p_out_user_board_0 p_out_user_board_0_2 p_out_user_board_0_1 p_out_user_board_0_0
vector p_out_user_board_1 p_out_user_board_1_2 p_out_user_board_1_1 p_out_user_board_1_0
vector p_out_user_board_2 p_out_user_board_2_2 p_out_user_board_2_1 p_out_user_board_2_0
vector p_out_user_board_3 p_out_user_board_3_2 p_out_user_board_3_1 p_out_user_board_3_0
vector p_out_user_board_4 p_out_user_board_4_2 p_out_user_board_4_1 p_out_user_board_4_0
vector p_out_user_board_5 p_out_user_board_5_2 p_out_user_board_5_1 p_out_user_board_5_0
vector p_out_user_board_6 p_out_user_board_6_2 p_out_user_board_6_1 p_out_user_board_6_0
vector p_out_user_board_7 p_out_user_board_7_2 p_out_user_board_7_1 p_out_user_board_7_0
vector p_out_user_board_8 p_out_user_board_8_2 p_out_user_board_8_1 p_out_user_board_8_0
vector p_out_user_board_9 p_out_user_board_9_2 p_out_user_board_9_1 p_out_user_board_9_0
vector p_out_user_board_10 p_out_user_board_10_2 p_out_user_board_10_1 p_out_user_board_10_0
vector p_out_user_board_11 p_out_user_board_11_2 p_out_user_board_11_1 p_out_user_board_11_0
vector p_out_user_board_12 p_out_user_board_12_2 p_out_user_board_12_1 p_out_user_board_12_0
vector p_out_user_board_13 p_out_user_board_13_2 p_out_user_board_13_1 p_out_user_board_13_0
vector p_out_user_board_14 p_out_user_board_14_2 p_out_user_board_14_1 p_out_user_board_14_0
vector p_out_user_board_15 p_out_user_board_15_2 p_out_user_board_15_1 p_out_user_board_15_0

| 

logfile top_module_sudoku.log
ana p_in_clka p_in_clkb p_in_restart p_in_new_game p_in_enter p_in_diff_cell_val
| ana out_state in_rand_setup in_rand_A in_rand_B 
ana p_out_solved
ana out_user_board_6_2 out_user_board_6_1 out_user_board_6_0
ana p_out_user_board_0 p_out_user_board_1 p_out_user_board_2 p_out_user_board_3
ana p_out_user_board_4 p_out_user_board_5 p_out_user_board_6 p_out_user_board_7
ana p_out_user_board_8 p_out_user_board_9 p_out_user_board_10 p_out_user_board_11
ana p_out_user_board_12 p_out_user_board_13 p_out_user_board_14 p_out_user_board_15

| ana out_real_board_0 out_real_board_0 out_real_board_3 out_real_board_3
| ana out_real_board_4 out_real_board_0 out_real_board_6 out_real_board_7
| ana out_real_board_8 out_real_board_0 out_real_board_10 out_real_board_11
| ana out_real_board_12 out_real_board_13 out_real_board_14 out_real_board_15

| ana out_fill_flag

|   cycle               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 98 90 91 92 93 94 95 96 97 98 99 100
| V   in_restart          1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
| V   in_new_game         0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0
| V   in_enter            0  0  0  0  0  0  1  0  1  0  1  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  0  0  0
| V   in_diff_cell_val    00 00 00 00 00 00 00 00 00 01 01 00 00 00 11 11 00 00 01 00 00 00 00 10 11 11 00 00 11 01 01 01 01 00 11 11 01 01 01 01 01 01 01 10 10 10 01 01 11 11 11 10 10 00 00 00 10 10 01 11 11 10 10 10 11 11 10 10 11 11 11 11 11 00 11 11 11 11 01 11 11 11 11 10 00 00 00 00 00 10 10 11 11 11 10 10 10 10 10 10

|   cycle               1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 98 90 91 92 93 94 95 96 97 98 99 100
V   p_in_restart          1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0
V   p_in_new_game         0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
V   p_in_enter            0  0  0  0  0  0  1  0  1  0  1  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  1  1  1  0  0  0  0  0
V   p_in_diff_cell_val    00 00 00 00 00 00 00 00 00 01 01 00 00 00 10 10 00 00 01 00 00 00 00 10 11 11 00 00 11 01 01 01 01 00 11 11 01 01 01 01 01 01 01 10 10 10 01 01 11 11 11 10 10 00 00 00 10 10 01 11 11 10 10 10 11 11 10 10 11 11 11 11 11 00 11 11 11 11 01 11 11 11 11 10 00 00 11 11 11 10 10 10 10 10 10

| Two phase clock with non-overlap period - same as Questa testbench
clock p_in_clka 0 1 0 0
clock p_in_clkb 0 0 0 1
R