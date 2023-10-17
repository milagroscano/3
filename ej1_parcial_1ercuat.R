
# Ejercicio 1 - parcial 1er cuatrimestre 2023

# Diseniar un programa que solicite el ingreso por consola de la siguiente informacion:
#   - Dia de medicion en formato DD-MM-AA
#   - Cantidad de estaciones meteorologicas que va a informar

rm(list = ls())
setwd("/home/clinux01/LaboAtm2023/ClasesPrac/Practica_3/")

# Para cada estacion meteorologica:
#   - Nombre de la estacion
#   - Presion a nivel del mar (PNM) en hPa medida

# En el caso de que la PNM supere los 1013.5 hPa debera calcular el valor excedente (diferencias con 1013.5 hPa)
# e imprimir por pantalla el siguiente cartel:

#   "La estacion meteorologica [nombre de la estacion] el dia [DD] de [MM] del [AA] se encuentra bajo condiciones de ALTA PRESION y estuvo
# por encima del valor de 1013.5 hPa en [X] hPa"

# En caso de que la PNM sea igual a 1013.5 hPa  debera imprimir por pantalla el siguiente cartel

#   "La estacion meteorologica [nombre de la estacion] el dia [DD] de [MM] del [AA] se encuentra bajo condiciones de NORMALES DE PRESION"

# Si por el contrario, la PNM ingresada esta por debajo de los 1013.5 hPa debera calcular el valor de deficit e imprimir por pantalla el siguiente cartel:

#   "La estacion meteorologica [nombre de la estacion] el dia [DD] de [MM] del [AA] se encuentra bajo condiciones de BAJA PRESION y estuvo
# por debajo del valor de 1013.5 hPa en [X] hPa"

# Los datos ingresados deben ser numericos y en el caso contrario, se debe pedir el reingreso de un dato valido por pantalla.














