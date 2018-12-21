`timescale 1ns/1ns

module t_ex04;

	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	wire [3:0] s;
	wire cout;

	ex04 ex04_01(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

	initial begin
		#0   cin = 0;
			 a = 0;
			 b = 0;
		#50  a = 0;
			 b = 1;
		#100 a = 3;    
			 b = 4;
		#150 a = 4;
			 b = 4;
		#200 cin = 1;
			 a = 1;
			 b = 2;
		#250 a = 7;
			 b = 0;
		#300 a = 1;
			 b = 7;
		#350 cin = 0;
			 a = 3;
			 b = 7;
		#400 a = 8;
			 b = 5;
		#450 a = 8;
			 b = 7;
		#500 cin = 1;
			 a = 7;
			 b = 6;
		#550 a = 8;
			 b = 8;
		#600  $finish;    
	end

	initial begin
		$vcdplusfile ("Ex4_Waveform.vpd");
		$vcdpluson();
	end

endmodule
