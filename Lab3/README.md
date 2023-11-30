![BinarytoBCD](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/847894a8-4185-494c-bb9c-cb263181fc07)# SUMADOR/RESTADOR DE 4 BITS CON VISUALIZACION EN DISPLAY

Para esta practica se implemento el sumador/restador de 4 bits desarrollado en la practica anterior, con el fin de visualizar la operacion correspondiente en dos displays siete segmentos, una para las unidades y otro para las decenas.
Para esto se realizo la descripcion del siguiente circuito en el lenguaje verilog.


![TOPFB](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/602ec029-9b8c-4c10-8347-60347155ed7e)


El circuito consta de varios modulos conectados en cascada: 

1. Sumador/Restador de 4 bits
2. Mux/Demux
3. Codificador Bin to BCD
4. Divisor de Frecuencia (Clock)
5. Decodificador BCD to 7Segments


- Sumador restador 4 Bits:

El sumador/restador binario toma 2 numeros binarios de 4 bits y dependiendo del bit de control realiza la suma o la resta de estos numeros, en el informe anterior se realizo un analisis a detalle por lo que solo se muestra el circuito correspondiente.

![AS4B](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/9b06e846-1cc5-4a0a-abac-e87aa06c57cd)

- Mux/Demux

El multiplexor y el demultiplexor son fundamentales para la visualizacion de las decenas y la unidades en el display siete segmentos, el funcionamiento del multiplexor consiste en seleccionar entre el codigo BCD de Unidades o Decenas, y el demultiplexor es quien se encarga de distribuir la señal de 1 logico que enciende los display siete segmentos para las unidades o las decenas, estos dos dispositivos funcionan a la misma señal de reloj o clock a una frecuencia lo suficientemente alta para que el ojo humano no sea capaz de percibir el encendido o apagado de los displays.
El circuito para el multiplexor y el demultiplexor es:

- Mux 2 a 1

![Mux2a1](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/a9147b80-759f-4638-8a18-b9c81ab7d16e)

- Demux 1 a 2

![demux1a2](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/2d85a9d7-9b8f-44a5-84e2-7cc314dccb82)

- Codificador Bin to BCD

Este modulo toma la salida del Sumador/Restador de 4 bits, separa las unidades de las decenas mediante una division y las codifica en codigo BCD, el circuito de este modulo es:

![BinarytoBCD](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/d3ad8fc6-ce1e-4d6c-af31-ffa15e076cd5)


- Divisor de frecuencia (Clock)

Este modulo toma la frecuencia de entrada de la FPGA y entrega la frecuencia deseada, el cirucito que representa este modulo es:

![CLOCK](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/d0ed30b0-db39-4ca8-aa54-2c15754ffc14)

- Codificador BCD to 7Segments

Este modulo toma el codigo BCD para unidades y Decenas y la codifica para enviar una señal de 7 bits a los displays

![seven_seg_decoder](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/b7b41278-f07e-4b35-92e1-b03d89774822)




  





