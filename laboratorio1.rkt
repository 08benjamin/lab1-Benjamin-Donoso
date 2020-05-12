#lang racket
(require "TDA.rkt")
;(define (zonas 

;(define (commit info)
;  (

;entrada un string con el comando a ejecutar
;salida un booleano verificando la accion
;funcion identificadora de comandos git
(define (git comando info)
  (define comparador (string-append comando))
  (if (string=? comparador "pull")
      #t
      (if (string=? comparador "add")
          #t
          (if (string=? comparador commit)
              (commit info)
              (if (string=? comparador "push")
                  #t
                  (display "no se pudo ejecutar el comando")
              )
          )
      )
  )
 #f
)



       
  