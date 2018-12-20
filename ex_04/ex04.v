module ex04 (a, b, cin, s, cout);

	input [3:0] a;
	input [3:0] b;
	input cin;

	output [3:0] s;
	output cout;

	wire   [4:0] c;

	assign c[0] = cin;

	genvar i;
	generate
	for(i = 0; i < 4; i = i + 1) 
		begin
			f_adder f_adder(.a(a[i]), .b(b[i]), .c_in(c[i]), .s(s[i]), .c_out(c[i+1]));

		end
	endgenerate

	assign cout = c[4];

endmodule


module f_adder(a,b,c_in,s,c_out);

	input a;
	input b;
	input c_in;

	output s;
	output c_out;

	assign s = a ^ b ^ c_in;
	assign c_out = (a & b)|(b & c_in)|(a & c_in);

endmodule
