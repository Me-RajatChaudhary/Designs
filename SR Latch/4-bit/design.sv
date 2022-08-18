module srlatch(s,r,en,q);
  input s,r,en;
  output reg q;
  
  always @(*)
    begin
      if (en & ~(s) & r) q=0;
      else if (en & s & ~(r)) q=1;
      else if (en & ~(s) & ~(r)) q=1'bz;
    end
endmodule

module srlatch_4(S,R,En,Q);
  input [3:0] S,R;
  input En;
  output [3:0]Q;
  
  srlatch sr0(S[0],R[0],En,Q[0]);
  srlatch sr1(S[1],R[1],En,Q[1]);
  srlatch sr2(S[2],R[2],En,Q[2]);
  srlatch sr3(S[3],R[3],En,Q[3]);
endmodule
