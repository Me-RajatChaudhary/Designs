// Code your testbench here
// or browse Examples
module tb_pipeline;
  logic [9:0]A,B,C,D;
  logic clk;
  logic [9:0] F; 
  
  //Instantiate RTL  
  pipeline PP(.*);
  
  //Initialise Clock
  initial clk = 0;
  //generate clock
  always #10 clk = ~clk;
  
  //Drive Stimulus
  initial begin
    #5 A = 10; B = 12; C = 6; D =3;
    #20 A = 10; B = 10; C = 5; D =3;
    #20 A = 20; B = 11; C = 1; D =4;
    #20 A = 15; B = 10; C = 8; D =2;
    #20 A = 8; B = 15; C = 5; D =0;
    #20 A = 10; B = 20; C = 5; D =3;
    #20 A = 10; B = 10; C = 30; D =1;
    #20 A = 30; B = 1; C = 2; D =4;
  end
  
  //Dump files
  initial begin
    $dumpfile("pipeline.vcd");
    $dumpvars(0, tb_pipeline);
    $monitor($time, " Output = %d", F);
    #200 $finish;
  end
  
  
endmodule
