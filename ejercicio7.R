# Ejercicio 7 - MINIS CONSULTAS, inciso e)

# El archivo “datostmediaSABE2010.txt” contiene la serie de temperaturas medias diarias de la estaci´on 
# Aeroparque correspondiente al 2010. Utilizando el comando “scan” cargar los datos en una variable de R.
# Por ejemplo: TEMP<−scan(’datostmediaSABE2010.txt’,sep=””) 

rm(list = ls())
temp <- scan("/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/datos_tmedia_SABE_2010.txt",sep="") 

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

# imprimo los valores de temp de los dias anteriores y posteriores de los dias que tuvieron un dato erroneo
print(temp[pos_ant])
print(temp[pos_post])

############################# ESTA BIEN HECHO ????

# b) Calcular el valor m´aximo y el m´ınimo de la serie teniendo en cuenta los puntos err´oneos y sin tenerlos 
# en cuenta. Calcular la cantidad total de datos faltantes. Remover los elementos faltantes y los err´oneos 
# de la serie de temperatura. 

# teniendo en cuenta los datos erroneos
for (i in temp) {
  max_temp = max(temp)
}
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
temp_nuevo = na.omit(temp)      ############# EN CLASE VIMOS na.rm= T PERO NO SE COMO APLICARLO, ES VALIDO ESTO ??
## na.rm=TRUE

# c) Ordenar la serie de menor a mayor y calcular su mediana. 

temp_ordenado = sort(temp_nuevo)
mediana = median(temp_ordenado)

# d) Generar una serie de medias semanales a partir de los datos medios diarios. 

# datos_diarios = length(temp)    = 365
# cant_semanas = datos_diarios/7  = 52.14 - 53
datos_semanales = matrix(data = temp, ncol= 7)  # divido la serie en 7 columnas que representan los dias de la semana
# ESTO HABIA QUE HACER ???

# e) Dividir el rango de la variable en N intervalos de igual longitud y calcular el n´umero de elementos de
# la serie que cae dentro de cada intervalo. Repetir el ejercicio utilizando la funci´on intr´ınseca “hist”. 

min_temp = min(temp_nuevo)
max_temp

rango = c(min_temp:max_temp) 
rango1 = range(temp)    # el valor minimo y maximo
N = as.numeric(readline("Ingrese un numero para la cantidad de intervalos:"))

div = rango/N # ?????????

############################### NO TERMINO DE ENTENDER LA CONSIGNA, Y A QUE SE REFIERE CON RANGO

# f) OPCIONAL: Generar una serie filtrada utilizando promedios m´oviles de largo N. (Tener especial cuidado 
# con el tratamiento cerca del comienzo y del final de la serie).

################ no se hace