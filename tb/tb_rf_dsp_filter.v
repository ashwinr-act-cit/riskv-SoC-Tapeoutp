`timescale 1ns / 1ps

module tb_rf_dsp_filter;

   
    reg clk;
    reg rst_n;
    reg [15:0] data_in;
    reg valid_in;

   
    wire [15:0] data_out;
    wire valid_out;

   
    rf_dsp_filter uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .data_in(data_in),
        .valid_in(valid_in), 
        .data_out(data_out), 
        .valid_out(valid_out)
    );

 
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

   
    initial begin
 
        rst_n = 0;
        data_in = 0;
        valid_in = 0;

       
        #100;
        rst_n = 1;
        
       
        #10; data_in = 16'd100; valid_in = 1;
        #10; data_in = 16'd150; 
        #10; data_in = 16'd110;
        #10; data_in = 16'd90;
        #10; data_in = 16'd105;
        #10; valid_in = 0;
        
        #50;
        $finish; 
    end
    

    initial begin
        $dumpfile("rf_dsp_waves.vcd");
        $dumpvars(0, tb_rf_dsp_filter);
    end

endmodule
