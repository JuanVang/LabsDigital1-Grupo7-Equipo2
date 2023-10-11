# SIMULACIÓN DE CIRCUITOS DIGITALES CON HERRAMIENTAS OPENSOURCE

## Simulación de un Cricuito digital

Para la introducción al software de Digital y la revisión de diferentes parámetros y herramientas, se hizo la simulación de un circuiro digital sencillo: Un sumador completo. Los archivos .dig usados se puede encontrar en el repositorio, en la siguiente dirección --> https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/tree/63ecec3d6fa516d0806d575edf388bfd2cb375a9/Lab2/digitalFiles.

Con la simulación realizada, en la sección de análisis se puede encontrar la tabla de verdad realizada por el programa y sus respectivas expresiones algebraicas.
### Tabla de verdad:
![tablaVerdad](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/9d09f721-ffb3-4f13-8f99-76579d3659a2)

### Expresión Algebraica asociada al circuito:
![ecuacionesAlgebraicas](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/8d47ad6e-23c8-4bbf-9d39-596880034a21)

### Mapas de Karnaugh:
#### Mapa para S:
![mapa2](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/7d1483ea-cc1e-4783-8d1c-19e358c9d2e3)
#### Mapa para Co:
![mapa](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/94426992-19de-4d56-9212-85984d0baf41)

### Simulación:
En la siguiente imagen se puede encontrar la simulación para el caso dónde el Carry in tiene un valor de 1, la entrada a un valor de 0 y la entrada b un valor de 1. Se puede ver como los cables por dónde pasa un 1 lógico están en un tono verde fluorescente. La salida tiene como resultado 0 en la Suma y el Carry out un valor de 1.
![simulacion](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/0c058918-bddf-4571-a60d-aa77e79378af)


### Casos de prueba:
Para los datos de prueba es necesario editar un texto dónde se tengan los valores de entrada y los valores esperados en la salida. Al realizar la Simulación se arroja una tabla dónde las casillas marcan si el circuito cumple con lo esperado en cada caso.
#### Archivo de Texto con los datos de la prueba:
![txtprueba](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/1da0c63d-f196-49cd-8747-1ba031104b9d)
#### Resultados de la prueba Realizada:
![resultPrueba](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/d59d62ad-6ce1-4a67-a71b-17fee52045ea)

## Simulación del Circuito Digital con iVerilog y Gtkwave
Para la realización de un Sumador Restador de 4 bits en iverilog es necesario haber definido el sumador completo y el medio sumador, estos fueron editados con la herramienta geany, a continuación sus respectivos códigos:

### Descripción del código en verilog:

#### Código para el medio sumador:
![halfAdderVerilog](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/384749a6-9844-44ff-b492-c12d3a300b18)
#### Código para el sumador completo:
![fullAdderVerilog](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/83d7fee5-fbe0-413c-80f8-fd79486606d8)
#### Código para el Sumador Restador de 4 bits:
![fa4bitsVerilog](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/6453d95b-01fd-4739-8ea5-90a1e0f45952)

En este punto, el Sumador Restador, está casi completo, sin embargo, al restar un número más grande(de modo que el número sea negativo) el resultado es el complemento del número. Para solucionar esto se añadió otro Sumador Restador que arrojara como resultado el resultado de la resta y un indicador para su signo. A este archivo se le ha nombrado fa4bit_top.

#### Código para el Sumador Restador de 4 bits top:
![fa4bitstopverilog](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/b8c3f4a7-84e3-4bda-8250-5c85adcb9d52)

### Creación de los testbench:
A continuación los códigos desplegables para el Sumador Restador, tanto el que muestra el complemento cómo el que muestra el número y su signo. Al ser tan largos, se optó por dejar el código completo y no una imagen del mismo. 
Para el mejor entendimiento de los testbench, cabe resaltar que la cifra más significativa en cada número es la que lleva el número 3, y cuándo el signo es negativo, el indicador signo es un 1.
<details>
<summary>Ver código del testbench para el fa4bits</summary>
	
```
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
```
</details>

<details>
<summary>Ver código del testbench para el fa4bits_top</summary>
	
```
module fa4bit_top_tb;
//registros de entradas
	reg a0,a1,a2,a3;
	reg b0,b1,b2,b3;
	reg in_cin,cero;
//registros de salidas
	wire s0,s1,s2,s3;
	wire out_cout,signo;
//llamado submodulo fa4bits
	fa4bit_top fa4bits_top1(b0,a0,b1,a1,b2,a2,b3,a3,in_cin,cero,s0,s1,s2,s3,out_cout,signo);
//casos de prueba, imprime el tiempo y los valores por bit de a, b , s, el carryin(0 suma,1 resta), el carry out y 2complement indica si la salida es negativa(esta en su forma de segundo complemento) o no(0-> no 1-> si).

	initial
	begin
	$monitor($time ,"  El resultado de la suma 10 + 1 -> %b %b %b %b + %b %b %b %b = %b %b %b %b Signo?(0->+,1->-)=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,signo,in_cin,out_cout);
	cero=1'b0;
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
	
	$monitor($time ,"  El resultado de la suma 8 + 3 -> %b %b %b %b + %b %b %b %b = %b %b %b %b Signo?(0->+,1->-)=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,signo,in_cin,out_cout);
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
	
	$monitor($time ,"  El resultado de la resta 12 - 7 -> %b %b %b %b - %b %b %b %b = %b %b %b %b Signo?(0->+,1->-)=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,signo,in_cin,out_cout);
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
	
	$monitor($time ,"  El resultado de la resta 10 - 12 -> %b %b %b %b - %b %b %b %b = %b %b %b %b Signo?(0->+,1->-)=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,signo,in_cin,out_cout);
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
	
	$monitor($time ,"  El resultado de la resta 2 - 10 -> %b %b %b %b - %b %b %b %b = %b %b %b %b Signo?(0->+,1->-)=%b, cin=%b, cout=%b, ",a3,a2,a1,a2,b3,b2,b1,b0,s3,s2,s1,s0,signo,in_cin,out_cout);
	a0=1'b0;
	a1=1'b1;
	a2=1'b0;
	a3=1'b0;
	b0=1'b0;
	b1=1'b1;
	b2=1'b0;
	b3=1'b1;
	in_cin=1'b1;
	#10;
	end
	initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, fa4bit_top_tb);
  end
endmodule
```
</details>

