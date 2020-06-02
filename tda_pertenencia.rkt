#lang racket
(require "Funciones.rkt")
(require "tda_modificadores.rkt")

;funcion la cual identifica si el elemento de la lista es nulo segun su posicion
;entrada lista y poscion entero
;salida booleano verificacion
(define (nulo lista posicion)
  (if (= 0 posicion)
      (if (list? (car lista))
          (if (= (largo-lista (car lista)) 2)
          
              (if (not(null? (car lista)))
                  (if (null? (cadr (car lista)))
                      #t
                      #f
                  )
                  #f
              )
              #f
          )
          #f
      )
      (nulo (cdr lista) (- posicion 1))
  )
)
;funcion vericadora la cual se encarga en identificar similitudes en las zonas de trabajo para poder agregar cambios en estas
;entrada zonas lista de string
;salida booleano t o f comprobando si existen similitudes en los strings 
(define (comparacion-informacion zonas texto posicion)
  ;se verifica si la informacion proporcionada es un string para poder realizar la comparacion con los strings que conforman la lista zonas
  (if (string? texto)
      ;de igual forma se pregunta si la zona que se va a comparar posee strings si no no se necesita comparar
      (if (string? (buscar zonas posicion))
          ;la funcion de racket regexp-match comprueba si se poseen strings similares en ambos y si se cumple la condicion entrega una lista con los strings repetidos
          (if (list? (regexp-match texto (buscar zonas posicion)))
              ;a esta funcion se le entrega la informacion a comparar y la contenido "string" segun la posicion en la lista zonas '(workplace index local remote)
              #f
              #t
          )
      #t
      )
  #f
  )
)
;funcion la cual compara si la zona otorgada posee el string texto
;entrada una lista "zonas" texto a comparar y la posicion de zona que se analizara
;salida un booleano verificador si esta o no presente el string en la zona
(define (encontrar-igual zonas texto posicion)
  ;se verifica si la informacion proporcionada es un string para poder realizar la comparacion con los strings que conforman la lista zonas
  (if (string? texto)
      ;de igual forma se pregunta si la zona que se va a comparar posee strings si no no se necesita comparar
      (if (string? (buscar zonas posicion))
          ;la funcion de racket regexp-match comprueba si se poseen strings similares en ambos y si se cumple la condicion entrega una lista con los strings repetidos
          (if (list? (regexp-match texto (buscar zonas posicion)))
              ;a esta funcion se le entrega la informacion a comparar y la contenido "string" segun la posicion en la lista zonas '(workplace index local remote)
              #t
              #f
          )
      #t
      )
  #f
  )
)

;tda verificador
;recursion natural
;funcion la cual verifica si las zonas introducidas cumplen con las sintaxis pre-establecida
;entrada una zona la cual esta representada por listas de listas
;salida booleano para poder comprobar si cumple con la estructura establecida
(define (verificar-zonas lista)
  ;primero verifica si se le entraga un elemento nulo
  (if (not(null? lista))
      ;como se esta trabajando con listas se pregunta por si es un lista
      (if (list? lista)
          ;se pregunta si la listas posee strings o lista si no no se acepta el formato
          (if (not(string? (car lista)))
              (if (list? (car lista))
                  (cons (car lista) (verificar-zonas (cdr lista)))
                  #f
              )
              (cons (car lista) (verificar-zonas (cdr lista)))
          )
      #f
      )
  lista    
  )
)

;se crea una funcion la cual muestrar el contenido se la zona segun su posicion por cada espacio de trabajo
(define (mostrar-workplace zonas)
  (if (or (nulo zonas 0)  (null? (buscar zonas 0)))
      (display "\n\nWorkplace:\n\n")       ;como el contenido de las zonas es un string se procede a transformar a lista para poder separar sus elementos y a ordenarlos
      (display (string-append "\n\nWorkplace:\n\n" (mostrar-contenido (string-split (buscar zonas 0) " "))))
  )
)

(define (mostrar-index zonas)
  (if (or (nulo zonas 1)  (null? (buscar zonas 1)))
      (display "\n\nIndex:\n\n") 
      (display (string-append "\n\nIndex:\n\n" (mostrar-contenido (string-split (buscar zonas 1) " "))))
  )
)

(define (mostrar-local zonas)
  (if (or (nulo zonas 2)  (null? (buscar zonas 2)))
      (display "\n\nLocal Repository:\n\n")
      (display (string-append "\n\nLocal Repository:\n\n" (mostrar-contenido (string-split (buscar zonas 2) " "))))
  )
)

(define (mostrar-remote zonas)
  (if (or (nulo zonas 3)  (null? (buscar zonas 3)))
      (display "\n\nRemote Repository\n\n")
      (display (string-append "\n\nRemote Repository:\n\n" (mostrar-contenido (string-split (buscar zonas 3) " "))))
  )
)

(define l1 (list "archivo1 contenido1 archivo2 contenido2" null "archivo1" null))  
(provide nulo)
(provide encontrar-igual)
(provide comparacion-informacion)
(provide verificar-zonas)
(provide mostrar-workplace)
(provide mostrar-remote)
(provide mostrar-local)
(provide mostrar-index)