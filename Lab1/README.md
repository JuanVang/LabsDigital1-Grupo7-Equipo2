# COMPARACIÓN DE TECNOLOGÍA CMOS Y TTL

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
     
   * Otro aspecto importante es el tPHL que es el tiempo de retardo de propagación, la tecnología TTL ofrece un tiempo de retardo alrededor de 10 veces menor al que ofrece la tecnología CMOS teniendo en cuenta los valores nominales que da el fabricante (4.5 ns(TTL) vs. 55 ns(CMOS)), lo que indica que la tecnología TTL puede ser usada para aplicaciones que necesiten de altas velocidades con respecto a los cambios de estado de una entrada digital.

   * La potencia disipada por compuerta es otro aspecto importante, La tecnología TTL específicamente con característica LS ofrece un bajo consumo energético con un valor alrededor de los 7 mW; sin embargo, la tecnología CMOS está cerca de este rango con un consumo energético de alrededor de (10 mW).

   *  La susceptibilidad a descargas electrostáticas es otro aspecto importante a tener en cuenta, la tecnología CMOS son muy susceptibles al daño por este tipo de descargas entre sus pines, por esta razón sus aplicaciones se limitan con respecto a la tecnología TTL.

### Circuito Equivalente para cada negador

1. Negador TTL 74LS04 <br />
![CircLS04](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/eb4a3db3-fba5-42f1-9917-d16cb1b0e1ae)
2. Negador CMOS CD4069 <br />
![Circ4069](https://github.com/JuanVang/LabsDigital1-Grupo7-Equipo2/assets/73542998/8ece8593-0b39-4f53-866c-982a0fce9f96)
