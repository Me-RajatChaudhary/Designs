module srlatch(S,R,En,Q);
  input S,R,En;
  output reg Q;
  
  always @(*)
    begin
      if (En & ~(S) & R) Q=0;
      else if (En & S & ~(R)) Q=1;
      else if (En & ~(S) & ~(R)) Q=1'bz;
    end
endmodule
