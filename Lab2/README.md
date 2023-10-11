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





