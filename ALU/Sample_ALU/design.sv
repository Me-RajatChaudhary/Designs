// Code your design here
module alu (
  input [7:0]A,
  input [7:0]B,
  input [2:0]operation,
  input en,
  output [7:0]alu_out  
);
  
  reg [7:0]alu_reg;
  
  assign alu_out = (en==1) ? alu_reg : 4'bz;
  
  always@(*) 
    case (operation)
      3'b000: alu_reg = A + B;
      3'b001: alu_reg = A - B;
      3'b011: alu_reg = ~A;
      default: alu_reg = 4'b0;
    endcase

  
endmodule
