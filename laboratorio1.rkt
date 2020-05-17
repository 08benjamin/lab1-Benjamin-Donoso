#lang racket
(require "TDA.rkt")
;(define (zonas 

;(define (commit info)
;  (

;entrada un string con el comando a ejecutar
;salida un booleano verificando la accion
;funcion identificadora de comandos git
(define git(lambda(comando info) (lambda (zonasDeTrabajo)
    (if(procedure? comando)
       (if (compPull comando)
           #t
             (if (compAdd comando)
                  #t
                  (if (compCommit comando)
                      ((commit info)zonasDeTrabajo)
                          (if (compPush comando)
                          #t
                          #f
                      )
                  )
             )
       )
    #f
    )
                                         )
                  )
)

(define z1 '('("xd" "sup") '() '() '()))

  
    
      
  


       
  