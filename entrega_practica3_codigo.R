# 
# Ejercicio de entrega - Practica 3
#   
# En los archivos de Practica 3 se cuenta con seis archivos de datos correspondientes a valores medios
# diarios de temperatura, temperatura de rocıo y presion reducida a nivel del mar para las estaciones
# Azul, Catamarca, Aeroparque, Chilecito, Iguazu y Mendoza. En cada caso, las columnas indican:
#   codigo de identificacion, fecha (YYYYMMDD), temperatura, temperatura de rocio y presion. 
# Ademas, los datos faltantes estan codificados con el valor 999.9. 
# Los valores de temperatura estan en grados Farenheit.

# limpio el environment
rm(list=ls())
# fijo el directorio de trabajo
setwd("C:/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/")
# cargo los datos
MENDOZA = scan("MENDOZA.txt")
IGUAZU = scan("IGUAZU.txt")
AEROPARQUE = scan("AEROPARQUE.txt")
CATAMARCA = scan("CATAMARCA.txt")
CHILECITO = scan("CHILECITO.txt")
AZUL = scan("AZUL.txt")

# 1. Armar una lista de listas (array de listas) que contenga los datos correspondientes a cada estacion
# como ası tambien informacion asociada a cada estacion en particular: nombre, latitud, longitud,
# altura y codigo de identificacion. Convertir los valores de temperatura y temperatura de rocıo
# a grados centıgrados. La informacion sobre la ubicacion de cada estacion esta disponible en el
# archivo estaciones.txt.

# cargo los datos de las estaciones
datos_estaciones = read.table("estaciones.txt")
names(datos_estaciones) = c("estacion", "latitud", "longitud", "altura")

# armo la lista de listas
datos = list(datos_estaciones = datos_estaciones, MENDOZA = MENDOZA, IGUAZU = IGUAZU, AEROPARQUE = AEROPARQUE, 
             CATAMARCA = CATAMARCA, CHILECITO = CHILECITO, AZUL = AZUL)

# convierto los valores de temperatura a grados centigrados
convertir_temp = function(temp) {
  celsius = (temp - 32)*(5/9)
  return(celsius)
}

# defino las posiciones de las temperaturas dentro de las listas
temp_mdz = datos$MENDOZA[seq(3, length(MENDOZA), by = 5)]
temp_igz = datos$IGUAZU[seq(3, length(IGUAZU), by = 5)]
temp_aer = datos$AEROPARQUE[seq(3, length(AEROPARQUE), by = 5)]
temp_cat = datos$CATAMARCA[seq(3, length(CATAMARCA), by = 5)]
temp_chi = datos$CHILECITO[seq(3, length(CHILECITO), by = 5)]
temp_azl = datos$AZUL[seq(3, length(AZUL), by = 5)]

# 2. En base a la lista armada en el punto a), desarrollar funciones que permitan hacer lo siguiente:
# 
# i) A partir del array, generar un resumen por pantalla con el nombre de las estaciones y la
# cantidad de datos presentes en cada una, los estadısticos basicos de cada serie (media, desvıo
# estandar, valor maximo y mınimo), la fecha inicial del perıodo abarcado y la fecha final.
# Tip: organizar los datos de cada estacion en un data.frame.
# 
# ii) Una funcion que permita obtener todas las estaciones que estan dentro de una determinada
# region definida por una latitud maxima, una latitud mınima, una longitud maxima y una
# longitud mınima. En el caso que no haya, devuelva el mensaje ”No hay estaciones cercanas”.
# 
# iii) Guardar la lista generada en un archivo con formato Rdata.
# Ayuda: utilice alguna de las funciones vistas en la teorica para abrir los archivos.

