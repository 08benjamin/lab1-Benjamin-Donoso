#lang racket

(require "tda_modificadores.rkt")



;recursion natural
;funcion la cual comprueba si los elementos dentro de una lista son strings
;entrada una lista de elementos entero string etc
;salida un booleano verificador
;esta funcion permite filtrar y crear una lista de solo strings
(define (lista-con-string lista)
  ;se aplica la condicion null? a la lista para comprobar si se llego al final de estas
  (if (null? lista)
      lista
      ;se pregunta si el elemento de la lista es un string para poder crear un lista con solo strings
      (if (string? (car lista))
          ;se procede a crear una lista de string
          (cons (car lista) (lista-con-string (cdr lista)))
          ;en caso contrario se ignora el elemento de la lista
          (lista-con-string (cdr lista))
      )
  )
)

;recursion de colar
;funcion verificadora la cual entrega el largo de una listas
;entrada lista
;salida un entero num que indica el largo de la lista
(define (len-lista lista largo)
  (if (null? lista)
      largo
      (len-lista (cdr lista) (+ 1 largo))
  )
)

;se encapzula la funcion para obviar el caso base
(define (largo-lista lista)
  (len-lista lista 0)
)

;recursion de cola
;creacion de funcion la cual puede obtener un elemento de una lista de elementos segun la posicion dada
;entrada una lista de elementos y un entero que simboliza la posicion
;salida un elemento lista o string
(define (buscar lista posicion)
  ;segun la posicion dada esta funcion ira comprobando si se llego si no se le ira restando a la posicion y pasando al siguiente elemento de la lista
      (if  (= 0  posicion)
          (car lista)
          (buscar (cdr lista) (- posicion 1))
      )
  
)






(provide lista-con-string)
(provide largo-lista)
(provide buscar)
