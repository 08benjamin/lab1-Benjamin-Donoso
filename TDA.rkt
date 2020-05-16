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


;definicion de un selector para poder saber que estado se va a modificar
;(define (buscarCommit lista)
;  (if (list? lista)
 ;        (car lista)
  ;        (buscarCommit (cdt lista))
   ;   )
;  #f
;  )
;)


;(define zonas (commit info))
;(define zonas1(commit(info)))

;se generan las zonas de trabajo para poder almacenar commits, estados, etc.
(define workplace (list ))
(define index (list ))
(define local_repository (list ))
(define remote_repository (list ))
;las zonas contendran todos los espacios de trabajo para su manipulacion
(define zonas (list workplace index local_repository remote_repository))

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el commit añadido
;funcion commit 
(define commi(lambda(info)(lambda(zonas)
                              (define local_repository index)
                              (define index (list ))
                              (define zonas (list workplace index local_repository remote_repository))
                             zonas)
             )
)


;encapzulamiento               
(define commit(lambda(info)
                ((commi info)zonas)))
;(define local_repository commit) 

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el add añadido
;funcion add
(define ad(lambda(info)(lambda(zonas)
                         (define index workplace)
                         (define workplace (list ))
                         (define zonas (list workplace index local_repository remote_repository))
                         zonas)
             )
)
;encapzulamiento   
(define add(lambda(info)
                ((add info)zonas)))

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define pul(lambda(info)(lambda(zonas)
                         (define remote_repository local_repository)
                         (define local_repository (list ))
                         (define zonas (list workplace index local_repository remote_repository))
                         zonas)
             )
)

;encapzulamiento 
(define pull(lambda(info)
                ((pul info)zonas)))

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define pus(lambda(info)(lambda(zonas)
                         (define workplace remote_repository)
                         (define zonas (list workplace index local_repository remote_repository))
                         zonas)
             )
)


(define push(lambda(info)
                ((pus info)zonas)))

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
;tda verificador
;funcion la cual verifica si las zonas introducidas cumplen con las sintaxis pre-establecida
;entrada una zona la cual esta representada por listas de listas
;salida booleano para poder comprobar si cumple con la estructura establecida
(define (verificar-zonas lista)
  ;primero verifica si se le entraga un elemento nulo
  (if (not(null? (car lista)))
      ;como se esta trabajando con listas se pregunta por si es un lista
      (if (list? lista)
          (if (string? (car lista))
              (verificar-zonas (cdr lista))
              #f
          )
      #f
      )
  lista    
  )
)

(define l1 '(1 2 3 4))
;se hace uso de la funcion provide para utilizar los tdas en el main
(provide verificar-zonas)
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