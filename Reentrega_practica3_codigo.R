
# Ejercicio de entrega - Practica 3

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

####################################################
# RESOLUCION:
# cargo los datos de las estaciones
datos_estaciones = read.table("estaciones.txt")
names(datos_estaciones) = c("estacion", "latitud", "longitud", "altura")

# defino las posiciones de las temperaturas dentro de las listas
temp_mdz = MENDOZA[seq(3, length(MENDOZA), by = 5)]
temp_igz = IGUAZU[seq(3, length(IGUAZU), by = 5)]
temp_aero = AEROPARQUE[seq(3, length(AEROPARQUE), by = 5)]
temp_cat = CATAMARCA[seq(3, length(CATAMARCA), by = 5)]
temp_chi = CHILECITO[seq(3, length(CHILECITO), by = 5)]
temp_azl = AZUL[seq(3, length(AZUL), by = 5)]

# convierto los valores de temperatura a grados centigrados
convertir_temp = function(temp) {
  celsius = (temp - 32)*(5/9)
  return(celsius)
}

# recopilo todos los datos para la estacion de Mendoza, luego realizo lo mismo para las demas estaciones
temp_mdz_cel = convertir_temp(temp_mdz)
cod_de_id_mdz = MENDOZA[1] # obs: no hay datos de lat, long y altura de Mendoza

# me armo una lista con los datos de Mendoza
Mendoza_datos = list(Nombre = "Mendoza", Codigo_de_identificacion = cod_de_id_mdz, Temperaturas = temp_mdz_cel)

# realizo lo mismo para las demas estaciones
# IGUAZU
temp_igz_cel = convertir_temp(temp_igz)
cod_de_id_igz = IGUAZU[1]
lat_igz = datos_estaciones$latitud[5]
lon_igz = datos_estaciones$longitud[5]
altura_igz = datos_estaciones$altura[5]

Iguazu_datos = list(Nombre = "Iguazu", Latitud = lat_igz, Longitud = lon_igz , Altura = altura_igz, Codigo_de_identificacion = cod_de_id_igz, Temperaturas = temp_igz_cel)

# AEROPARQUE
temp_aero_cel = convertir_temp(temp_aero)
cod_de_id_aero = AEROPARQUE[1]
lat_aero = datos_estaciones$latitud[2]
lon_aero = datos_estaciones$longitud[2]
altura_aero = datos_estaciones$altura[2]

Aeroparque_datos = list(Nombre = "Aeroparque", Latitud = lat_aero, Longitud = lon_aero , Altura = altura_aero, Codigo_de_identificacion = cod_de_id_aero, Temperaturas = temp_aero_cel)

# CATAMARCA
temp_cat_cel = convertir_temp(temp_cat)
cod_de_id_cat = CATAMARCA[1]
lat_cat = datos_estaciones$latitud[3]
lon_cat = datos_estaciones$longitud[3]
altura_cat = datos_estaciones$altura[3]

Catamarca_datos = list(Nombre = "Catamarca", Latitud = lat_cat, Longitud = lon_cat , Altura = altura_cat, Codigo_de_identificacion = cod_de_id_cat, Temperaturas = temp_cat_cel)

# CHILECITO
temp_chi_cel = convertir_temp(temp_chi)
cod_de_id_chi = CHILECITO[1]
lat_chi = datos_estaciones$latitud[4]
lon_chi = datos_estaciones$longitud[4]
altura_chi = datos_estaciones$altura[4]

Chilecito_datos = list(Nombre = "Chilecito", Latitud = lat_chi, Longitud = lon_chi , Altura = altura_chi, Codigo_de_identificacion = cod_de_id_chi, Temperaturas = temp_chi_cel)

# AZUL
temp_azl_cel = convertir_temp(temp_azl)
cod_de_id_azl = AZUL[1]
lat_azl = datos_estaciones$latitud[1]
lon_azl = datos_estaciones$longitud[1]
altura_azl = datos_estaciones$altura[1]

Azul_datos = list(Nombre = "Azul", Latitud = lat_azl, Longitud = lon_azl, Altura = altura_azl, Codigo_de_identificacion = cod_de_id_azl, Temperaturas = temp_azl_cel)

# armo la lista de listas
datos = list(Mendoza = Mendoza_datos, Iguazu = Iguazu_datos, Aeroparque = Aeroparque_datos, 
             Catamarca = Catamarca_datos, Chilecito = Chilecito_datos, Azul = Azul_datos)

# 2. En base a la lista armada en el punto 1), desarrollar funciones que permitan hacer lo siguiente:
 
# i) A partir del array, generar un resumen por pantalla con el nombre de las estaciones y la
# cantidad de datos presentes en cada una, los estadısticos basicos de cada serie (media, desvıo
# estandar, valor maximo y mınimo), la fecha inicial del perıodo abarcado y la fecha final.
# Tip: organizar los datos de cada estacion en un data.frame.

# defino una nueva lista con los datos de cada estacion, para luego poder definir las fecha iniciales y finales dentro de la funcion
list_datos_estaciones = list(MENDOZA, IGUAZU, AEROPARQUE, CATAMARCA, CHILECITO, AZUL)

# armo una funcion que se deba ingresar dos listas, una con los datos ya pedidos en el item anterior y otra nueva definida
resumen = function(lista1, lista2) {
  nombre_estacion = c()
  cant_datos = c()
  media = c()
  desvio = c()
  temp_max = c()
  temp_min = c()
  fecha_inicial = c()
  fecha_final = c()
  for (i in 1:6) {
    nombre_estacion = c(nombre_estacion, lista1[[i]]$Nombre)
    cant_datos = c(cant_datos, length(lista1[[i]]$Temperaturas))
    media = c(media, mean(lista1[[i]]$Temperaturas))
    desvio = c(desvio, sd(lista1[[i]]$Temperaturas))
    temp_max = c(temp_max, max(lista1[[i]]$Temperaturas))
    temp_min = c(temp_min, min(lista1[[i]]$Temperaturas))
    fecha_inicial = c(fecha_inicial, lista2[[i]][2])
    fecha_final = c(fecha_final, lista2[[i]][length(lista2[[i]])-3])
  }
  resumen_estacion = data.frame(Estacion = nombre_estacion, Cantidad_de_datos = cant_datos, Media = media, Desvio_estandar = desvio, 
                                Temperatura_maxima = temp_max, Temperatura_minima = temp_min, Fecha_inicial = fecha_inicial, Fecha_final = fecha_final)
  return(resumen_estacion)
}

resumen(datos, list_datos_estaciones)

# ii) Una funcion que permita obtener todas las estaciones que estan dentro de una determinada
# region definida por una latitud maxima, una latitud mınima, una longitud maxima y una
# longitud mınima. En el caso que no haya, devuelva el mensaje "No hay estaciones cercanas".

estaciones = c()
region = function(lista, lat_max, lat_min, lon_max, lon_min) {
  # como la estacion Mendoza no tiene datos de latitud y longitud, no lo tengo en cuenta para la funcion, y arranco por la 2da estacion
  for (i in 2:6) {
    if (((lista[[i]]$Latitud <= lat_max) && (lista[[i]]$Latitud >= lat_min)) && ((lista[[i]]$Longitud <= lon_max) && (lista[[i]]$Longitud >= lon_min))) {
      estaciones = c(estaciones, lista[[i]]$Nombre) 
    } else {
      print("No hay estaciones cercanas")
    }
  } 
  return(estaciones) 
}

# iii) Guardar la lista generada en un archivo con formato Rdata.
save(datos, file = "lista_generada.RData")

# Ayuda: utilice alguna de las funciones vistas en la teorica para abrir los archivos.
