
# Ejercicio 5 

# a) Se tienen datos de temperatura tomados cada 3 horas en una estaci´on de superficie comenzando a las 00 
# y terminando a las 21 (serie<-c(25,20,18,22,27,31,32,28)). Armar un script de R que permita ingresar la 
# serie de datos por pantalla, la guarde en un vector y muestre por pantalla la hora en la que ocurri´o el 
# m´aximo valor medido y el valor de la temperatura m´axima medida. 
rm(list = ls())

temp <- c()
# datos para ingresar en temp : serie<-c(25,20,18,22,27,31,32,28)
horas <- seq(0, 21, 3)

for (i in 1:length(horas)) {
  temp[i] <- as.numeric(readline("Ingrese el dato de temperatura"))
}

temp_max = 0
for (i in 1:length(horas)) {
  if (temp[i] > temp_max) {
    temp_max <- temp[i]
    pos_max = as.numeric(i)
  } 
}

hora_max = horas[pos_max]  
  
print(paste("La temperatura maxima medida es", temp_max, "y ocurrio a la hora", hora_max))

# b) Repetir el inciso anterior utilizando la funci´on intr´ınseca “max”. Comparar los tiempos involucrados 
# con los del inciso anterior. 
rm(list = ls())

temp <- c()
# datos para ingresar en temp : serie<-c(25,20,18,22,27,31,32,28)
horas <- seq(0, 21, 3)

for (i in 1:length(horas)) {
  temp[i] <- as.numeric(readline("Ingrese el dato de temperatura"))
}

temp_max = max(temp)
pos_max = which(temp==temp_max)
hora_max = horas[pos_max]

print(paste("La temperatura maxima medida es", temp_max, "y ocurrio a la hora", hora_max))

# c) Calcular la suma de todos los elementos de la serie de temperaturas y comparar los resultados utilizando 
# la funci´on intr´ınseca “sum”. Idem con el promedio de las temperaturas (verificar utilizando la funci´on
# intr´ınseca “mean”). 
rm(list=ls())

temp <- c()
# datos para ingresar en temp : serie<-c(25,20,18,22,27,31,32,28)

for (i in 1:length(horas)) {
  temp[i] <- as.numeric(readline("Ingrese el dato de temperatura"))
}

suma = 0
for (i in 1:8) {
  suma = temp[i] + suma
}
sum(temp) #verifico

prom = suma/length(temp)
mean(temp) # verifico

# d) Extender el programa anterior, para que permita mostrar la suma pero solamente de las temperaturas que 
# est´an por encima de 20◦C. (Resolver este inciso probando dos maneras, una utilizando arrays l´ogicos y 
# otra utilizando la funci´on intr´ınseca “which”). 
rm(list = ls())

temp <- c()
# datos para ingresar en temp : serie<-c(25,20,18,22,27,31,32,28)

for (i in 1:length(horas)) {
  temp[i] <- as.numeric(readline("Ingrese el dato de temperatura"))
}

# primera forma
suma = 0
for (i in 1:8) {
  if (temp[i] > 20) {
    suma = temp[i] + suma
  }
}
print(suma)

rm(suma)
# segunda forma con which
temp_mayor20 = temp[which(temp>20)] # defino un vector con las temperaturas que sean mayor a 20
suma = 0
for (i in 1:6) {
  suma = temp_mayor20[i] + suma  # solo sumo las temperaturas de ese vector nuevo definido
}
print(suma)
