#lang racket
(require "tda_pertenencia.rkt")
;tda que representa la creacion de un archivo
;entrada un string que espacifica el nombre del archivo
;salida una lista con el nombre y contenido
(define (verificar-archivo contenido nombre)
  ;verifica si se le ingraso un archivo permitido o no
  (if (and ((string? nombre) (string? contenido)))
      (list nombre contenido)
  #f
  )
)


;funcion la cual compara string por string de una lista
;entrada lista con strings
;salida lista con elementos no repetidos
(define (comparar-lista zonas lista posicion construccion-string)
  ;se pregunta si se llego al final de la lista
  (if (null? lista)                                                                                                                                                       ;    0        1     2      3
      ;si es asi se devuelve construccion-string el cual es un string separado por espacios el cual posee todos los string que no se repiten en la zona segun su posicion '(workplace index local remote)
      construccion-string
      ;se pregunta el elemento con el cual se va a comparar es una lista devido a que la funcion lista esta diseñada para comparar listas de strings
      (if (list? lista)
          ;se verifica si el elemento a comparar es un string si no se ignora
          (if (string? (car lista))
              ;de la misma forma se pregunta si el string de la lista ya se encuentra en una zona de trabajo
              (if (comparacion-informacion zonas (car lista) posicion)
                  ;si no se encuentra se procede a agregar lo a la composicion de strings
                  (comparar-lista zonas (cdr lista) posicion (string-append construccion-string " " (car lista)))
                  ;en caso contrario se ignora
                  (comparar-lista zonas (cdr lista) posicion construccion-string)
              )
          construccion-string
          )
      construccion-string
      )
  )
)

;funcion opuesta a su contraparte esta funcion se encarga de ver su un elemento coincide
;entrada lista entero string
;salida string que coinciden
(define (comparar-list-esta zonas lista posicion construccion-string)
  ;se pregunta si se llego al final de la lista
  (if (null? lista)                                                                                                                                                       ;    0        1     2      3
      ;si es asi se devuelve construccion-string el cual es un string separado por espacios el cual posee todos los string que no se repiten en la zona segun su posicion '(workplace index local remote)
      construccion-string
      ;se pregunta el elemento con el cual se va a comparar es una lista devido a que la funcion lista esta diseñada para comparar listas de strings
      (if (list? lista)
          ;se verifica si el elemento a comparar es un string si no se ignora
          (if (string? (car lista))
              ;de la misma forma se pregunta si el string de la lista ya se encuentra en una zona de trabajo
              (if (encontrar-igual zonas (car lista) posicion)
                  ;si se encuentra se procede a agregar lo a la composicion de strings
                  (comparar-list-esta zonas (cdr lista) posicion (string-append construccion-string " " (car lista)))
                  ;en caso contrario se ignora
                  (comparar-list-esta zonas (cdr lista) posicion construccion-string)
              )
          construccion-string
          )
      construccion-string
      )
  )
)
(define (comparar-lista-esta zonas lista posicion)
  (comparar-list-esta zonas lista posicion "")
)
;se encapzula la funcion para definir el la composicion de strings como un string vacio de forma que si no posee ningun string nuevo se añade un "" el cual no afecta a strings normales
(define (comparar-listas zonas lista posicion)
  (comparar-lista zonas lista posicion "")
)

(provide verificar-archivo)
(provide comparar-listas)
(provide comparar-lista-esta)