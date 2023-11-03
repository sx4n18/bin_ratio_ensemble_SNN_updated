`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 12:18:39 PM
// Design Name: 
// Module Name: Controller_state_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller_state_machine(
      input clk,
      input rst_n,
      input pre_processing_done,
      input [9:0] off_set_value,
      output reg [5:0] offset_mem_addr,
      output reg [13:0] CSR_w_addr,
      output reg w_n_a_valid,
      output reg load_voltage,
      output reg export_voltage,
      output reg vol_mem_control,
      output reg [15:0] init_mem_vol,
      output reg current_step_finished
      
    );
    


reg [5:0] hidden_neuron_cnt;
reg [2:0] time_step_cnt;
reg [3:0] current_state;
reg [3:0] next_state;
reg [9:0] off_set_value_rec;
//reg [1:0] tidy_cnt;
parameter IDLE = 1;
parameter Init = 0;
parameter pull_offset = 2;
parameter fetch_w_n_a_0 = 3;
parameter fetch_w_n_a_1 = 4;
parameter fetch_w_n_a_2 = 5;
parameter tidy_up = 6;
parameter dump_mem_vol_0 = 7;
parameter dump_mem_vol_1 = 8;
parameter completion = 9;



always @(posedge clk, negedge rst_n)
begin
  if (!rst_n)
  begin
    hidden_neuron_cnt <= 0;
    time_step_cnt <= 0;
    current_state <= Init;
    //offset_mem_addr <= 0;
    CSR_w_addr <= 0;
    off_set_value_rec <= 0;
    //tidy_cnt <= 0;
  end
  else
  begin
    current_state <= next_state;
  //end
//end
//always @(posedge clk)
//begin
   
   case(current_state)
   
    Init:
        begin
        if (hidden_neuron_cnt == 39)
            begin
                hidden_neuron_cnt <= 0;
            end
        else
            begin
                hidden_neuron_cnt <= hidden_neuron_cnt +1;
            end
        end

    IDLE:
        begin

        end

    pull_offset:
        begin
      /*
        if(time_step_cnt == 4)
            begin
                time_step_cnt <= 0;
            end
        else if(hidden_neuron_cnt == 39)
            begin
                time_step_cnt <= time_step_cnt +1;
                hidden_neuron_cnt <= 0; 
            end
        else
            begin
                hidden_neuron_cnt <= hidden_neuron_cnt +1; 
            end
      */
        end


    fetch_w_n_a_0:
        begin
            off_set_value_rec <= off_set_value;
        end

    fetch_w_n_a_1:
        begin

        end

    fetch_w_n_a_2:
        begin
            off_set_value_rec <= off_set_value_rec -1;
            CSR_w_addr <= CSR_w_addr +1;
        end
   

    tidy_up:
        begin
/*
if (tidy_cnt == 1)
   begin
      tidy_cnt <= 0;
   end
else
    begin
        tidy_cnt <= tidy_cnt +1;
    end
*/
        end 


    dump_mem_vol_1:
        begin
            if(time_step_cnt < 3)
            begin
                if(hidden_neuron_cnt == 39)
                begin
                    hidden_neuron_cnt <= 0;
                    time_step_cnt <= time_step_cnt +1;
                    CSR_w_addr <= 0;
                end
                else
                begin
                    hidden_neuron_cnt <= hidden_neuron_cnt +1;
                end
            end
            else
            begin
                if(hidden_neuron_cnt == 39)
                begin
                    hidden_neuron_cnt <= 0;
                    time_step_cnt <= 0;
                    CSR_w_addr <= 0;
                end
                else
                begin
                    hidden_neuron_cnt <= hidden_neuron_cnt +1;
                end
            end
        end

    endcase

    end
end

always @(*)
begin
//parameter initialisation to avoid latch
load_voltage = 0;
offset_mem_addr = 0;
//next_state = current_state;
vol_mem_control = 0;
init_mem_vol = 0;
export_voltage = 0;
w_n_a_valid = 0;
current_step_finished = 0;

case(current_state)

Init:
begin
   vol_mem_control = 1;
   init_mem_vol = 63;
   offset_mem_addr = hidden_neuron_cnt;
   if(hidden_neuron_cnt == 39)
   begin 
      next_state = IDLE;
   end
   else
   begin
      next_state = Init;      
   end

end


IDLE:
begin
  offset_mem_addr = hidden_neuron_cnt;
  if(pre_processing_done)
  begin
     next_state = pull_offset;
  end
  else
  begin
    next_state = IDLE;
  end
end

pull_offset:
begin
/*
  if(time_step_cnt == 3'b100)
  begin
    next_state = completion;
  end
  else 
  begin
    next_state = fetch_w_n_a_0;
    offset_mem_addr = hidden_neuron_cnt;
  end
  */
  next_state = fetch_w_n_a_0;
  offset_mem_addr = hidden_neuron_cnt;
end

fetch_w_n_a_0:
begin
   load_voltage = 1;
   next_state = fetch_w_n_a_1; 
end

fetch_w_n_a_1:
begin
    next_state = fetch_w_n_a_2;
    
end


fetch_w_n_a_2:
begin
  w_n_a_valid = 1;
  if (off_set_value_rec == 1)
  begin
      next_state = tidy_up;
  end
  else
  begin
     next_state = fetch_w_n_a_1;
  end

end

tidy_up:
begin
/*
  if(tidy_cnt == 1)
  begin
  next_state = dump_mem_vol_0;
  end
  else
  begin
  next_state = tidy_up;
  end  
*/
next_state = dump_mem_vol_0;
end

dump_mem_vol_0:
begin
  export_voltage = 1;
  next_state = dump_mem_vol_1;
end

dump_mem_vol_1:
begin
    offset_mem_addr = hidden_neuron_cnt;
    if(time_step_cnt == 3 && hidden_neuron_cnt == 39) // if finished all 4 time steps and all 
    begin
        next_state = completion;
    end
    else
    begin
        next_state = pull_offset;
    end

end

completion:
begin
    current_step_finished = 1;
    next_state = Init;
end

default:
begin
   next_state = Init;
end

endcase



end

endmodule
