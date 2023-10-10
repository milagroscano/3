# Clase LISTAS

rm(list = ls())

# Ejemplo:
# genero la lista familia
familia <- list("Maria","Juana", 10, c("Hugo", "Paula"), c(8,7)) 
familia

# Agrego nombres a los elementos de la lista
familia2 <- list(madre = "Maria", tia = "Juana", casados = 10,hijos = c("Hugo","Paula"), edades = c(8, 6))
familia2

# Manupulación de listas ----------------------------------

# Acceder a un elemento de la lista e indexación
# Veo el conteiner de afuera
familia2[2]
class(familia2[2])

familia2["tia"]
class(familia2["tia"])

familia2[c(2,4)]
class(familia2[c(2,4)])

familia2[c("tia", "hijos")]
class(familia2[c("tia", "hijos")])

# Accedo al CONTENIDO de un elemento de la lista
familia2[[2]]
class(familia2[[2]])

familia2$tia
class(familia2$tia)

familia2[["tia"]]
class(familia2[["tia"]])


# Operaciones básicas con listas --------------
# Agregar una componente

familia$mascotas <- "Gato"
familia

familia[7] <- "Auto"
familia

# Eliminar una componente

familia$edades <- NULL
familia

familia[[5]] <- NULL
familia

# Concatenacion de listas
familia_2 <- list(mascotas = "Gato", vacaciones_favoritas = c("Mar del Plata"))
familia_concatenada <- c(familia, familia_2)
familia_concatenada

# Operaciones avanzadas con listas ----------
mi_lista <- list(x = c(1, 3, 5), y = c(2, 2, 3))
lapply(mi_lista, function(x) mean(x))

# Ejercicio
rm(list = ls())
# ▶ Generar una lista en cuyo primer elemento haya un vector de caracteres con los nombres de los y las alumnas presentes en
# clase y cuyo segundo elemento sea un vector con las edades de los y las alumnas
alumnos <- list(nombres = c("Sol", "Domi", "Sabri", "Lucas"), edades = c(23, 21, 24, 23))
alumnos

# ▶ Hacer un promedio de las edades y añadirlo a la lista como tercer elemento
promedio <- mean(alumnos$edades)
alumnos$promedio <- promedio
alumnos

# ▶ Calcular la longitud de cada elemento de la lista usando lapply
lapply(alumnos, function(x) length(x))
