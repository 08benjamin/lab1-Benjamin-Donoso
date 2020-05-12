#lang racket
;definiciones de tda para la estructuracion del programa

;tda
(define (archivo nombre)
  (if (string? nombre)
      (list nombre)
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
(define (commit info)
  
  (define local_repository (list info))
  (define zonas (list workplace index local_repository remote_repository))
  zonas)

(define (string-tail string start)
  (substring string start (string-length string)))


;se hace uso de la funcion provide para utilizar los tdas en el main
(provide string-tail)
(provide commit)
(provide zonas)
(provide index)
(provide workplace)
(provide local_repository)
(provide remote_repository)
(provide archivo)