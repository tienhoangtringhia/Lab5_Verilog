module ex03 (ena, clk, rst_n, trigger);

	input clk;
	input rst_n;
	input ena;

	output trigger;

	wire [3:0] w_ena;
	wire [3:0] w_q;

	assign w_ena[0] = ena;

	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) 
		begin
			d_ff d_ff(.clk(clk), .rst_n(rst_n), .d(w_ena[i]), .q(w_q[i]) );
			if(i+1 < 4) begin
				assign w_ena[i+1] = w_ena[i] && w_q[i];
			end
		end
	endgenerate

	assign trigger = w_q[3];

endmodule


module d_ff (clk, rst_n, d, q);

	input clk;
	input rst_n;
	input d;

	output q;

	reg q;

	always @(posedge clk or negedge rst_n) 
	begin
		if (!rst_n) begin
			q <= 0;
		end
		else begin
			q <= d;
		end
	end

endmodule
