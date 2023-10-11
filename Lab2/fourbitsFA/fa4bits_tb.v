module fa4bits_tb;
//registros de entradas
	reg a0,a1,a2,a3;
	reg b0,b1,b2,b3;
	reg in_cin;
//registros de salidas
	wire s0,s1,s2,s3;
	wire out_cout,out_is2complmt;
//llamado submodulo fa4bits
	fa4bits fa4bits1(b0,a0,b1,a1,b2,a2,b3,a3,in_cin,s0,s1,s2,s3,out_cout,out_is2complmt);
//casos de prueba, imprime el tiempo y los valores por bit de a, b , s, el carryin(0 suma,1 resta), el carry out y 2complement indica si la salida es negativa(esta en su forma de segundo complemento) o no(0-> no 1-> si).

	initial
	begin
	$monitor($time ,"  El resultado de la suma 10 + 1 -> %b %b %b %b + %b %b %b %b = %b %b %b %b Negativo?=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,out_is2complmt,in_cin,out_cout);
	
	a0=1'b0;
	a1=1'b1;
	a2=1'b0;
	a3=1'b1;
	b0=1'b1;
	b1=1'b0;
	b2=1'b0;
	b3=1'b0;
	in_cin=1'b0;
	#10;
	
	$monitor($time ,"  El resultado de la suma 8 + 3 -> %b %b %b %b + %b %b %b %b = %b %b %b %b Negativo?=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,out_is2complmt,in_cin,out_cout);
	a0=1'b0;
	a1=1'b0;
	a2=1'b0;
	a3=1'b1;
	b0=1'b1;
	b1=1'b1;
	b2=1'b0;
	b3=1'b0;
	in_cin=1'b0;
	#10;
	
	$monitor($time ,"  El resultado de la resta 12 - 7 -> %b %b %b %b - %b %b %b %b = %b %b %b %b Negativo?=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,out_is2complmt,in_cin,out_cout);
	a0=1'b0;
	a1=1'b0;
	a2=1'b1;
	a3=1'b1;
	b0=1'b1;
	b1=1'b1;
	b2=1'b1;
	b3=1'b0;
	in_cin=1'b1;
	#10;
	
	$monitor($time ,"  El resultado de la resta 10 - 12 -> %b %b %b %b - %b %b %b %b = %b %b %b %b Negativo?=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,out_is2complmt,in_cin,out_cout);
	a0=1'b0;
	a1=1'b1;
	a2=1'b0;
	a3=1'b1;
	b0=1'b0;
	b1=1'b0;
	b2=1'b1;
	b3=1'b1;
	in_cin=1'b1;
	#10;
	
	end
	initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, fa4bits_tb);
  end
endmodule

