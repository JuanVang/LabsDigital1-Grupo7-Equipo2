module fa4bits (
	// Inputs and output ports;  9 in, 5 out
  input in_b0,in_a0,in_b1,in_a1,in_b2,in_a2,in_b3,in_a3,in_cin,
  output out_s0,out_s1,out_s2,out_s3,out_cout
);
	
//Signal Declaration
wire c0,c1,c2;
//~ wire w0,w1,w2,w3;

//~ xor x0(w0,in_b0,in_cin);
//~ xor x1(w1,in_b1,in_cin);
//~ xor x2(w2,in_b2,in_cin);
//~ xor x3(w3,in_b3,in_cin);

//submodule	
fulladder FA0(in_b0,in_a0,in_cin,c0,out_s0);
fulladder FA1(in_b1,in_a1,c0,c1,out_s1);
fulladder FA2(in_b2,in_a2,c1,c2,out_s2);
fulladder FA3(in_b3,in_a3,c2,out_cout,out_s3);

//define si el resultado esta expresado en su forma de segundo complemento, es decir si la salida es negativa.
//~ assign out_is2complmt = ~ out_cout & in_cin ;
	
endmodule
