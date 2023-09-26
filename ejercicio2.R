
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

# mimatriz= ( 1  2  3  4  5 
#             6  7  8  9  10 
#             11 12 13 14 15 
#             16 17 18 19 20 
#             21 22 23 24 25 )
# 
# Determinar la dimensi´on y los elementos contenidos en las siguientes secciones: 
# i) mimatriz[3,2]                     me devuelve el nro que se encuentra en la fila 3 columna 2, o sea el 12
# ii)mimatriz[3,]                      me devuelve toda la fila 3
# iii)mimatriz[,2]                     me devuelve toda la columna 2
# iv)mimatriz[seq(1,5,2),]             me devuelve el segmento que comienza en la posicion 1 y termina en la 5, va 2 en 2
# v)mimatriz[,seq(2,5,2)]              me devuelve todas las filas pero solo las columnas que cumplen con ese segmento
# vi)mimatriz[seq(1,5,2),seq(1,5,2)]   me devuelve las filas y columnas que cumplen con el segmwnto
# vii)mimatriz[10]                     me devuelve el nro que esta en la posicion 10, o sea el 10
# viii)mimatriz[b]  %Utilizar el vector b definido en el ´ıtem a).
# me devuelve los nros que se encuentran en esas posiciones

mimatriz = matrix(1:25, nrow=5, ncol=5)
# corroboro resultados