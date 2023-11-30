`timescale 10ns/10ns
module testbech;

	reg [3:0] a, b;      
	reg cin = 0;
    reg oper;
  
  // CLOCK STIMULUS
  // Make a regular pulsing clock.
  reg reloj_entrada = 0;
  always #1 reloj_entrada = !reloj_entrada;

  initial
  begin
	#1 a = 2; b = 2; oper=0; 
    #100 $finish(); // [stop(), $finish()]
  end

  /* // RESULT FOR DEVICE/DESIGN UNDER TEST */
  
    wire [6:0] seven_salida;
    wire u;
	wire d;
 
  // DEVICE/DESIGN UNDER TEST
  top dut (
  a,
  b,
  oper,
  reloj_entrada,
  seven_salida,
  u,
  d
  );

  // MONITOR
  /*initial
    $monitor("Time: %t, out = %d",
      $time, seven_salida);
*/
  // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbech);
  end


endmodule
