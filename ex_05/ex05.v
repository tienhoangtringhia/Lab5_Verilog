module ex05 (m, q, p);

	input [3:0] a;
	input [3:0] b;

	output [7:0] p;

	wire [4:0]c_in[0:4];
	wire [4:0]m_in[0:4];

	assign m_in[0][4:0] = 5'b00000;

	genvar i;
	genvar j;

	generate
	for(i=0;i<4;i=i+1) 
	begin
		assign c_in[i][0] = 1'b0;
		for(j = 0; j < 4; j = j + 1)
		begin
			m_adder m_adder(.a(a[i]), .b(b[j]), .m_in(m_in[i][j+1]), .c_in(c_in[i][j]), .m_out(m_in[i+1][j]), .c_out(c_in[i][j+1]));
		end
	
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
