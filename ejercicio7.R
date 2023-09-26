# Ejercicio 7 

# El archivo “datostmediaSABE2010.txt” contiene la serie de temperaturas medias diarias de la estaci´on 
# Aeroparque correspondiente al 2010. Utilizando el comando “scan” cargar los datos en una variable de R.
# Por ejemplo: TEMP<−scan(’datostmediaSABE2010.txt’,sep=””) 

# a) Dado que se trata de temperaturas medias mensual es para la Ciudad de Buenos Aires, valores superiores 
# a 40◦C son, muy probablemente, err´oneos de acuerdo con el comportamiento climatol´ogico de esta variable. 
# Dise˜nar y programar un algoritmo que identifique la posici´on dentro de la serie de los d´ıas donde el 
# valor de la temperatura media supera los 40◦C, pero que adem´as muestre el valor del d´ıa anterior y del 
# d´ıa siguiente. Obtener la cantidad total de elementos err´oneos. 

# b) Calcular el valor m´aximo y el m´ınimo de la serie teniendo en cuenta los puntos err´oneos y sin tenerlos 
# en cuenta. Calcular la cantidad total de datos faltantes. Remover los elementos faltantes y los err´oneos 
# de la serie de temperatura. 

# c) Ordenar la serie de menor a mayor y calcular su mediana. 

# d) Generar una serie de medias semanales a partir de los datos medios diarios. 

# e) Dividir el rango de la variable en N intervalos de igual longitud y calcular el n´umero de elementos de
# la serie que cae dentro de cada intervalo. Repetir el ejercicio utilizando la funci´on intr´ınseca “hist”. 

# f) OPCIONAL: Generar una serie filtrada utilizando promedios m´oviles de largo N. (Tener especial cuidado 
# con el tratamiento cerca del comienzo y del final de la serie).

