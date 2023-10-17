
# Ejercicio 9 - PREGUNTAR por el cartel con el vector, debe respuesta (se iba a fijar), pregunta item a)

# El archivo tmediaEF.RData contiene un array de tipo lista con la temperatura media del mes de Enero y 
# Febrero desde 1982 a 2012 para 5 estaciones argentinas (usar la sentencia load(“tmediaEF.RData???) para abrirlo). 

# La primera columna del array contiene el nombre de cada estacion, la segunda contiene la serie para el mes 
# de enero y la tercera para el mes de febrero. Cada fila del array esta asociada a una estacion: 

rm(list = ls())
setwd("C:/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/")
load("t_media_EF.RData")

# le agrego nombres a las columnas y filas del array
colnames(estaciones) = c("estacion", "enero", "febrero")
row.names(estaciones) = c(estaciones[,1])

# a) Para cada estacion: Obtener la anomalıa mensual maxima de enero y el anio en que se alcanzo. 
# Almacenarlo en un dataframe donde la primer variable sea el nombre de cada estacion, la segunda el anio 
# de la anomalıa y la tercera dicho valor. 

#  PREGUNTAR, COMO SE CALCULA LA ANOMALIA ??? Respuesta : anomalia = dato - media
estaciones
# me quedo con los datos de enero
enero = estaciones[,2]
# defino un vector para cada estacion con los datos de enero
enero_BsAs = enero[[1]]
enero_vied = enero[[2]]
enero_ros = enero[[3]]
enero_sl = enero[[4]]
enero_res = enero[[5]]
# defino un vector para los años
anios = c(1982:2012)
# defino una funcion para calcular la anomalia para el mes de enero para cada estacion y en el anio que sucedio
calculo_anomyanio = function(vector) {
  anom_vector = c()
  for (i in vector) {
    anomalia = i - mean(vector)
    anom_vector = c(anom_vector, anomalia)
    }
  anom_vector_max = max(anom_vector)
  pos_anom_vector_max = which(anom_vector==anom_vector_max)
  anio_anom_vector = anios[pos_anom_vector_max]
  return(list(anom_vector_max, anio_anom_vector))
}

# defino un vector con los resultados de la anomalia max mensual para cada estacion y en el anio que sucedio
resultados_anomyanio = c(calculo_anomyanio(enero_BsAs), calculo_anomyanio(enero_vied), calculo_anomyanio(enero_ros), calculo_anomyanio(enero_sl), calculo_anomyanio(enero_res))
result_anom = resultados_anomyanio[seq(1, length(resultados_anomyanio), by = 2)]
result_anio_anom = resultados_anomyanio[seq(2, length(resultados_anomyanio), by = 2)]

# reescribo los resultados como un vector sin lista de por medio para crear el data.frame
vector_estacion = c(estaciones[,1][[1]], estaciones[,1][[2]], estaciones[,1][[3]], estaciones[,1][[4]], estaciones[,1][[5]])
vector_anio = c(result_anio_anom[[1]], result_anio_anom[[2]], result_anio_anom[[3]], result_anio_anom[[4]], result_anio_anom[[5]])
vector_anom = c(result_anom[[1]], result_anom[[2]], result_anom[[3]], result_anom[[4]], result_anom[[5]])


# PREGUNTA, tuve que reacomodar los datos en un vector sin listas porque al realizar el df me lo ponia todo en una misma fila
# CADA VEZ QUE ARMO UN DATA FRAME DEBEN SER VECTORES LOS DATOS ?????
mi_df = data.frame(Estacion = vector_estacion, Anio = vector_anio, Anomalia = vector_anom)
mi_df

# b) Para cada estacion: Calcular la media y el desvıo estandard para el mes de febrero. Imprimir luego 
# un cartel que seniale para cada estacion en que anios la temperatura estuvo por encima de la media 
# mas un desvıo standar.

# defino una variable con los datos de febrero
febrero = estaciones[,3]

# calculo la media y el desvio estandar para cada estacion, a partir de la variable de
# febrero definida previamente, defino como resultado a la suma de ambos calculos
media_BsAs = mean(febrero[[1]])
desvio_BsAs = sd(febrero[[1]])
resultado_BsAs = media_BsAs + desvio_BsAs

