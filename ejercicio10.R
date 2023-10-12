
# Ejercicio 10 - PREGUNTAR

# Generar una celda con 10 elementos, donde cada elemento sea un nombre propio. Armar una funcion que 
# permita ingresar una lista con nombres (de cualquier dimension) y una letra, y que devuelva una lista 
# que contenga todos los nombres contenidos en la celda original que comiencen con dicha letra. 

rm(list = ls())

# genero la lista con 10 elementos
mi_lista = list(nombres = c("Milagros", "Alejandro", "Ezequiel", "Sol", "Belen", "Federico", "Martina", "Delfina", "Pablo", "Roma"))

# genero la funcion pedida
j = 1
lista_nueva = list()
funcion = function(lista, letra) {
  for (i in lista$nombres[j]) { # necesito saber por donde va a recorrer i
    if (letra == (substr(lista$nombres[j], 1, 1))) {
      lista_nueva = list(c(lista$nombres[j]))  # algo debe estar mal aca porque solo me devuelve 
    }                                         # el primer nombre e i no avanza, revisar por donde recorre 
    j = j + 1 
  }
  return(lista_nueva)
}

# ejemplo para ver si funciona, solo sirve con M pero no incluye Martina, pues i no avanza
funcion(mi_lista, "M")


############################################### ejemplos - ayudas
# indexacion para ingresar al primer elemento de la celda
mi_lista$nombres[1]
# indexacion para obtener la primera letra de los nombres
substr(mi_lista$nombres[2], 1, 1)

