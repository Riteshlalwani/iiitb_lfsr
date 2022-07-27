module iiitb_lfsr_tb(clk1);
output reg clk1;
iiitb_lfsr dut (clk1);
initial
clk1 = 1'b0;
    always 
    begin
        #1
        clk1 = clk1 +1;
        
    end
endmodule