media_vied = mean(febrero[[2]])
desvio_vied = sd(febrero[[2]])
resultado_vied = media_vied + desvio_vied

media_ros = mean(febrero[[3]])
desvio_ros = sd(febrero[[3]])
resultado_ros = media_ros + desvio_ros

media_sl = mean(febrero[[4]])
desvio_sl = sd(febrero[[4]])
resultado_sl = media_sl + desvio_sl

media_res = mean(febrero[[5]])
desvio_res = sd(febrero[[5]])
resultado_res = media_res + desvio_res

# necesito saber las posiciones de las temperaturas de febrero que esten por encima de la media + desvio
# y asi luego poder calcular a que años corresponden cada posicion

# para Buenos Aires, lo mismo para las demas estaciones
for (k in febrero[[1]]) {
  posiciones_BsAs = which(febrero[[1]] > resultado_BsAs)
}

# CUANDO SON COSAS ASI REPETITIVAS PARA CALCULAR LO MISMO PARA VARIAS ESTACIONES, ME CONVIENE CREAR UNA FUNCION??
for (k in febrero[[2]]) {
  posiciones_vied = which(febrero[[2]] > resultado_vied)
}

for (k in febrero[[3]]) {
  posiciones_ros = which(febrero[[3]] > resultado_ros)
}

for (k in febrero[[4]]) {
  posiciones_sl = which(febrero[[4]] > resultado_sl)
}

for (k in febrero[[5]]) {
  posiciones_res = which(febrero[[5]] > resultado_res)
}

# defino un vector para los años
anios = c(1982:2012)
# defino un vector con los años donde la temperatura esta por encima de la media + desvio
anios_x_encima_BsAs = anios[posiciones_BsAs]
# falta definir anios_x_encima para las demas estaciones !!

# genero el cartel pedido, PROBLEMA: ME GENERA VARIOS CARTELES CON CADA AÑO POR SEPARADO, EN VEZ DE UNO DONDE
# MUESTRE TODOS LOS AÑOS, UNO AL LADO DEL OTRO - respuesta: se va a fijar y me avisa la sig clase como se hace

print(paste("Para la estacion de Buenos Aires la temperatura estuvo por encima de la media mas un desvio estandar en los siguientes años:", cat(anios_x_encima_BsAs, sep = ",")))


# c) Escribir una funcion que, dado un vector de longitud N con los datos de temperatura calcule el rango 
# de la serie y la mediana. Utilizar dicha funcion en los datos de enero y guardar los resultados en una 
# nueva matriz que lleve como nombre en cada columna el de cada una de las estaciones. 

funcion = function(vector) {
  rango = max(vector) - min(vector) 
  mediana = median(vector)
  return(list(rango,mediana))      # COMO HAGO PARA QUE ME RETORNE AMBOS RESULTADOS ?? 
}                                  # respuesta: con list

# defino la variable con los datos de enero para las estaciones
enero = estaciones[,2]
# defino un vector para cada estacion con los datos de enero
enero_BsAs = enero[[1]]
enero_vied = enero[[2]]
enero_ros = enero[[3]]
enero_sl = enero[[4]]
enero_res = enero[[5]]

# guardo los datos de la funcion para luego armar la matriz pedida
result_enero_BsAs = funcion(enero_BsAs)
result_enero_vied = funcion(enero_vied)
result_enero_ros = funcion(enero_ros)
result_enero_sl = funcion(enero_sl)
result_enero_res = funcion(enero_res)

# me genero un vector con los resultados del rango y mediana de cada estacion para luego generar la matriz
resultados_enero = c(result_enero_BsAs, result_enero_vied, result_enero_ros, result_enero_sl, result_enero_res)

# genero la matriz pedida, tener en cuenta como van a ir ubicados los datos para que coincidan con las estaciones
# en principio no le agrego condicion de como deben ir los valores pues lo va acomodando por columnas
matriz = matrix(data = resultados_enero, nrow = 2, ncol = 5) # 5 columnas porque son 5 estaciones y 2 filas porque son dos datos
# le pongo nombres a las columnas y filas
colnames(matriz) = c(estaciones[,1])
row.names(matriz) = c("Rango", "Mediana")

matriz
