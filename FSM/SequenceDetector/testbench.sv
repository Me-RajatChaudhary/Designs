// Code your testbench here
// or browse Examples
module tb_seq_det_mealy;
  logic clk, clr, x, y;
  
  //Instantiate RTL
  seq_detect_mealy SQDM(.*);
  
  //Drive Stimulus
  initial begin
    clk=1'b1; clr=1'b1; x=1'b0;    
    #3 x=1'b0;
    #3 x=1'b1;
    #3 x=1'b1;
    #3 x=1'b0;
    #3 x=1'b0;
    #3 x=1'b0;
    #2 clr=1'b0;
    #5 $finish;
  end
  
  //Clock generate
  always #1 clk= ~clk; 
  
  //Dump waveforms, monitor
  initial begin
    $dumpfile("sqdm.vcd");
    $dumpvars(0, tb_seq_det_mealy);
    $monitor($time, " clk = %b, x=%b, y=%b, clr=%b", clk, x, y, clr);
  end
    
endmodule
  
