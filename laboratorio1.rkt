#lang racket
(require "TDA.rkt")
;(define (zonas 

;(define (commit info)
;  (

;entrada un string con el comando a ejecutar
;salida un booleano verificando la accion
;funcion identificadora de comandos git
(define git(lambda(comando)(lambda(info) (lambda (zonasDeTrabajo)
                                           (if (= (largo-lista zonasDeTrabajo) 4)
                                               (if(procedure? comando)
                                                  (if (compPull comando)
                                                      (pull zonasDeTrabajo)
                                                      (if (compAdd comando)
                                                          ((add info)zonasDeTrabajo)
                                                          (if (compCommit comando)
                                                              ((commit info)zonasDeTrabajo)
                                                              (if (compPush comando)
                                                                  (push zonasDeTrabajo)
                          
                                                                  (display "funcion invalida")
                                                              )
                                                          )
                                                      )
                                                  )
                                                  (display "comando invalido")
                                               )
                                           (display "formato de zonas invalido")   
                                           )
                                        )
                           )
            )
)

(define z1 '("xdsup" '() "dasdad" '()))
(define z2 '("xd" "xd" "dasdad" '())) 

    


  
  


       
  