#lang racket
(require "tda_pertenencia.rkt")
(require "Funciones.rkt")
;definiciones de tda para la estructuracion del programa

;entrada nula
;salidas una lista de listas vacias 
;tda contructor


;se generan las zonas de trabajo para poder almacenar commits, estados, etc.
;para la realizacion de este laboratorio las lista zonas estara compuesta de de listas vacias o string vacio "" los cuales seran remplazados por string para simular el funcionamiento de git
(define workplace (list ))
(define index (list ))
(define local_repository (list ))
(define remote_repository (list ))
;las zonas contendran todos los espacios de trabajo para su manipulacion
;esta representacion se hara de una lista de 4 elementos los cuales seran strings y se modificaran segun los comandos add push pull commit
(define zonas (list (cons "workplace" workplace) (cons "index" index) (cons "local repository" local_repository) (cons "remote repository" remote_repository)))

(define zo (list '("archivo1.rkt contenido1" "archivo2.rkt contenido2") '("archivo1.rkt contenido1") local_repository remote_repository))



(define (buscar-zona lista zona-trabajo)
  (if (string=? (car (car lista)) zona-trabajo)
      (car lista)
      (buscar-zona (cdr lista) zona-trabajo)
  )
)


(define (string-tail string start)
  (substring string start (string-length string)))





               
  
(define l1 (list "archivo1 contenido1 archivo2 contenido2" "archivo1 contenido1" "archivo1" remote_repository))
;se hace uso de la funcion provide para utilizar los tdas en el main
;con la finalidad de que la funcion git proceda a realizar su trabajo con normalidad se importan todos los tda y funciones extras.
(provide string-tail)
(provide zonas)
(provide index)
(provide workplace)
(provide local_repository)
(provide remote_repository)