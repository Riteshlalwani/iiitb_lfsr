module dff (Q, D, Clock);
 output Q;
 input D;
 input reset;
 input Clock;

 reg Q;

 always @(posedge Clock)
 begin
   if (reset)
     Q = 1;
   else 
     Q = D;
 end
endmodule

module iiitb_lfsr() ; 
 input D;
 input clk;
 input reset;
 output Q1, Q2, Q3, Q4, Q5;
 reg Q; 

 dff DFF1(Q1^Q5, D, reset, clk);
 dff DFF2(Q2, Q1, reset, clk);
 dff DFF3(Q3, Q2, reset, clk);
 dff DFF4(Q4, Q3, reset, clk);
 dff DFF5(Q5, Q4, reset, clk);
endmodule 
