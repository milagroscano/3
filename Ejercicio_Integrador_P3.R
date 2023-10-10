# Ejercicio integrador P3

# Se cuenta con datos estimaciones de precipitación provistas por el producto
# PERSIANN PDIR (https://chrsdata.eng.uci.edu/) variable llamada datos_PP en unidades de mm . 
# Se tienen datos horarios del 01/01/2020 00 UTC al 31/12/2020 23 UTC en la región
# comprendida de longitud 66°O a 61°O y latitud de 30°S a 35°S (Figura 1), cuentan con una
# distancia entre puntos de retícula de 0.04°. Los datos erróneos están códificados con -99.

# El objetivo del ejercicio es armar un dataframe donde se conozcan algunas estadísticas de
# diferentes regiones de Córdoba para el año 2020 con este producto.

rm(list=ls())

#setwd("")
load("/home/clinux01/Descargas/datos.Rdata")

# 1. Dado el script Ejercicio_integrador_P3.R ejecute y explore los datos brindados.
# Observe los histogramas, calcule el máximo del dataset entero, cuanto es el
# porcentaje de algunos valores por encima de un umbral (1, 5, 10, 25, 100, 250 mm). ¿A
# qué conclusiones llega de la variable en primera instancia?

#Miremos que dimensiones tiene el array
dimensiones<-dim(datos_PP)

#Veamos cual es el valor maximo
max(datos_PP)

#Ploteamos un histograma para ver como es la variable
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

# se observa que los datos de pp toma valores negativos, correspondientes a datos faltantes = -99
# hay que remover esos datos faltantes para poder calcular luego lo pedido
datos_PP[datos_PP==-99] <- NA
max(datos_PP,na.rm=T)
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

#Cuantos valores tengo arriba de un determinado umbral
length(which(datos_PP >= 1))/(prod(dim(datos_PP))) #1 mm
length(which(datos_PP >= 5))/(prod(dim(datos_PP))) #5 mm
length(which(datos_PP >= 10))/(prod(dim(datos_PP))) #10 mm
length(which(datos_PP >= 25))/(prod(dim(datos_PP))) #25 mm
length(which(datos_PP >= 100))/(prod(dim(datos_PP))) #100 mm
length(which(datos_PP >= 250))/(prod(dim(datos_PP))) #250 mm

# 2. Defina una función que dado un array, calcule su media, desvío estándar y su
# máximo, y devuelva la salida en una lista.

funcion <- function(array) {
  media <- mean(array, na.rm = T)
  desvio_estand <- sd(array, na.rm = T)
  maximo <- max(array, na.rm = T)
 return (list("Media"=media, "Desvio"=desvio_estand, "Maximo"=maximo))
}

resultado <- funcion(datos_PP)

# 3. Recorra los datos en regiones de 5x5 sin solaparse, y calcule para todos los tiempos,
# con la función generada en el punto anterior, en cada región la media, el desvío
# estándar, y el máximo. Pasos a seguir que los guiarán:

# a. Calcule cuántas regiones de 5x5 se tiene por filas y columnas
dim5x5_fila <- dimensiones[1]/5
dim5x5_columna <- dimensiones[2]/5
dim5x5 <- dim5x5_fila*dim5x5_columna
dim5x5

# b. Utilice dos ciclos anidados para recorrer las filas y columnas teniendo en
# cuenta una indexación adecuada.
# c. Guarde los valores calculados, en un vector o matriz

# i fila
# j columna

media <- matrix(NA, ncol=25, nrow=25)
desvios <- matrix(NA, ncol=25, nrow=25)
maximo <- matrix(NA, ncol=25, nrow=25)

for (i in seq(1, dimensiones[1], 5)) {
  for (j in seq(1, dimensiones[2], 5)) {
    reg_5x5 <- datos_PP[i:(i+4),  j:(j+4),] # corregir
    resultado2 <- funcion(reg_5x5)
    media[i,j] <- resultado2$media
    desvios[i,j] <- resultado2$desvios
    maximo[i,j] <- resultado2$maximo
  }
}

dim(reg_5x5)
class(reg_5x5)


resultado2


