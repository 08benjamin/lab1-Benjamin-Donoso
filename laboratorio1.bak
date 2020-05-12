#lang racket
(require "TDA.rkt")
;(define (zonas 

;(define(commit info)

;entrada un string con el comando a ejecutar
;salida un booleano verificando la accion
;funcion identificadora de comandos git
(define (git comando)
    (if(string? comando)
       (if (string=? comando "pull")
           #t
           (if (string=? comando "add")
               #t
               (if (string=? comando "commit")
                   #t
                   (if (string=? comando "push")
                       #t
                       #f
                   )
               )
           )
       )
    #f
    )
)
       
       
  