# COMPARACIÓN DE TECNOLOGÍA CMOS Y TTL

## Parte 1

### Especificaciones tecnicas de cada tecnologia

Consultando la informacion dada por distintos fabricantes se encontro las siguientes caracteristicas de operacion para cada negador.
 
   |       | Negador TTL 74LS04 | Negador CMOS CD4069 | 
   |-------|--------------------|---------------------|
   | VCC   | MIN=4.5V  NOM=5V  MAX=5.5V | MIN=-0.5V MAX=20V|
   | VIH   | MIN=2V | MIN=4V (VO =0.5V, VDD =5V)            |
   | VIL   | MAX=0.8V| MAX=1V (VO = 4.5 V, VDD = 5V)            |
   | VOL  | TYP=0.25V MAX=0.4V | 0.05V (VIN = 0 V, VDD = 5 V)|
   | VOH   | MIN=2.7V TYP=3.4V | 5V (VIN = 0 V, VDD = 5 V)|
   | IIH   | MAX=20uA |  ------           |
   | IIL   | MAX=-0.4mA |      -----      |
   | IOH   | MAX=-0.4mA | 0.5mA  (VO = 4.6 V, VIN = 0 V,VDD = 5)|
   | IOL   | MAX=4mA |  0.5mA (VO = 0.4 V, VIN = 5 V,VDD = 5 V)|
   | tPLH  | TYP=4.5ns | TYP=55ns MAX=110ns  VDD=5V    |
   | tPHL  | TYP=5ns |  TYP=55ns MAX=110ns  VDD=5V            |

  * Con respecto a la alimentación de cada integrado se puede observar que el negador CMOS CD4069 puede ser alimentado con un rango más amplio de tensiones que varían desde los -0.5 V hasta los 20 V, El negador TTL solo permite variaciones de 0.5 V con respecto a su valor nominal de 5 V, lo que puede ser condicionante a la hora de escoger alguna de estas tecnologías para una aplicación determinada.
     
   * En cuanto al tPHL que es el tiempo de retardo de propagación, la tecnología TTL ofrece un tiempo de retardo alrededor de 10 veces menor al que ofrece la tecnología CMOS teniendo en cuenta los valores nominales que da el fabricante (4.5 ns(TTL) vs. 55 ns(CMOS)), lo que indica que la tecnología TTL puede ser usada para aplicaciones que necesiten de altas velocidades con respecto a los cambios de estado de una entrada digital.

   * En cuanto a la potencia disipada por compuerta, La tecnología TTL específicamente con característica LS ofrece un bajo consumo energético con un valor alrededor de los 7 mW; sin embargo, la tecnología CMOS está cerca de este rango con un consumo energético de alrededor de (10 mW).

   *  En cuanto a la susceptibilidad a descargas electrostáticas, la tecnología CMOS son muy susceptibles al daño por este tipo de descargas entre sus pines, por esta razón sus aplicaciones se limitan con respecto a la tecnología TTL.

### Circuito Equivalente para cada negador

1. Negador TTL 74LS04 <br />
![CircLS04](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/eb4a3db3-fba5-42f1-9917-d16cb1b0e1ae)
2. Negador CMOS CD4069 <br />
![Circ4069](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/8ece8593-0b39-4f53-866c-982a0fce9f96)

### Resultados de la simulación
![image](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/26443961/c238705f-a747-4272-a427-2bbe9d213bce)


### Resultados obtenidos al aplicar una señal cuadrada de 1KHz a cada negador
Para cada negador se realizo un montaje en donde se alimento cada CI con 5v y se conecto una resistencia de --- Ohms a la entrada y una resistencia de --- Ohms a la salida, los resultados obtenidos al observar la señal en el osciloscopio son: <br />

1. Negador TTL 74LS04 <br />
* Señal cuadrada aplicada al negador TTL 74LS04
![SeñalAplicadaTTL](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/51ab7fee-34f5-4a9c-8a5a-0cd806725db7)

 |       | Negador TTL 74LS04 |
 |-------|--------------------|
 | VIH   | xxxx |
 | VIL   | xxxx |
 | VOH   | xxxx |
 | VOL   | xxxx |


* Tiempo de retado negador TTL 74LS04<br />
![Daleay1TTL](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/536b6b40-2f17-4c6a-a947-0844b3f43ffb)

![Delay2TTL](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/3fdd12fa-6183-43d5-ac6e-684d3ad36589)

Deacuerdo con los resultados obtenidos se pudo determinar que el tiempo de retardo entre estados del negador TTL 74LS04 ronda el valor de los 20-25 [ns]

* Vin vs Vout negador TTL 74LS04 <br />
![VinVoutTTL](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/29c8ba35-7b60-4ffc-914f-ea8e8ad3e2d1)


2. Negador CMOS CD4069
* Señal cuadrada aplicada al negador CMOS CD4069<br />
![SeñalAplicadaTTL](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/6cea19a7-4aa3-440d-8e02-f603fce455f7)

 |       | Negador CMOS CD4069 |
 |-------|--------------------|
 | VIH   | xxxx |
 | VIL   | xxxx |
 | VOH   | xxxx |
 | VOL   | xxxx |

* Tiempo de retado negador CMOS CD4069<br />
![DelayCMOS](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/ae6023d1-a147-4932-9552-1ff8e6854182)
* Vin vs Vout negador CMOS CD4069 <br />
![VinvVoutCMOS](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/780d3a0a-04b7-42bb-b1f4-307ea55c38f5)

Deacuerdo con los resultados obtenidos se pudo determinar que el tiempo de retardo entre estados del negador CMOS CD4069 ronda el valor de los 130-140 [ns]

## Parte 2
### Determinación del FanIn y FanOut
### Determinación de disipación de potencia
### CIrcuito propuesto para cada negador
