// Code your design here
module regbank (
  input clk,
  input write,
  input reset,
  input [4:0]sr1, 
  input [4:0]sr2,
  input [4:0]dr,
  input [31:0] wrData,
  output [31:0] rdData1,
  output [31:0] rdData2
);
  
  integer k;
  
  reg [31:0] regfile [0:31];
  
  //Read logic
  assign rdData1 = regfile[sr1];
  assign rdData2 = regfile[sr2];
  
  //Write logic
  always@(posedge clk)
    begin
      if (reset) begin
        for (k=0; k<32; k++) begin
          regfile[k] <=0;
        end
      end
      else begin
        if (write) 
          regfile[dr] <= wrData;
      end
    end
  
endmodule
