// Code your testbench here
// or browse Examples
module TB_D3FSM;
  logic clk;
  logic reset;
  logic q;
  
  //Instantiate the RTL
  divideby3FSM D3(.*);
  
  initial begin
    clk = 1'b1;
    reset=1'b0;
    #5 reset = 1'b1;
    #2 reset = 1'b0;
    #28 reset = 1'b1;
    #2 reset = 1'b0;
    #60 $finish;
  end
  
  always #2 clk = ~clk;
  
  initial begin
    $dumpfile("divideby3FSM.vcd");
    $dumpvars(0, TB_D3FSM);
    $monitor ($time, "clk=%b, reset = %b, out=%b", clk, reset, q);
  end
    
endmodule
  
  
