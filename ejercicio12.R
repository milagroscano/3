
# Ejercicio 12 - PREGUNTAR por los intervalos entre las temperaturas del archivo

# El archivo presiondesaturacion.txt contiene dos columnas, una con datos de temperatura (◦C) y la segunda 
# con valores de presion de saturacion para el vapor de agua (hPa) correspondientes a dichas temperaturas. 

# Armar una funcion de R que dada una temperatura obtenga el valor de presion de saturacion interpolado 
# linealmente al valor de temperatura deseado a partir de los datos presentes en el archivo. 
 
# Hacer que la funcion muestre un mensaje de advertencia y termine correctamente en el caso de que el valor de  
# temperatura indicado este fuera del rango abarcado por la tabla.  
# Comparar los resultados utilizando la funcion intrınseca interp1 de R.

rm(list = ls())
setwd("C:/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/")
archivo = read.table("presiondesaturacion.txt")

# le pongo nombre a las columnas del archivo
names(archivo) = c("Temperatura", "Presion_de_Sat")

# interpreto que me pide una funcion que al ingresarle una temperatura me dé como resultado
# la presion de saturacion correspondiente a esa temperatura, es decir, que esten en la misma fila

# defino un vector para las temperaturas del archivo
temperaturas = archivo$Temperatura
presiones = archivo$Presion_de_Sat

funcion = function(temperatura) {      # COMO HAGO PARA DETERMINAR LOS INTERVALOS DE TEMP ?? *
  if(!is.numeric(temperatura)) stop("temperatura no es numérico")
  if (temperatura < temperaturas[1] | temperatura > temperaturas[length(temperaturas)]) {
    print("El valor de temperatura ingresado no esta dentro del rango de datos del archivo")
  }
  for (i in temperaturas) {
    if (i == temperatura) {
      presion_sat = presiones[which(temperaturas==i)]
    } 
  }
  return(presion_sat)
}
# *  COMO HAGO PARA INDICARLE A LA FUNCION DE QUE CADA VEZ QUE SE INGRESE UN NRO, SE LE DEBE AGREGAR
# 0.5 O 0.6 PARA QUE SEA UN NRO QUE ESTÉ EN EL ARCHIVO ??

# la funcion funciona correctamente siempre y cuando se le ingrese un dato de temperatura que esté
# en el archivo, si la temperatura no es correcta tira error pues presion_sat not found
funcion(0.6)

