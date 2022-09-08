// Code your design here
module seq_detect_mealy (y, x, clk, clr);
  input clk, clr, x;
  output reg y;
  
  reg [2:0] state, next_state;  
  parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
  
  //initial begin state = S0; end;

  //state-register
  always@(negedge clk or negedge clr) begin
    if (~clr) state <= S0;
    else state <= next_state;
  end
  
  
  //next-state
  always@(*) begin
    case (state)
      S0: next_state = (x==0) ? S1 : S2;
      S1: next_state = (x==0) ? S3 : S4;
      S2: next_state = (x==0) ? S5 : S6;
      S3: next_state = (x==0) ? S3 : S4;
      S4: next_state = (x==0) ? S5 : S6;
      S5: next_state = (x==0) ? S3 : S4;
      S6: next_state = (x==0) ? S5 : S6;
      default: next_state = (x==0) ? S1 : S2; 
    endcase
  end
  

  //output
    assign y = (state == S3) || (state == S5);
  
      
  
endmodule
