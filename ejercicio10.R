
# Ejercicio 10

# Generar una celda con 10 elementos, donde cada elemento sea un nombre propio. Armar una funcion que 
# permita ingresar una lista con nombres (de cualquier dimension) y una letra, y que devuelva una lista 
# que contenga todos los nombres contenidos en la celda original que comiencen con dicha letra. 

rm(list = ls())

# genero la lista con 10 elementos
mi_lista = list(nombres = c("Milagros", "Alejandro", "Martiniano", "Francisco", "Belen", "Federico", "Martina", "Delfina", "Pablo", "Roma"))

# genero la funcion pedida
funcion = function(lista, letra) {
  lista_nueva = c()
  for (i in lista$nombres) {          # i debe recorrer por cada elemento del container "nombres" de la lista
    if (letra == (substr(i, 1, 1))) {
      lista_nueva = c(lista_nueva,i)  # redefino mi variable lista_nueva, como es un vector para llenar el primer
      }                               # elemento será lista_nueva, y se le va agregando el valor de i hasta generar el 
    }                                 # vector deseado
  return(list(lista_nueva))           # para retornar mas de un valor o resultado se puede utilizar list
}

# ejemplo para ver si funciona, solo sirve con M pero no incluye Martina, pues i no avanza
funcion(mi_lista, "M")


############################################### ejemplos - ayudas para resolver el ejercicio
# indexacion para ingresar al primer elemento de la celda
mi_lista$nombres[1]
# indexacion para obtener la primera letra de los nombres
substr(mi_lista$nombres[2], 1, 1)

