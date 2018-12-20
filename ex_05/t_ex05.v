`timescale 1ns/1ns

	module t_ex05;
	reg [3:0] a;
	reg [3:0] b;

	wire [7:0] p;

	ex05 ex05_01(.a(a), .b(b), .p(p));

	initial begin
		#0    a = 0;
			  b = 0;
		#20   a = 1;
			  b = 0;
		#40   a = 2;    
		      b = 6;
		#60   a = 1;
			  b = 8;
		#80   a = 1;
			  b = 1;
		#100  a = 7;
			  b = 2;
		#120  a = 4;
			  b = 5;
		#140  a = 1;
			  b = 8;
		#160  a = 3;
			  b = 6;
		#180  a = 8;
			  b = 7;
		#200  a = 8;
			  b = 8;
		#220  a = 4'ha;
			  b = 7;
		#240  a = 4'hb;
			  b = 9;
		#260  a = 4'he;
			  b = 4'ha;
		#280  a = 4'hf;
			  b = 4'hf;
		#300 $finish;    
	end

	initial begin
		$vcdplusfile ("Ex5_Waveform.vpd");
		$vcdpluson();
	end

endmodule
