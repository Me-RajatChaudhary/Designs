// Code your testbench here
// or browse Examples
module regbank_test;
  logic clk, write, reset;
  logic [4:0]sr1, sr2, dr;
  logic [31:0] wrData, rdData1, rdData2;
  integer k;
  
  //Instantiate RTL
  regbank RB(.*);
  
  //Initialise clock
  initial clk = 0;
  
  //generate clock
  always #5 clk = ~clk;
  
  //Drive Stimulus
  initial begin
    #7 for (k=0; k<32; k++) begin
      dr=k; wrData = 10*k; write =1;
      #10 write = 0;
    end
    #20 for (k=0; k<32; k= k+2) begin
      sr1=k; sr2= k+1;
      #5;
      $display("reg[%2d] = %d, reg[%2d] = %d", sr1, rdData1, sr2, rdData2);
    end
    #2000 $finish;
  end
  
  //Dump files
  initial begin
    $dumpfile("regbank.vcd");
    $dumpvars(0, regbank_test);
    #1 reset=1; write = 0;
    #5 reset = 0;
    
  end
endmodule

          
