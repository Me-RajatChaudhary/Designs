// Code your design here
module complex_pipeline (
  input [3:0] rs1, rs2, rd, func,
  input [7:0] addr,
  input clk1, clk2,
  output [15:0] Zout
);
  
  logic [15:0] L12_A, L12_B, L23_Z, L34_Z;
  logic [3:0] L12_rd, L12_func, L23_rd;
  logic [7:0] L12_addr, L23_addr, L34_addr;
  
  logic [15:0] regbank [0:15]; //16 bit register bank with 16 locations
  logic [15:0] membank [0:255]; //16 bit memory bank with 256 mem locations
  
  assign Zout = L34_Z;
  
  //Stage 1
  always@(posedge clk1) begin
    L12_A <= #2 regbank[rs1];
    L12_B <= #2 regbank[rs2];
    L12_rd <= #2 rd;
    L12_addr <= #2 addr;
    L12_func <= #2 func;
  end
  
  //Stage 2
  always@(negedge clk2) begin
    case(func)
      0: L23_Z <= #2 L12_A + L12_B;
      1: L23_Z <= #2 L12_A - L12_B;
      2: L23_Z <= #2 L12_A * L12_B;
      3: L23_Z <= #2 L12_A;
      4: L23_Z <= #2 L12_B;
      5: L23_Z <= #2 L12_A & L12_B;
      6: L23_Z <= #2 L12_A | L12_B;
      7: L23_Z <= #2 L12_A ^ L12_B;
      8: L23_Z <= #2 -L12_A;
      9: L23_Z <= #2 -L12_B;
      10: L23_Z <= #2 L12_A >> 1;
      11: L23_Z <= #2 L12_A << 1;
      default: L23_Z <= #2 16'hxxxx;
      endcase
      L23_rd <= #2 L12_rd;
      L23_addr <= #2 L12_addr;
    end
      
  //Stage 3
  always@(posedge clk1) begin
    L34_addr <= #2 L23_addr;
    L34_Z <= #2 L23_Z;
    regbank[L23_rd] <= #2 L23_Z;
  end
  
  //Stage 4
  always@(negedge clk2) 
    membank[L34_addr] <= #2 L34_Z;
    
endmodule
