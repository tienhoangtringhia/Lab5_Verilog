`timescale 1ns/1ns

module t_ex06;

	reg t_clk;
	reg t_rst_n;
	reg t_w;

	wire t_out;

	always begin
		#0  t_clk = 0;
		#10 t_clk = 1;
		#10;
	end

	ex06 ex06(.clk(t_clk), .rst_n(t_rst_n), .w(t_w), .out(t_out));

	initial begin
		#0   t_rst_n = 0;
			 t_w = 0;
		#20  t_rst_n = 1;
			 t_w = 0;
		#20  t_w = 1; 
		#80  t_w = 0; 
		#40  t_w = 1; 
		#60  t_w = 0; 
		#20  t_rst_n = 0;
			 t_w = 1; 
		#40  t_rst_n = 1;
			 t_w = 0; 
		#20  t_w = 1; 
		#20  t_w = 0; 
		#200 $finish;
	end

	initial begin
		$vcdplusfile ("Ex6_Waveform.vpd");
		$vcdpluson();
	end

endmodule
