# Clase FUNCIONES
rm(list = ls())
# Genero funciones
# Vamos a definir la primera función para convertir viento en nudos a
# viento en metros por segundo que vamos a llamar nudos_a_ms().
# Sintaxis:
nudos_a_ms <- function(viento) {
  ms <- viento * 0.5144
  return(ms)
}
  
nudos_a_ms(25)

nudos_a_ms(viento = "fuerte") # da error

# Podríamos querer que la función primero revise si el o los elementos
# de entrada cumplen con determinadas condiciones, por ejemplo que
# sea un valor numérico.

nudos_a_ms <- function(viento) {
  if (!is.numeric(viento)) stop("viento no es numérico")
  # Para R >= 4.0
  # stopifnot("No es numerico" = is.numeric(viento))
  # ¿Es de tipo numérico?
  ms <- viento * 0.5144
  return()
}

# Imaginemos que tenemos un data.frame con información de viento
# en nudos a lo largo de un día y necesitamos convertirla a metros por
# segundo, ¿cómo podemos usar las funciones que tenemos?
datos_viento <- data.frame(hora = seq(0, 9), viento = c(21.58, 18.08, 7.19, 7.19, 7.19, 7.19, 7.19, 3.69, 3.69, 7.19))
head(datos_viento)

datos_viento$viento_ms <- nudos_a_ms(datos_viento$viento)
head(datos_viento)

# Argumentos por defecto
# Podríamos querer que la función primero revise si el o los elementos
# de entrada cumplen con determinadas condiciones, por ejemplo que
# sea un valor numérico.
nudos_a_ms <- function(viento, conversion = 0.51) {
  if (!is.numeric(viento)) stop("viento no es numérico")
  ms <- viento * conversion
  return(ms)
}

# Ejercicio: Definir una nueva función que se llame ms_a_nudos()
# que tome el viento en metros por segundos y lo convierta a nudos.
# Pista: ahora tenés que multiplicar por 1.944.

ms_a_nudos <- function(viento) {
  nudos <- viento * 1.944
  return(nudos)
}

# Ejercicio
# Generar una nueva función convertir_viento() que unifique las
# dos funciones anteriores (nudos_a_ms() y ms_a_nudos()).
# La función deberá incluir un argumento unidad que reciba una
# variable caracter que permita al usuario indicar si quiere transformar
# el viento a m/s (“ms”) o nudos (“nudos”).

convertir_viento <- function(viento, unidad) {
  if (unidad == "ms") {
    return(ms_a_nudos(viento))
  } else if (unidad == "nudos") {
    return(nudos_a_ms(viento))
  } else {
    print("viento no es numérico o la unidad no es aceptable")
  }
}

# otra forma de hacerlo, definiendo una salida
convertir_viento2 <- function(viento, unidad) {
  if (unidad == "ms") {
    salida <- ms_a_nudos(viento)
  } else if (unidad == "nudos") {
    salida <- nudos_a_ms(viento)
  } else {
    salida <- NULL
    print("viento no es numérico o la unidad no es aceptable")
  } 
  return(salida)
}  

# Posible solucion del campus
convertir_viento3 <- function(viento, unidad = "ms") {
  if (!(unidad %in% c("ms", "nudos"))) stop("Argumento unidad invalido")
  if (unidad == "nudos") {
    out <- ms_a_nudos(viento)
  } else if (unidad == "ms") {
    out <- nudos_a_ms(viento)
  }
  return(out)
}

