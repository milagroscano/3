
# Ejercicio 9 - PREGUNTAR

# El archivo tmediaEF.RData contiene un array de tipo lista con la temperatura media del mes de Enero y 
# Febrero desde 1982 a 2012 para 5 estaciones argentinas (usar la sentencia load(“tmediaEF.RData�?) para abrirlo). 

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

#  PREGUNTAR, COMO SE CALCULA LA ANOMALIA ???
#  anomalia = dato - media

# b) Para cada estacion: Calcular la media y el desvıo estandard para el mes de febrero. Imprimir luego 
# un cartel que seniale para cada estacion en que anios la temperatura estuvo por encima de la media 
# ¿¿ mas un desvıo standar. ???

# defino una variable con los datos de febrero
febrero = estaciones[,3]

# calculo la media y el desvio estandar para cada estacion, a partir de la variable de
# febrero definida previamente
media_BsAs = mean(febrero[[1]])
desvio_BsAs = sd(febrero[[1]])

media_vied = mean(febrero[[2]])
desvio_vied = sd(febrero[[2]])

media_ros = mean(febrero[[3]])
desvio_ros = sd(febrero[[3]])

media_sl = mean(febrero[[4]])
desvio_sl = sd(febrero[[4]])

media_res = mean(febrero[[5]])
desvio_res = sd(febrero[[5]])

# necesito saber las posiciones de las temperaturas de febrero que esten por encima de la media
# y asi luego poder calcular a que años corresponden cada posicion

# para Buenos Aires, lo mismo para las demas estaciones
for (k in febrero[[1]]) {
  posiciones = which(febrero[[1]]> media_BsAs)
}

# defino un vector para los años
anios = c(1982:2012)
# defino un vector con los años donde la temperatura esta por encima de la media
anios_x_encima = anios[posiciones]
# genero el cartel pedido, PROBLEMA: ME GENERA VARIOS CARTELES CON CADA AÑO POR SEPARADO, EN VEZ DE UNO DONDE
# MUESTRE TODOS LOS AÑOS, UNO AL LADO DEL OTRO
anios_x_encima = anios[2:5]

print(paste0("Para la estacion de Buenos Aires la temperatura estuvo por encima de la media en los siguientes años:", anios_x_encima))


# c) Escribir una funcion que, dado un vector de longitud N con los datos de temperatura calcule el rango 
# de la serie y la mediana. Utilizar dicha funcion en los datos de enero y guardar los resultados en una 
# nueva matriz que lleve como nombre en cada columna el de cada una de las estaciones. 

funcion = function(vector) {
  rango = max(vector) - min(vector) 
  mediana = median(vector)
  return(list(rango,mediana))      # COMO HAGO PARA QUE ME RETORNE AMBOS RESULTADOS ??
}

enero = estaciones[,2]

# creo que no es necesario pues quiero valores para cada estacion ???
datos_enero = c(enero[[1]], enero[[2]], enero[[3]], enero[[4]], enero[[5]]) 

# hecho con datos_enero
resultados = funcion(datos_enero) # me tira error por el problema anterior

# como seria para cada estacion
datos_BsAs = funcion(enero[[1]]) # hacer lo mismo para cada estacion
resultados2 = c(datos_BsAs) # faltan los demas datos

# no funciona pero seria el esquema, ESTA BIEN ???
matriz = matrix(data = resultados2, nrow = 2, ncol = 5) # 5 columnas porque son 5 estaciones y 2 filas porque son dos datos
colnames(matriz) = c(estaciones[,1])
# tener en cuenta como van a ir ubicados los datos para que coincidan con las estaciones
