`timescale 1ns/1ns

	module t_ex05;
	reg [3:0] a;
	reg [3:0] b;

	wire [7:0] p;

	ex05 ex05_01(.a(a), .b(b), .p(p));

	initial begin
		#0    a = 0;
			  b = 0;
		#50   a = 1;
			  b = 0;
		#100   a = 2;    
		      b = 6;
		#150   a = 1;
			  b = 8;
		#200   a = 1;
			  b = 1;
		#250  a = 7;
			  b = 2;
		#300  a = 4;
			  b = 5;
		#350  a = 1;
			  b = 8;
		#400  a = 3;
			  b = 6;
		#450  a = 8;
			  b = 7;
		#500  a = 8;
			  b = 8;
		#550  a = 4'ha;
			  b = 7;
		#600  a = 4'hb;
			  b = 9;
		#650  a = 4'he;
			  b = 4'ha;
		#700  a = 4'hf;
			  b = 4'hf;
		#800 $finish;    
	end

	initial begin
		$vcdplusfile ("Ex5_Waveform.vpd");
		$vcdpluson();
	end

endmodule
