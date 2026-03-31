
// Description: 4-tap Moving Average Filter for RF/Baseband signal smoothing
// Designed to be attached to a RISC-V SoC via a memory-mapped interface.

module rf_dsp_filter (
    input wire clk,
    input wire rst_n,
    input wire [15:0] data_in,
    input wire valid_in,
    output reg [15:0] data_out,
    output reg valid_out
);

    reg [15:0] shift_reg_0, shift_reg_1, shift_reg_2, shift_reg_3;
    reg [17:0] sum; 

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg_0 <= 16'd0;
            shift_reg_1 <= 16'd0;
            shift_reg_2 <= 16'd0;
            shift_reg_3 <= 16'd0;
            data_out    <= 16'd0;
            valid_out   <= 1'b0;
        end else if (valid_in) begin
            // Shift data
            shift_reg_0 <= data_in;
            shift_reg_1 <= shift_reg_0;
            shift_reg_2 <= shift_reg_1;
            shift_reg_3 <= shift_reg_2;
            
            
            sum <= data_in + shift_reg_0 + shift_reg_1 + shift_reg_2;
            
          
            data_out <= sum[17:2];
            valid_out <= 1'b1;
        end else begin
            valid_out <= 1'b0;
        end
    end
endmodule
