#lang racket
;definiciones de tda para la estructuracion del programa

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

;se generan las zonas de trabajo para poder almacenar commits, estados, etc.
;para la realizacion de este laboratorio las lista zonas estara compuesta de de listas vacias las cuales seran remplazadas por string para simular el funcionamiento de git
(define workplace (list ))
(define index (list ))
(define local_repository (list ))
(define remote_repository (list ))
;las zonas contendran todos los espacios de trabajo para su manipulacion
(define zonas (list workplace index local_repository remote_repository))


;funcion vericadora la cual se encarga en identificar similitudes en las zonas de trabajo para poder agregar cambios en estas
;entrada zonas lista de string
;salida booleano t o f comprobando si existen similitudes en los strings 
(define (comparacion-informacion zonas texto posicion)
  (if (string? texto)
      (if (list? (regexp-match texto (buscar zonas posicion)))
          #t
          #f
      )
  #f
  )
)

;tda que representa la creacion de un archivo
;entrada un string que espacifica el nombre del archivo
;salida una lista con el nombre y contenido
(define (verificar-archivo contenido nombre)
  ;verifica si se le ingraso un archivo permitido o no
  (if (and ((string? nombre) (string? contenido)))
      (list nombre contenido)
  #f
  )
)



;creacion de funcion la cual puede obtener un elemento de una lista de elementos segun la posicion dada
;entrada una lista de elementos y un entero que simboliza la posicion
;salida un elemento lista o string
(define (buscar lista posicion)
  
      (if  (= 0  posicion)
          (car lista)
          (buscar (cdr lista) (- posicion 1))
      )
  
)

;(define zonas (list workplace index local_repository remote_repository))
;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el commit añadido
;funcion commit 
(define commit(lambda(info)(lambda(zona)
                             (if (comparacion-informacion zonas info 2)
                                 (if (not(list? (buscar zona 1)))
                                     (if (string? (buscar zona 1))
                                         (modificar-lista zona 2 (buscar zona 1))
                                         (display "no posee informacion en el index")
                                     )
                                 (display "no posee informacion en el index")
                                 )
                             zona
                             )
                           )
             )
)


;tda modicador de zonas
;entrada lista la posicion a modificar y la info por la cual se modifica la lista
;salida lista modificada nueva zona
(define (modificar-lista lista posicion info)
  (if (null? lista)
    lista
    (cons
     (if (= 0 posicion)
         info
         (car lista))
     (modificar-lista (cdr lista) (- posicion 1) info))))

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el add añadido
;funcion add
(define add(lambda(info)(lambda(zona)
                          (if (comparacion-informacion zonas info 1)
                              (if (not(list? (buscar zona 0)))
                                  (if (string? (buscar zona 0))
                                      (modificar-lista zona 1 (buscar zona 0))
                                      (display "no posee informacion en el workplace")
                                  )
                                  (display "no posee informacion en el workplace")
                              )
                          zona    
                          )
                        )
           )
)
                                     
(define z1 '("xdsup" '() "dasdad" '()))                              


;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define pull(lambda(info)(lambda(zona)
                             (if (not(list? (buscar zona 3)))
                                 (if (string? (buscar zona 3))
                                     (modificar-lista zona 0 (buscar zona 3))
                                     (display "no posee informacion en el remote repository")
                                 )
                             (display "no posee informacion en el remote repository")
                             )
                        
                         )
           )
)


;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define push(lambda(info)(lambda(zona)
                           (if (comparacion-informacion zonas info 3)
                               (if (not(list? (buscar zona 2)))
                                   (if (string? (buscar zona 2))
                                       (modificar-lista zona 3 (buscar zona 2))
                                       (display "no posee informacion en el remote repository")
                                   )
                                   (display "no posee informacion en el remote repository")
                               )
                               zona
                           )
                         )
              
            )
)



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
  (if (not(null? lista))
      ;como se esta trabajando con listas se pregunta por si es un lista
      (if (list? lista)
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
(provide verificar-archivo)
(provide buscar)