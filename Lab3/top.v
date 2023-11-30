module top (
	input [3:0] a, b,      
    // input cin,
    input oper,
    input reloj_entrada,
    output wire [6:0] seven_salida,
    output wire u,
	output wire d

);

reg cin = 0;

sumador4bit dut (
    .b(b),
    .a(a),
    .cin(cin),
    .oper(oper),
    .s(salida),
    .cout4(cout4)
);

wire [3:0] salida;  
wire cout4;
 
 
wire [1:0] select;
assign select = {~oper,cout4};
 
demux demux_1(
    .entrada(salida),
    .select(select),
    .salida(salidamux)
);
wire [4:0] salidamux;


 
BinarytoBCD dut_1(
	.bitIn(salidamux),
	.bcdunits(unidades),
	.bcdtens(decenas)
); 

wire [3:0] unidades,decenas;


clock_divider reloj (
	.clock_in(reloj_entrada),
	.clock_out(reloj_salida)

);

wire reloj_salida;
 

mux2a1 mux_1(
	.clk(reloj_salida),
	.U(unidades),
	.D(decenas),
	.bcd(bcdsalida)
);

wire [3:0] bcdsalida;  




seven_seg_decoder seven_segm(
		.bcd(bcdsalida),
		.clk(reloj_entrada),
		.seven_seg(seven_salida)
);



reg a_1 = 1'b1;

demux1a2 demux_2(
	.clk(reloj_salida),
	.D(d),
	.U(u)
);

endmodule

module sumador4bit(
input [3:0] a,
input [3:0] b,
input cin,
input oper,
output [3:0] s,
output cout4
);


wire cout1,cout2,cout3;
sumador1bit sum0 (a[0], b[0], cin,   oper, s[0], cout1);
sumador1bit sum1 (a[1], b[1], cout1, oper, s[1], cout2);
sumador1bit sum2 (a[2], b[2], cout2, oper, s[2], cout3);
sumador1bit sum3 (a[3], b[3], cout3, oper, s[3], cout4);

endmodule

module sumador1bit(
input a,
input b,
input cin,
input oper,
output s,
output cout);

assign s = a ^ b ^ cin;
//assign cout = a & b | a & cin | b & cin;
assign cout = b & cin | ((~oper ^ a) & (cin | b));

endmodule

module seven_seg_decoder(clk,bcd,seven_seg);

input [3:0] bcd;
input clk;
output reg [6:0] seven_seg = 7'b1111111;

always @(posedge clk )  //Negado para sincronizar y se actualiza cuando clk cambia de estado
	begin
		case (bcd)
			//4'b0000:begin seven_seg= ~7'b; end
            4'b0000 : begin seven_seg = ~7'b0111111; end //0   0111111
			4'b0001 : begin seven_seg = ~7'b0000110; end //1   0000110
			4'b0010 : begin seven_seg = ~7'b1011011; end //2   1011011
			4'b0011 : begin seven_seg = ~7'b1001111; end //3   1001111
			4'b0100 : begin seven_seg = ~7'b1100110; end //4   1100110
			4'b0101 : begin seven_seg = ~7'b1101101; end //5   1101101
			4'b0110 : begin seven_seg = ~7'b1111101; end //6   1111101
			4'b0111 : begin seven_seg = ~7'b0000111; end //7   0000111
			4'b1000 : begin seven_seg = ~7'b1111111; end //8   1111111
			4'b1001 : begin seven_seg = ~7'b1100111; end //9   1100111
   default : begin seven_seg = ~7'b0000000; end //    0000000
        endcase
  end
endmodule

module mux2a1(
	input clk,
	input[3:0] U,D,
	output[3:0] bcd
);

assign bcd = clk ? U : D;

//si clk es 1, se ven reflejados los valores de D 
//si clk es 0, se ven reflejados los valores de U
endmodule 

module demux1a2(
input a,
input clk,
output D, U
);

assign D = clk ? 1'b0 : 1'b1;
assign U =  clk ? 1'b1 : 1'b0;

