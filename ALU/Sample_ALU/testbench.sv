// Code your testbench here
// or browse Examples
module tb_alu;
  logic [7:0]A, B;
  logic [2:0] operation;
  logic en;
  logic [7:0] alu_out;
  
  //Instantiate RTL
  alu AL(.*);
  
  
  //Drive-stimulus
  initial begin
    #2 A=8'h12; B=8'h23; en=1'b1; operation = 3'b000;
    #2 A=8'h34; B=8'h23; en=1'b1; operation = 3'b001;
    #2 A=8'h12; B=8'h23; en=1'b1; operation = 3'b011;
    #2 $finish;
  end

  
  //Dump files, monitor output
  initial begin
  $dumpfile("alu.vcd");
  $dumpvars(0, tb_alu);
  $monitor($time, " A = %h, B= %h, en = %b, operation = %b, alu_out = %h", A, B, en, operation, alu_out);
  end
  
  
endmodule
