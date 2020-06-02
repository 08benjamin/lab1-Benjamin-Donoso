#lang racket

(require "tda_representaciones.rkt")
(require "tda_pertenencia.rkt")
(require "Funciones.rkt")
(require "tda_modificadores.rkt")
(require "tda_constructores.rkt")
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


;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define push(lambda(zona)
              (if (and (not(nulo zona 2)) (not (null? (buscar zona 2))))
                  ;se modifica la posicion 3 "remote" con modificar lista y se procede a extraer la la info "string" de la zona local y se hace lista de string separando con parentesis para poder usar la funcion comparar listas
                  (modificar-lista zona 3 (comparar-listas zona (string-split (buscar zona 2) " ") 3))
                  zona
              )
              
            )
)


;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define pull(lambda(zona)
             (if (and (not(nulo zona 3)) (not (null? (buscar zona 3))))
                 ;se modifica la posicion 0 workplace con modificar lista y se procede a extraer la la info "string" de la zona remote y se hace lista de string separando con parentesis para poder usar la funcion comparar listas
                 (modificar-lista zona 0 (comparar-listas zona (string-split (buscar zona 3) " ") 0))
                 zona
              )
                  
            )
)


;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el add añadido
;funcion add
(define add(lambda(info)(lambda(zona)
                          ;se usa la funcion lista-con-string para verificar si la lista que se entrego posee strings
                          (if (and (not(null? (lista-con-string info))) (not (null? (buscar zona 0))))
                              ;si es asi se procede a modificar la lista segun los elementos dados que no se repitan
                                      (modificar-lista zona 1 (comparar-listas zona (string-split (comparar-lista-esta zona info 0) " ") 1))
                                      ;si no se le entrego una lista de strings no se modifican las zonas
                                      zona
                          )
                  
                        )
                                   
           )
   
)

;(define zonas (list workplace index local_repository remote_repository))
;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el commit añadido
;funcion commit 
(define commit(lambda(info)(lambda(zona)
                             ;primero se pregunta si el commit entregado es un string
                             (if (and (and (string? info)  (not(nulo zona 1))) (not (null? (buscar zona 1))))
                                 ;si es se procede a modificar la posicon 2 de la lista "add" usando la funcion eliminar para vaciar el index y se compara la informacion que posee index y local repository
                                 ;para añadir solamente los archivos nuevos a local
                                      (eliminar (modificar-lista zona 2 (string-append (comparar-listas zona (string-split (buscar zona 1) " ") 2) " " info)) 1)
                                      ;si no se le entrego un string a commit este no modificara las zonas de trabajo
                                      zona
                             )
                  
                           )
                                   
              )                            
)

;funcion la cual muestra por consola las zonas de trabajo
;entrada un lista "zonas"
;salida contenido por consola
(define (zonas->string zonas)
  (mostrar-workplace zonas)
  (mostrar-index zonas)
  (mostrar-local zonas)
  (mostrar-remote zonas)
)
  
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
;tda de pertenencia de comandos git
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

(define zona (list workplace "archivo2 contenido2" "archivo1" "archivo1 archivo2"))

;;---------------------------------------------------------------
;ejemplos de uso
;por favor ingresar de esta forma las funciones en la consola
;commit
;entregara la lista modificada
;(((git commit)"mi comentario")zonas)
;se procede a guardar la modificacion de zonas
;(define zona2 (((git commit)"actualizando codigo")zona)
;(define zona3 (((git commit)"ultimo actualizacion del programa")zona2)

;pull
;entregara la lista modificada
;(((git pull)"origin master")zonas)
;se procede a guardar la modificacion de zonas
;(define zona2 (((git pull)"origin master")zona)
;(define zona3 (((git pull)"origin master")zona2)

;push
;entregara la lista modificada
;(((git push)"origin master")zonas)
;se procede a guardar la modificacion de zonas
;(define zona2 (((git push)"origin master")zona)
;(define zona3 (((git push)"origin master")zona2)

;add
;entregara la lista modificada
;(((git push)"origin master")zonas)
;se procede a guardar la modificacion de zonas
;(define zona2 (((git push)"origin master")zona)
;(define zona3 (((git push)"origin master")zona2)

;zonas->string
;(zonas->string zonas)
;(zonas->string zona100)
;(zonas->string zona150)