endmodule 

module demux(input [3:0] entrada,
                  input [1:0] select,
                  output [4:0] salida);

  reg [4:0] output_0;
  reg [4:0] output_1;
  reg [4:0] output_2;
  reg [4:0] output_3;
                  

  always @(entrada or select) begin
    case (select)
      2'b00: begin
        output_0[4:0] = {1'b0,entrada};
        output_1[4:0] = 5'b0;
        output_2[4:0] = 5'b0;
        output_3[4:0] = 5'b0;
      end
      2'b01: begin
        output_0[4:0] = 5'b0;
        output_1[4:0] = {1'b1,entrada};
        output_2[4:0] = 5'b0;
        output_3[4:0] = 5'b0;
      end
      2'b10: begin
        output_0[4:0] = 5'b0;
        output_1[4:0] = 5'b0;
        output_2[4:0] = {1'b0,entrada};
        output_3[4:0] = 5'b0;
      end
      2'b11: begin
        output_0[4:0] = 5'b0;
        output_1[4:0] = 5'b0;
        output_2[4:0] = 5'b0;
        output_3[3:0] = ~entrada + 1;
      end
    endcase
  end
assign salida = output_0 | output_1 | output_2 | output_3;	
endmodule

module clock_divider(clock_in,clock_out
    );

input clock_in; // input clock on FPGA
output reg clock_out = 0; // output clock after dividing the input clock by divisor


parameter SIZE = 26; 
parameter LIMIT = 26'd166666;
reg [SIZE-1:0] count = 0;
always@(posedge clock_in)
begin
  if(count == LIMIT)
  begin
    count <= 0;
    clock_out <= ~clock_out;
  end
  else
  begin
    count <= count + 1;
  end
end

endmodule
/*
module BinarytoBCD (
  input [4:0] bitIn, //5 bits 0-31
  output reg[3:0] bcdunits,
  output reg[3:0] bcdtens
);
parameter CERO = 5'd0;
parameter DIEZ = 5'd10;
parameter VEINTE = 5'd20;
parameter TREINTA = 5'd30;

if(bitIn >= CERO && bitIn < DIEZ)
	begin 
	assign bcdtens = 4'd0;
	assign bcdunits = (bitIn);
	end
	else if(bitIn >= 5'd10 && bitIn <= 5'd19)
	begin 
	assign bcdtens = 1;
	assign bcdunits = (bitIn-4'd10);
	end
	else if(bitIn >= 5'd20 && bitIn <= 5'd29)
	begin 
	assign bcdtens = 2;
	assign bcdunits = (bitIn-5'd20);
	end
	else if(bitIn >= 5'd30)
	begin 
	assign bcdtens = 3;
	assign bcdunits = bitIn-5'd30;
	end
	*/
module BinarytoBCD (
  input [4:0] bitIn, // 5 bits 0-31
  output reg[3:0] bcdunits,
  output reg[3:0] bcdtens
);

always @(*)
begin
    case(bitIn)
        5'd0: begin
            bcdtens <= 4'd0;
            bcdunits <= 4'd0;
        end
        5'd1, 5'd2, 5'd3, 5'd4, 5'd5, 5'd6, 5'd7, 5'd8, 5'd9: begin
            bcdtens <= 4'd0;
            bcdunits <= bitIn;
        end
        5'd10, 5'd11, 5'd12, 5'd13, 5'd14, 5'd15, 5'd16, 5'd17, 5'd18, 5'd19: begin
            bcdtens <= 4'd1;
            bcdunits <= bitIn - 4'd10;
        end
        5'd20, 5'd21, 5'd22, 5'd23, 5'd24, 5'd25, 5'd26, 5'd27, 5'd28, 5'd29: begin
            bcdtens <= 4'd2;
            bcdunits <= bitIn - 5'd20;
        end
        default: begin
            bcdtens <= 4'd3;
            bcdunits <= bitIn - 5'd30;
        end
    endcase
end

endmodule



