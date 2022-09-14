// Design
module pipeline (
  input [9:0]A,B,C,D,
  input clk,
  output [9:0] F
);
  
  logic [9:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;
  
  assign F = L34_F;
  
  //Stage 1
  always@(posedge clk) begin
    L12_x1 <= #2 A+B;
    L12_x2 <= #2 C-D;
    L12_D <= D;
  end
  
  //Stage 2
  always@(posedge clk) begin
    L23_x3 <= #2 L12_x1 + L12_x2;
    L23_D <= L12_D;
  end
  
  //Stage 3
  always@(posedge clk)
    L34_F <= #3 L23_x3 * L23_D;
  
endmodule
