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
		#20  a = 0;
			 b = 1;
		#40  a = 3;    
			 b = 4;
		#60  a = 4;
			 b = 4;
		#80  cin = 1;
			 a = 1;
			 b = 2;
		#100 a = 7;
			 b = 0;
		#120 a = 1;
			 b = 7;
		#140 cin = 0;
			 a = 3;
			 b = 7;
		#160 a = 8;
			 b = 5;
		#180 a = 8;
			 b = 7;
		#200 cin = 1;
			 a = 7;
			 b = 6;
		#220 a = 8;
			 b = 8;
		#240  $finish;    
	end

	initial begin
		$vcdplusfile ("Ex4_Waveform.vpd");
		$vcdpluson();
	end

endmodule
