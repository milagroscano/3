# Ejercicio 7 - CONSULTA inciso e)

# El archivo “datostmediaSABE2010.txt??? contiene la serie de temperaturas medias diarias de la estaci´on 
# Aeroparque correspondiente al 2010. Utilizando el comando “scan??? cargar los datos en una variable de R.
# Por ejemplo: TEMP<−scan(’datostmediaSABE2010.txt’,sep=??????) 

rm(list = ls())
# temp <- scan("/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/datos_tmedia_SABE_2010.txt",sep="") 
temp <- scan("/home/clinux01/LaboAtm2023/ClasesPrac/Practica_3/datos_tmedia_SABE_2010.txt", sep = "")

# a) Dado que se trata de temperaturas medias mensuales para la Ciudad de Buenos Aires, valores superiores 
# a 40◦C son, muy probablemente, err´oneos de acuerdo con el comportamiento climatol´ogico de esta variable. 

# Dise˜nar y programar un algoritmo que identifique la posici´on dentro de la serie de los d´ıas donde el 
# valor de la temperatura media supera los 40◦C, pero que adem´as muestre el valor del d´ıa anterior y del 
# d´ıa siguiente. Obtener la cantidad total de elementos err´oneos. 

# defino pos_erroneo como un vector con las posiciones de los datos erroneos
pos_erroneo = c(which(temp > 40))

# obtengo el total de datos erroneos
total_datos_err = length(pos_erroneo)

# defino dos vectores, uno con las posiciones anteriores de los datos erroneos, y otro con las posiciones posteriores
pos_ant = c(pos_erroneo-1)
pos_post = c(pos_erroneo+1)

# defino los valores de temp de los dias anteriores y posteriores de los dias que tuvieron un dato erroneo
temp_ant = temp[pos_ant]
temp_post = temp[pos_post]

################### ESTA BIEN HECHO ???? Respuesta: SI, pero se podria hacer con ciclos
# Armo un texto con los datos para que tenga sentido
for (i in 1:total_datos_err) {
  print(paste("En el dia", pos_erroneo[i], "del año 2010 se encuentra un dato erroneo, pero el dia anterior la temperatura fue", temp_ant[i], ", mientras que la temperatura correspondiente al dia siguiente del erroneo fue", temp_post[i]))
}

# b) Calcular el valor m´aximo y el m´ınimo de la serie teniendo en cuenta los puntos err´oneos y sin tenerlos 
# en cuenta. Calcular la cantidad total de datos faltantes. Remover los elementos faltantes y los err´oneos 
# de la serie de temperatura. 

# teniendo en cuenta los datos erroneos
max_temp = max(temp)
print(max_temp)

# sin tener en cuenta los datos erroneos
max_temp = 0

for (i in temp) {
  if (i > 40) {
    next
  }
  if (i > max_temp) {
    max_temp = i
  }
}
print(max_temp)

# defino el dato faltante como -999, ya que asi aparece en los datos
# calculo sus posiciones dentro de temp y la cantidad del mismo
dato_faltante = -999
pos_faltante = c(which(temp==dato_faltante))
total_dat_falt = length(pos_faltante)

# remuevo los datos faltantes y erroneos, los defino como NA para removerlos
temp[pos_faltante] = NA
temp[pos_erroneo] = NA
# length(which(is.na(temp), arr.ind = T)) debe coincidir con los datos que le falten a temp_nuevo
################## Respuesta a mis dudas con el na.rm = T, eso solo se agrega cuando se va a utilizar una funcion
# como mean, sum o algo asi y se lo aplica a una serie que tiene NA, la funcion ignora los NA y realiza la 
# operacion sobre el resto de los datos

temp_nuevo = na.omit(temp)      ############# EN CLASE VIMOS na.rm= T PERO NO SE COMO APLICARLO, ES VALIDO ESTO ??
# Respuesta: el na.omit es valido, pues directamente elimina los NA dentro de la serie de datos y da como resultado una serie 
# de datos donde los NA ya no estan

# c) Ordenar la serie de menor a mayor y calcular su mediana. 

temp_ordenado = sort(temp_nuevo)
mediana = median(temp_ordenado)

# d) Generar una serie de medias semanales a partir de los datos medios diarios. 

length(temp_nuevo) # son datos diarios de todo un anio sin los datos erroneos y faltantes
# cant_semanas = length(temp_nuevo)/7  = 50.43

# divido la serie en 7 columnas que representan los dias de la semana
datos_semanales = matrix(data = temp_nuevo, ncol= 7, byrow = T) 
row.names(datos_semanales) = c(paste("Semana", 1:51))
colnames(datos_semanales) = c(paste("Dia", 1:7))

prom_semanal = rowMeans(datos_semanales)
# considerar que la semana 51 tiene datos repetidos para llenar las columnas, le puedo asignar NA

# e) Dividir el rango de la variable en N intervalos de igual longitud y calcular el n´umero de elementos de
# la serie que cae dentro de cada intervalo. Repetir el ejercicio utilizando la funci´on intr´ınseca “hist???. 

min_temp = min(temp_nuevo)
max_temp 

rango = range(temp_nuevo)    # el valor minimo y maximo
N = as.numeric(readline("Ingrese un numero para la cantidad de intervalos:"))

# utilizo un ciclo para calcular la cantidad de elementos qu caen dentro del nuevo intervalo
delta_x = (rango[2]-rango[1])/N   ############# ESTA BIEN DEFINIDO

# PROBAR SI FUNCIONA
vector_int = c()
for (i in 1:N) {
  if (i == 1) {
    vector_int = c(vector_int, rango[1])
  } else {
    vector_int = c(vector_int, rango[1]+delta_x*(i-1))
  }
}

# CANT no se calcula bien
cant = c()
j = 1
for (i in vector_int) {
  if (i == max(vector_int)) {
    break
  } 
  if (i == vector_int[length(vector_int)-1]) {
    cant[j] = length(temp_nuevo[(temp_nuevo >= i) & (temp_nuevo <= (i + delta_x))])
  } else {
    cant[j] = length(temp_nuevo[(temp_nuevo >= i) & (temp_nuevo < (i + delta_x))])
  }
  j = j + 1
}


# f) OPCIONAL: Generar una serie filtrada utilizando promedios m´oviles de largo N. (Tener especial cuidado 
# con el tratamiento cerca del comienzo y del final de la serie).

################ no se hace