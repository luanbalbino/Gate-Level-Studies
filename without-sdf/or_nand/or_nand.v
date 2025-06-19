`timescale 1ps/1ps
module or_nand(OUT, A, B, C);
	output OUT;
	
	input A, B, C;
	
	or i1 (N1, A, B);
	
	nand i2(OUT, N1, C);
	
	specify
		//pathdelay_enhanced;
		(A => OUT) = (30, 29);
		(B => OUT) = (20, 19);
		(C => OUT) = (10, 9);
 endspecify
endmodule