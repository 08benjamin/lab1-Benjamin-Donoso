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
                      (commit info)
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

(define mantener #t)
;(define salir (define mantener #f))

(define (main listaEstados)
  (if (equal? mantener #t)
      (main listaEstados)
      (display "cerrando interfaz git")))

  
    
      
  


       
  