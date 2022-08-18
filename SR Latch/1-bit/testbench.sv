module srlatchtest;
  reg A; reg B; reg E; wire C;
  srlatch SR(.S(A), .R(B), .En(E), .Q(C));
  
  initial
    begin
      $dumpfile("srlatch.vcd");
      $dumpvars(0, srlatchtest);
      $monitor($time, "A=%b, B=%b, E=%b,C=%b", A,B,E,C);
      #5 A=1'b0; B=1'b1; E=1'b1;
      #5 A=1'b1; B=1'b1; E=1'b1;
      #5 A=1'b1; B=1'b0; E=1'b1;            
      #5 A=1'b1; B=1'b1; E=1'b0;
    end
endmodule
