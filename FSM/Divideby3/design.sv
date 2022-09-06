// Divide the clk frequency by 3 - Output is high for one clock cycle out of every 3 clock cycles)
module divideby3FSM(
  input clk,
  input reset,
  output q
);
  reg [1:0] state, nextstate;
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  
  //state-register
  always@(posedge clk or posedge reset) begin
    if (reset) state <= S0;
    else state <= nextstate;
  end
  
  //next-state logic
  always@(*) begin
    case (state)
      S0: nextstate = S1;
      S1: nextstate = S2;
      S2: nextstate = S0;
      default: nextstate = S0;
    endcase
  end
  
  //output logic
  assign q = (state == S0);
    
endmodule