### Realizar la Simulación:
Se realizo un Makefile encargado de la simulación del Sumador Restador de 4 bits haciendo uso del testbench fa4bit_top, así que el resultado será un número con su signo.

<details>
<summary>Ver código del makefile para la simulación</summary>
	
```
help: help-sim
clean: clean-sim
# CONDA=~/miniconda3/bin/conda
TOP?=fa4bit_top
#test bench del proyecto para la simulación
tb?=$(TOP)_tb.v
# DESIGN modules.v que hacen parte del proyecto
DESIGN?= ./fa4bit_top.v ./fa4bits.v ./halfadder.v ./fulladder.v
# Z: Nombre para empaquetar proyecto
Z=fa4bits


S=sim

help-sim:
	@echo "\n## SIMULACIÓN Y RTL##"
	@echo "\tmake rtl \t-> Crear el RTL desde el TOP"
	@echo "\tmake sim \t-> Simular diseño"
	@echo "\tmake wave \t-> Ver simulación en gtkwave"
	@echo "\nEjemplos de simulaciones con más argumentos:"
	@echo "\tmake sim VVP_ARG=+inputs=5\t\t:Agregar un argumento a la simulación"
	@echo "\tmake sim VVP_ARG=+a=5\ +b=6\t\t:Agregar varios argumentos a la simulación"
	@echo "\tmake sim VVP_ARG+=+a=5 VVP_ARG+=+b=6\t:Agregar varios argumentos a la simulación"
	@echo "\tmake rtl TOP=modulo1\t\t\t:Obtiene el RTL de otros modulos (submodulos)"
	@echo "\tmake rtl rtl2png\t\t\t:Convertir el RTL del TOP desde formato svg a png"
	@echo "\tmake rtl rtl2png TOP=modulo1\t\t:Además de convertir, obtiene el RTL de otros modulos (submodulos)"

rtl: rtl-from-json view-svg

sim: clean-sim iverilog-compile vpp-simulate wave

# MORE_SRC2SIM permite agregar más archivos fuentes para la simulación
MORE_SRC2SIM?=
iverilog-compile:
	mkdir -p $S
ifneq ($(MORE_SRC2SIM), )
	cp -var $(MORE_SRC2SIM) $S
endif
	iverilog -o $S/$(TOP).vvp $(tb) $(DESIGN)

# VVP_ARG permite agregar argumentos en la simulación con vvp
VVP_ARG=
vpp-simulate:
	cd $S && vvp $(TOP).vvp -vcd $(VVP_ARG)

wave:
	@gtkwave $S/top.vcd	top.gtkw || (echo "No hay un forma de onda que motrar en gtkwave, posiblemente no fue solicitada en la simulación")

json-yosys:
	mkdir -p $S
	yosys -p 'read_verilog $(DESIGN); prep -top $(TOP); hierarchy -check; proc; write_json $S/$(TOP).json'

rtl-from-json: json-yosys
	netlistsvg $S/$(TOP).json -o $S/$(TOP).svg

view-svg:
	eog $S/$(TOP).svg

rtl-xdot:
	yosys -p $(RTL_COMMAND)

rtl2png:
	convert -density 200 -resize 1200 $S/$(TOP).svg $(TOP).png
	# convert -resize 1200 -quality 100 $S/$(TOP).svg $(TOP).png

init-sim:	
	@echo "sim/\n$Z/\n" > .gitignore
	touch README.md top.png

RM=rm -rf
# EMPAQUETAR SIMULACIÓN EN .ZIP
Z?=prj
zip-sim:
	$(RM) $Z $Z.zip
	mkdir -p $Z
	# Quitar las últimas dos líneas del Makefile y crear copia en el directorio $Z
	head -n -2 Makefile > $Z/Makefile
	# Agregar desde la línea 7 en adelante en el Makefile
	sed -n '7,$$p' $(MK_SIM) >> $Z/Makefile
	cp -var *.v *.md .gitignore $Z
ifneq ($(wildcard *.mem),) # Si existe un archivo .png
	cp -var *.mem $Z
endif
ifneq ($(wildcard *.hex),) # Si existe un archivo .png
	cp -var *.hex $Z
endif
ifneq ($(wildcard *.png),) # Si existe un archivo .png
	cp -var *.png $Z
endif
ifneq ($(wildcard *.txt),) # Si existe un archivo .txt
	cp -var *.txt $Z
endif
	zip -r $Z.zip $Z

clean-sim:
	rm -rf $S $Z $Z.zip

## YOSYS ARGUMENTS
RTL_COMMAND?='read_verilog $(DESIGN);\
						 hierarchy -check;\
						 show $(TOP)'
```
</details>

### Resultados gráficos con la herramienta GTK wave:
![SimulaciónGTK](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/79612708/3651b61e-bcf1-4425-9472-bb9701116116)

