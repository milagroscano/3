
# Archivos ascii - Ejemplo Lectura

# En el archivo datos_boya.txt se tienen las temperaturas superficiales del
# mar (TSM) medias mensuales de una boya ubicada en el Golfo de San
# Matías (período 1982-2015).
rm(list=ls())

## seteo la ruta hacia el directorio nombrando primero la carpeta, luego el archivo
archivo<- "/home/clinux01/Descargas/boya.txt"

## Primero leo el archivo solo usando read.table sin especificar otro argumento
datos<- read.table(archivo)

# Miro como se cargaron los datos
head(datos) 

# Con head cargo solo las primeras 6 filas
tail(datos)

# La primera columna no tiene datos sino el encabezado del archivo.
# Entonces para que la lectura sea correcta tengo que
# agregar el argumento header= TRUE
datos <- read.table(archivo, header = TRUE)
head(datos)

# Puedo mirar las dimensiones de los datos
dim(datos) # son 400 filas y 3 columnas

######################################

archivo2<- "/home/clinux01/Descargas/boya_2.txt"

## Primero leo el archivo solo usando read.table sin especificar otro argumento
datos2<- read.table(archivo2)

# Miro como se cargaron los datos
head(datos2)

# Podemos ver que el archivo tiene encabezado y ademas esta
#separado por comas
# Entonces para leerlo correctamente usamos header=TRUE
# y sep= ","
datos_2<- read.table(archivo2, header = TRUE, sep = ",")
head(datos_2)

####################################################
# Archivos ascii - Lectura con otras funciones
datos_2<- scan(archivo2,what = list("numeric(0)","numeric","numeric"),sep = ",")
head(datos_2)

###############################################
# Archivos ascii - Escritura ejemplo

# Creo dos vectores
tipo <- c("A", "B", "C")
longitud <- c(120.34, 99.45, 115.67)

## Con los vectores tipo longitud creo un data frame
datos_salida <- data.frame(tipo, longitud)
datos_salida

# primero seteo el directorio de salidas y el nombre del archivo con la funcion here
archivo_salida <- "/home/clinux01/LaboAtm2023/ClasesPrac/ejemplo_escritura_datos.txt"

# luego uso la funcion write.table especificando primero la variable datos_salida
# y luego el nombre de archivo con su ruta correspondiente
write.table(datos_salida, file = archivo_salida)

# si quiero especificar que los caracteres sean sin comillas uso el argumento quote=FALSE
# si ademas quiero eliminar los numeros de fila uso row.names=FALSE
write.table(datos_salida, archivo_salida, quote = F, row.names= F)

##############################################################################################
# Archivos ascii - Ejercicio

# En el archivo datos_estaciones.txt se encuentran los datos del 6 de mayo
# de 2022 de cuatro estaciones meteorologicas de Argentina. El código de
# datos faltantes es -999. Abrir el archivo ascii y calcular:
# - Cantidad de datos faltantes
# - Valor máximo de temperatura, humedad y presión. ¿En que estación
#   se registra cada valor máximo? ¿A qué hora?
# - Promedio y desvio estandar de la temperatura para cada estación.
#   Guardar en un archivo .txt el valor del promedio y desvio de la
#   temperatura para cada estacion.

# En el archivo de salida: cada fila debe ser una estación, los caracteres no
# deben tener comillas, el archivo tiene que tener un encabezado, el
# promedio y el desvio estandar debe tener solo dos decimales.
rm(list = ls())
# seteo el directorio para abrir eñ archivo
archivo <- "/home/clinux01/Descargas/datos_estaciones.txt"

# leo el archivo
datos<- read.table(archivo)
head(datos)
dim(datos)

# La primera columna no tiene datos sino el encabezado del archivo.
# Entonces para que la lectura sea correcta tengo que
# agregar el argumento header= TRUE
datos <- read.table(archivo, header = TRUE)
head(datos)

# calculo la cantidad de datos faltantes
pos_dat_falt <- which(datos == -999)   # busco las posiciones donde hay datos faltantes
cant_dat_falt <- length(pos_dat_falt)  # le calculo la longitud de posiciones para saber la cantidad


# Calculo el valor máximo de temperatura, humedad y presión. 
temp_max <- max(datos$TEMP)
hum_max <- max(datos$HUM)
pnm_max <- max(datos$PNM)

# Busco en que posiciones esta cada valor maximo para determinar en que estación
# se registra y a qué hora
pos_tempmax <- which(datos$TEMP==temp_max)
# entonces en pos_tempmax queda guardado la fila en la cual se registra la temperatura maxima
# luego defino dos variable con sus datos de hora y estacion
hora_tempmax <- datos$HORA[pos_tempmax]
est_tempmax <- datos$NOMBRE[pos_tempmax]

# realizo el mismo procedimiento para las demas variables
pos_hummax <- which(datos$HUM==hum_max)
hora_hummax <- datos$HORA[pos_hummax]
est_hummax <- datos$NOMBRE[pos_hummax]

pos_pnmmax <- which(datos$PNM==pnm_max)
hora_pnmmax <- datos$HORA[pos_pnmmax]
est_pnmmax <- datos$NOMBRE[pos_pnmmax]

# calculo el promedio y desvio estandar de temperatura para cada estacion
# primero separo los datos por estacion

# primero debo sacar los datos faltantes
datos$TEMP[which(datos$TEMP == -999)] <- NA
# mean(datos$TEMP, na.rm = T)

pos_aero <- which(datos$NOMBRE=="AEROPARQUE")
datos_aero <- datos[pos_aero,]
temp_aero <- datos_aero$TEMP
prom_aero <- mean(temp_aero, na.rm = T)
desvio_aero <- sd(temp_aero, na.rm = T)

pos_res <- which(datos$NOMBRE=="RESISTENCIA")
datos_res <- datos[pos_res,]
temp_res <- datos_res$TEMP
prom_res <- mean(temp_res, na.rm = T)
desvio_res <- sd(temp_res, na.rm = T)

pos_tuc <- which(datos$NOMBRE=="TUCUMAN")
datos_tuc <- datos[pos_tuc,]
temp_tuc <- datos_tuc$TEMP
prom_tuc <- mean(temp_tuc, na.rm = T)
desvio_tuc <- sd(temp_tuc, na.rm = T)

pos_vie <- which(datos$NOMBRE=="VIEDMA")
datos_vie <- datos[pos_vie,]
temp_vie <- datos_vie$TEMP
prom_vie <- mean(temp_vie, na.rm = T)
desvio_vie <- sd(temp_vie, na.rm = T)

# Guardo el promedio y desvio estandar para cada estacion en un archivo txt
promedio <- c(prom_aero, prom_res, prom_tuc, prom_vie)
desvio <- c(desvio_aero, desvio_res, desvio_tuc, desvio_vie)
estacion <- c("AEROPARQUE", "RESISTENCIA", "TUCUMAN", "VIEDMA")

datos_salida <- data.frame(promedio, desvio, row.names = estacion, col.names = c("estacion", "promedio", "desvio"))
datos_salida

archivo_salida <- "/home/clinux01/LaboAtm2023/ClasesPrac/ejercicio_clase12.txt"
write.table(datos_salida, file = archivo_salida)


