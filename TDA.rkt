#lang racket
;definiciones de tda para la estructuracion del programa

;tda que representa la creacion de un archivo
;entrada un string que espacifica el nombre del archivo
;salida una lista con el nombre y contenido
(define (archivo contenido nombre)
  (if (and ((string? nombre) (string? contenido)))
      (list nombre contenido)
  #f
  ) 
)

;entrada nula
;salidas una lista de listas vacias 
;tda contructor
;se generan las zonas de trabajo para poder almacenar commits, estados, etc.
(define workplace (list ))
(define index (list ))
(define local_repository (list ))
(define remote_repository (list ))
;las zonas contendran todos los espacios de trabajo para su manipulacion
(define zonas (list workplace index local_repository remote_repository))


;definicion de un selector para poder saber que estado se va a modificar
;(define (buscarCommit lista)
;  (if (list? lista)
 ;        (car lista)
  ;        (buscarCommit (cdt lista))
   ;   )
;  #f
;  )
;)

;entrada la informacion a cambiar
;salida lista de las zonas de trabajo con el commit añadido
;funcion commit 
(define commi(lambda(info)(lambda(zonas)
                              (define local_repository index)
                              (define zonas (list workplace index local_repository remote_repository))
                             zonas)
             )
)
(define commit(lambda(info)
                ((commi info)zonas)))

(define (add info)
  
  (display "add"))

(define (pull info)
  
  (display "pull"))

(define (push info)

  (display "push"))

;funcion la cual se encarga de mantener los cambios de las zonas de trabajo
;(define cambio(funcion zonas cambio)
 ; (

(define (string-tail string start)
  (substring string start (string-length string)))

;entrada una funcion
;salida un booleano confirmando si es la funcion
;identificadores de comandos git
(define (compCommit comando)
  (if (eqv? comando commit)
      #t
      #f))
;entrada una funcion
;salida un booleano confirmando si es la funcion
;identificadores de comandos git
(define (compPush comando)
  (if (eqv? comando push)
      #t
      #f))
;entrada una funcion
;salida un booleano confirmando si es la funcion
;identificadores de comandos git
(define (compPull comando)
  (if (eqv? comando pull)
      #t
      #f))
;entrada una funcion
;salida un booleano confirmando si es la funcion
;identificadores de comandos git
(define (compAdd comando)
  (if (eqv? comando add)
      #t
      #f))

;se hace uso de la funcion provide para utilizar los tdas en el main

(provide compAdd)
(provide compPush)
(provide compPull)
(provide compCommit)
(provide add)
(provide pull)
(provide push)
(provide string-tail)
(provide commit)
(provide zonas)
(provide index)
(provide workplace)
(provide local_repository)
(provide remote_repository)
(provide archivo)