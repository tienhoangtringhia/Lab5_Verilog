module ex05 (m, q, p);

	input [3:0] m;
	input [3:0] q;

	output [7:0] p;

	wire [4:0]c_in[0:4];
	wire [4:0]m_in[0:4];

	assign m_in[0][4:0] = 5'b00000;

	genvar i;
	genvar j;

	generate
	for(i = 0; i < 4; i = i + 1) 
	begin 
		assign c_in[i][0] = 1'b0;
		
		m_adder m_adder_01(.a(m[0]), .b(q[0]), .m_in(m_in[0][1]), .c_in(c_in[0][0]), .m_out(m_in[1][0]), .c_out(c_in[0][1]));
		m_adder m_adder_02(.a(m[0]), .b(q[1]), .m_in(m_in[0][2]), .c_in(c_in[0][1]), .m_out(m_in[1][1]), .c_out(c_in[0][2]));
		m_adder m_adder_03(.a(m[0]), .b(q[2]), .m_in(m_in[0][3]), .c_in(c_in[0][2]), .m_out(m_in[1][2]), .c_out(c_in[0][3]));
		m_adder m_adder_04(.a(m[0]), .b(q[3]), .m_in(m_in[0][4]), .c_in(c_in[0][3]), .m_out(m_in[1][3]), .c_out(c_in[0][4]));
		
		m_adder m_adder(.a(m[i]), .b(q[j]), .m_in(m_in[i][j+1]), .c_in(c_in[i][j]), .m_out(m_in[i+1][j]), .c_out(c_in[i][j+1]));
		assign m_in[i+1][4] = c_in[i][4];
		assign p[i] = m_in[i+1][0];
	
	end
	endgenerate

	assign p[7:4] = m_in[4][4:1];

endmodule


module m_adder(a, b, m_in, c_in, m_out, c_out);

	input a;
	input b;
	input m_in;
	input c_in;

	output m_out;
	output c_out;
	
	wire c;
	assign c = a & b; 

	assign m_out = c ^ m_in ^ c_in;
	assign c_out = (c & m_in)|(m_in & c_in)|(c_in & c);

endmodule
