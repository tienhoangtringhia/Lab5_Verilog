`timescale 1ns/1ns

module t_ex01;

	wire [2:0] s; 
	wire u; 
	wire v; 
	wire w; 
	wire x; 
	wire y; 
	wire m_a;

	wire m_b;

	wire [2:0] m_c;
	wire [2:0] u_c; 
	wire [2:0] v_c; 
	wire [2:0] w_c; 
	wire [2:0] x_c; 
	wire [2:0] y_c; 

	reg [7:0] t_data_in;

	assign s = t_data_in[7:5]; 
	assign u = t_data_in[4]; 
	assign v = t_data_in[3]; 
	assign w = t_data_in[2]; 
	assign x = t_data_in[1]; 
	assign y = t_data_in[0]; 

	assign u_c = t_data_in[2:0]; 
	assign v_c = t_data_in[3:1]; 
	assign w_c = t_data_in[4:2]; 
	assign x_c = t_data_in[5:3]; 
	assign y_c = t_data_in[6:4]; 

	ex01_a ex01_a_01 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .m(m_a));


	ex01_b #(.DATA_WIDTH(1)) 
		ex01_b_01 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .m(m_b));


	ex01_c #(.DATA_WIDTH(3)) 
		ex01_c_01 (.s(s), .u(u_c), .v(v_c), .w(w_c), .x(x_c), .y(y_c), .m(m_c));

	initial begin
		# 10 t_data_in = {3'b000,5'b00000};
		
		# 10 t_data_in = {3'b111,5'b10101};
		# 10 t_data_in = {3'b000,5'b01010};
		# 10 t_data_in = {3'b000,5'b10101};
		# 10 t_data_in = {3'b001,5'b01010};
		# 10 t_data_in = {3'b001,5'b10101};
		# 10 t_data_in = {3'b010,5'b01010};
		# 10 t_data_in = {3'b010,5'b10101};
		# 10 t_data_in = {3'b011,5'b01010};
		# 10 t_data_in = {3'b011,5'b10101};
		# 10 t_data_in = {3'b100,5'b01010};
		# 10 t_data_in = {3'b100,5'b10101};
		# 10 t_data_in = {3'b101,5'b01010};
		# 10 t_data_in = {3'b101,5'b10101};
		# 10 t_data_in = {3'b110,5'b01010};
		# 10 t_data_in = {3'b110,5'b10101};
		# 10 t_data_in = {3'b111,5'b01010};

		# 10 t_data_in = {3'b111,5'b10011};
		# 10 t_data_in = {3'b000,5'b01100};
		# 10 t_data_in = {3'b000,5'b10011};
		# 10 t_data_in = {3'b001,5'b01100};
		# 10 t_data_in = {3'b001,5'b10011};
		# 10 t_data_in = {3'b010,5'b01100};
		# 10 t_data_in = {3'b010,5'b10011};
		# 10 t_data_in = {3'b011,5'b01100};
		# 10 t_data_in = {3'b011,5'b10011};
		# 10 t_data_in = {3'b100,5'b01100};
		# 10 t_data_in = {3'b100,5'b10011};
		# 10 t_data_in = {3'b101,5'b01100};
		# 10 t_data_in = {3'b101,5'b10011};
		# 10 t_data_in = {3'b110,5'b01100};
		# 10 t_data_in = {3'b110,5'b10011};
		# 10 t_data_in = {3'b111,5'b01100};
	end

	initial begin
		# 350   $finish;
	end

	initial begin
		$vcdplusfile ("Ex01_Waveform.vpd");
		$vcdpluson();
	end

endmodule
