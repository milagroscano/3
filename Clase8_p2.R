# ARRAYS

rm(list = ls())

load("Escritorio/LaboAtm2023/ClasesPrac/datos_dimensiones_viento.RData")
load("Escritorio/LaboAtm2023/ClasesPrac/datos_viento.RData")

# A partir del archivo “datos_viento.RData” que contiene datos diarios de la
# componente u del viento en diferentes niveles de la atmósfera para el mes de
# diciembre de 2017 sobre Sudamérica:

# (Cargar el archivo con la funcion load(“ruta_Archivo/nombre_Archivo.RData”))

# Obtener el promedio del viento de diciembre para cada nivel y punto
# de retícula (AYUDA: el resultado deberia ser una matriz para cada nivel).

promedio <- apply(viento, c(1,2,4), mean) # promedio para cada nivel

# reacomodo datos para obtener cada punto de reticula
viento2 <- array(data=viento, dim=c(72*89, 31, 2))
# calculo el promedio para cada nivel y punto de reticula
promedio2 <- apply(viento2, c(1,3), mean)

# Seleccione el nivel de 850hPa y guardar en una matriz el promedio de
# viento sobre el dominio.

prom_850 <- promedio[,,1]  # para el primer caso al no tener la reticula me dara una matriz con lon y lat para el nivel 850
prom2_850 <- promedio2[,1] # para el caso 2, al ya tener una reticula armada, el promedio sera un vector para el nivel 850

# Para el promedio del viento de diciembre del nivel de 200 hPa,
# sumar todos los valores del dominio y guardarlos en un vector

prom_200 <- promedio[,,2]
suma_200 <- sum(prom_200)

prom2_200 <- promedio2[,2]  
suma2_200 <- sum(prom2_200)

# de ambas formas me tiene que dar el mismo valor que es un resultado, no vector

# Ayuda: en el archivo “datos_dimensiones_viento.RData” se encuentran las
# dimensiones del objeto que se encuentra en el archivo “datos_viento.RData”


# -------------------------------------------------------------------------

# DATA FRAME

# Ejemplo a partir de vectores
rm(list = ls())
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc")
b <- c(TRUE, FALSE, TRUE)
df <- data.frame(n, s, b)
df

# Ejemplo a partir de matriz y vector
rm(list = ls())
nombres <- c("Padre", "Madre", "Hijo")
m <- matrix(c(1:6),nrow=3)
v <- c(180,157,165)
df <- data.frame(familia = nombres, m, estatura=v)
df

# Ejercicio

# Generar un data frame con dos columnas: una con los valores de la base de
# 4 parcelas rectangulares y otra con los valores de la altura de esas parcelas.
# Calcular la superficie de cada parcela e incorporarla al dataframe como una nueva columna.
rm(list = ls())

base <- c(6, 5, 7, 4)
altura <- c(2, 3, 6, 1)

area <- base*altura

df <- data.frame(Base = base, Altura = altura, Superficie = area, row.names= c("Parcela 1", "Parcela 2", "Parcela 3", "Parcela 4"))
df
