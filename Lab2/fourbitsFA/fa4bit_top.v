module fa4bit_top (
	// Inputs and output ports;  9 in, 5 out
  input in_b0,in_a0,in_b1,in_a1,in_b2,in_a2,in_b3,in_a3,CTR,cero,
  output out_s0,out_s1,out_s2,out_s3,out_cout,sign
);
wire w0,w1,w2,w3;
wire w4,w5,w6,w7;
wire cout;
wire cout_to_sign;
wire outs0,outs1,outs2,outs3;
xor x0(w0,in_b0,CTR);
xor x1(w1,in_b1,CTR);
xor x2(w2,in_b2,CTR);
xor x3(w3,in_b3,CTR);
xor x4(w4,outs0,sign);
xor x5(w5,outs1,sign);
xor x6(w6,outs2,sign);
xor x7(w7,outs3,sign);
fa4bits FA40(w0,in_a0,w1,in_a1,w2,in_a2,w3,in_a3,CTR,outs0,outs1,outs2,outs3,cout);
fa4bits FA41(w4,cero,w5,cero,w6,cero,w7,cero,sign,out_s0,out_s1,out_s2,out_s3,out_cout);

assign sign = ~ cout & CTR;

endmodule
