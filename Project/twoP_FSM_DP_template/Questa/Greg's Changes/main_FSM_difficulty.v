//-----------------------------------------------------
// Design Name : main_FSM
// File Name   : main_FSM.v
// Function    : 2 Phase Clock main_FSM
// 		 Controller processes load input and issues
// 		 start signal to data path dp.
// 		 Waits then for done signal from the datapath.
//-----------------------------------------------------
module main_FSM (clka, clkb, restart, enter, solved, difficulty, won, register_inp_flag, try_again_flag, dp_check, ridx_a, ridx_b, state, fill_flag);
//-------------Input Ports-----------------------------
input   clka, clkb, restart, enter, solved;
// input   [1:0] difficulty;
input difficulty;
//-------------Output Ports---s-------------------------
output  won, register_inp_flag, try_again_flag, dp_check, ridx_a, ridx_b, state[3:0], fill_flag[7:0];
//-------------Input ports Data Type-------------------
wire    clka, clkb, restart, enter, solved;
// wire    [1:0] difficulty;
wire difficulty;
//-------------Output Ports Data Type------------------
reg     won, register_inp_flag, guess_flag, try_again_flag, dp_check, ridx_a, ridx_b;
reg     [7:0] fill_flag;

//——————Internal Constants--------------------------
parameter SIZE = 4;
wire [1:0] easy_mode = 2'b01, medium_mode = 2'b10, hard_mode = 2'b11;
parameter REG_INP  = 4'b0000, /*GUESS = 4'b0001,*/ CHECK = 4'b0010, WRONG = 4'b0011, FIN = 4'b0100;
parameter EMPTY = 4'b0101, SET_DIFF = 4'b0110, EASY = 4'b0111, MEDIUM = 4'b1000, HARD = 4'b1001, IDLE = 4'b1010; 

//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state;    	// Initial FSM state reg and then after
					// processing new output FSM state reg
wire  [SIZE-1:0]          temp_state; 	// Internal wire for output of function
					// for setting next state
reg   [SIZE-1:0]          next_state; 	// Temporary reg to hold next state to
					// update state on output
//----------Code startes Here------------------------
assign temp_state = fsm_function(state, enter, solved, difficulty);
//----------Function for Combinational Logic to read inputs -----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state;
  // input [1:0] difficulty;
  input difficulty;
  input enter;
  input solved;
  case(state)
    IDLE: begin
      fsm_function = EMPTY;
      end 
    EMPTY: begin
        fsm_function = SET_DIFF;
      end
    SET_DIFF: begin
                // if ((difficulty[1] == 1'b0) & (difficulty[0] == 1'b1) & (enter == 1'b1)) begin
                //   fsm_function = EASY;
                // end else if ((difficulty[1] == 1'b1) & (difficulty[0] == 1'b0) & (enter == 1'b1)) begin
                //   fsm_function = MEDIUM;
                // end else if ((difficulty[1] == 1'b1) & (difficulty[0] == 1'b1) & (enter == 1'b1)) begin
                //   fsm_function = HARD;
                // if (enter == 1'b1) begin
                //   fsm_function = HARD;
                // end else begin
                //   fsm_function = SET_DIFF;
                // end
                fsm_function = HARD;
              end
    EASY: begin
                fsm_function = REG_INP; 
          end
    MEDIUM: begin
                fsm_function = REG_INP; 
            end
    HARD: begin
                fsm_function = REG_INP; 
          end
   REG_INP: begin
        if (enter == 1) begin
          fsm_function = CHECK;
        end
        else begin
          fsm_function = REG_INP;
        end
        end 
  //  GUESS: begin
  //            if (enter) begin
  //             fsm_function = CHECK;
  //             end
  //             else begin
  //               fsm_function = GUESS;
  //             end
  //        end
   CHECK: begin
              if (solved) begin
              fsm_function = FIN;
              end
              else begin
                fsm_function = WRONG;
              end
         end
  WRONG: begin
              if (enter) begin
              fsm_function = REG_INP;
              end
              else begin
                fsm_function = WRONG;
              end
         end
  FIN: begin
          fsm_function = FIN;
         end
  default: fsm_function = IDLE;
  endcase
endfunction
//----------Seq Logic-----------------------------
always @ (negedge clka)
begin : FSM_SEQ
  if (restart == 1'b1) begin
    next_state <= IDLE;
  end else begin
    next_state <= temp_state;
  end
end
//----------Output Logic——————————————
always @ (negedge clkb)
begin : OUTPUT_LOGIC
  case(next_state)
  REG_INP: begin
          state <= next_state;
          register_inp_flag <= 1;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b0;
        end
  // GUESS: begin
  //         state <= next_state;
  //         register_inp_flag <= 0;
  //         guess_flag <= 1;
  //         try_again_flag <= 0;
  //         dp_check <= 1'b0;
  //         ridx_a <= 1'b0;
  //         ridx_b <= 1'b0;
  //         fill_flag <= 8'b00000000;
  //         won <= 1'b0;
  //       end
  CHECK: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b1;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b0;
          end
  WRONG: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 1;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b0;
          end
  FIN: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b1;
        end
  EMPTY: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b0;        
        end
  SET_DIFF: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b1;
          ridx_b <= 1'b1;
          fill_flag <= 8'b00000000;
          won <= 1'b0;
            end
  EASY: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00001111;
          won <= 1'b0; // for testing, four random hints in row 1 and 2
        end
  MEDIUM: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000111;
          won <= 1'b0; // for testing, three random hints in row 1 and 2
          end
  HARD: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000011;
          won <= 1'b0; // for testing, two random hints in row 1 and 2
        end                 
 default: begin
          state <= next_state;
          register_inp_flag <= 0;
          guess_flag <= 0;
          try_again_flag <= 0;
          dp_check <= 1'b0;
          ridx_a <= 1'b0;
          ridx_b <= 1'b0;
          fill_flag <= 8'b00000000;
          won <= 1'b0;
         end
  endcase
end // End Of Block OUTPUT_LOGIC
endmodule // End of Module main_FSM