`timescale 1ns/1ns

module t_ex02;

	wire [2:0] s; 
	wire [2:0] m;
	wire [2:0] u; 
	wire [2:0] v; 
	wire [2:0] w; 
	wire [2:0] x; 
	wire [2:0] y; 

	reg  [7:0] t_data_in;

	wire [6:0] led; 

	assign s = t_data_in[7:5]; 
	assign u = t_data_in[2:0]; 
	assign v = t_data_in[3:1]; 
	assign w = t_data_in[4:2]; 
	assign x = t_data_in[5:3]; 
	assign y = t_data_in[6:4]; 

	ex02 ex02 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .led(led));

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
			$vcdplusfile ("Ex2_WaveForm.vpd");
			$vcdpluson();
	end

endmodule
