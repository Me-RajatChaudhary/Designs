// Code your design here
primitive udpDff (Q, D, Clk, Rst);
	input Clk, D, Rst;
	output reg Q;

	table
      //	D	Clk	Rst		Q	Q_new
      		?	?	1	:	?: 	0	;
     		?  (10)	0	:	?:  -   ;
     		1  (01)	0	:	?:  1   ;
      		0  (01)	0	:	?:  0   ;
    endtable
      
endprimitive
