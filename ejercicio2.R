
# Ejercicio 2 

rm(list = ls())

# a) Se definen las siguientes variables: 
a <- c(4, -10, 7, -2, 8, -6, 1, -15, 3, -9) 
i <- 3 
j <- 5 
b <- c(1,5,7) 
c <- c(TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE) 
 
# Determinar sin usar R la cantidad de elementos y los elementos que componen cada una de estas selecciones: 
# i) a[]                me devuelve todo el vector ya que no especifico una posicion
# ii) a[i,j]            me devuelve error porque a es un vector y por lo tanto es de una sola dimension
# iii) a[seq(i,i,2)]    me devuelve el nro 7 ya que la secuencia arranca en la posicion i = 3 y termina en la misma
# iv) a[seq(i,j,3)]     me devuelve el nro 7 ya que la secuencia arranca en la posicion i = 3, y como va de 3 en 3 y termina en la posicion j = 5, no hay otro nro que entre en la secuencia
# v) a[i:length(a)]     me devuelve los valores de a en las posiciones que arrancan en 3 y termina en el length de a
# vi) a[c(1,5,7)]       me devuelve los valores de a en la posicion del vector, es decir el valor de a en la posicion 1, 5 y 7
# vii) a[b]             me devuelve lo mismo que el item anterior pues b es el mismo vector
# viii) a[c]            me devuelve los valores de las posiciones que sean TRUE
# ix) a[a==-4]          me devuelve los valores de las posiciones que cumplan la condicion, es decir los valores que sean igual a -4, en este caso no hay ninguno entonces devuelve numeric(0)
 
# Verificar en R cu´antas componentes tiene el resultado. 

# b) Dado el siguiente array de 5x5: 

# mimatriz=   12345 678910 1112131415 1617181920 2122232425   
# 
# Determinar la dimensi´on y los elementos contenidos en las siguientes secciones: 
# i) mimatriz[3,2] 
# ii)mimatriz[3,] 
# iii)mimatriz[,2] 
# iv)mimatriz[seq(1,5,2),] 
# v)mimatriz[,seq(2,5,2)] 
# vi)mimatriz[seq(1,5,2),seq(1,5,2)] 
# vii)mimatriz[10] 
# viii)mimatriz[b]  %Utilizar el vector b definido en el ´ıtem a).

