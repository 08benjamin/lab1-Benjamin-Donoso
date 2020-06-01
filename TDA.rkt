#lang racket
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

;(define (modificar-zona lista posicion informacion-nueva)
 ; (if (null? lista)
  ;    lista
   ;   (cons
    ;   (if (= 0 posicion)
     ;     (bu
      ;    (car lista)
      ; )
       ;(modificar-zona (cdr lista) (- posicion 1) informacion-nueva)
      ;)
  ;)
;)
;(define (arreglar lista info)
;  (if (null? lista)
 ;     (cons
       
  ;     ((if (null? info)
    ;      lista
   ;       (car lista) (arreglar (cdr lista) info))
     ; )
      
      ;)
  ;)

               
;(define (recrear lista)
 ; (if (null? lista)
  ;        lista
   ;       (cons (lista) (car info))
    ;  (cons(car lista) (arreglar lista info))
;(define (modificar-zona lista info)
;  (if (null? lista)
 ;     lista
  ;    (if 
          
      
;funcion verificadora la cual entrega el largo de una listas
;entrada lista
;salida un entero num que indica el largo de la lista
(define (len-lista lista largo)
  (if (null? lista)
      largo
      (len-lista (cdr lista) (+ 1 largo))
  )
)

;se encapzula la funcion para obviar el caso base
(define (largo-lista lista)
  (len-lista lista 0)
)

;funcion la cual identifica si el elemento de la lista es nulo segun su posicion
;entrada lista y poscion entero
;salida booleano verificacion
(define (nulo lista posicion)
  (if (= 0 posicion)
      (if (list? (car lista))
          (if (= (largo-lista (car lista)) 2)
          
              (if (not(null? (car lista)))
                  (if (null? (cadr (car lista)))
                      #t
                      #f
                  )
                  #f
              )
              #f
          )
          #f
      )
      (nulo (cdr lista) (- posicion 1))
  )
)

;funcion vericadora la cual se encarga en identificar similitudes en las zonas de trabajo para poder agregar cambios en estas
;entrada zonas lista de string
;salida booleano t o f comprobando si existen similitudes en los strings 
(define (comparacion-informacion zonas texto posicion)
  ;se verifica si la informacion proporcionada es un string para poder realizar la comparacion con los strings que conforman la lista zonas
  (if (string? texto)
      ;de igual forma se pregunta si la zona que se va a comparar posee strings si no no se necesita comparar
      (if (string? (buscar zonas posicion))
          ;la funcion de racket regexp-match comprueba si se poseen strings similares en ambos y si se cumple la condicion entrega una lista con los strings repetidos
          (if (list? (regexp-match texto (buscar zonas posicion)))
              ;a esta funcion se le entrega la informacion a comparar y la contenido "string" segun la posicion en la lista zonas '(workplace index local remote)
              #f
              #t
          )
      #t
      )
  #f
  )
)
(define (encontrar-igual zonas texto posicion)
  ;se verifica si la informacion proporcionada es un string para poder realizar la comparacion con los strings que conforman la lista zonas
  (if (string? texto)
      ;de igual forma se pregunta si la zona que se va a comparar posee strings si no no se necesita comparar
      (if (string? (buscar zonas posicion))
          ;la funcion de racket regexp-match comprueba si se poseen strings similares en ambos y si se cumple la condicion entrega una lista con los strings repetidos
          (if (list? (regexp-match texto (buscar zonas posicion)))
              ;a esta funcion se le entrega la informacion a comparar y la contenido "string" segun la posicion en la lista zonas '(workplace index local remote)
              #t
              #f
          )
      #t
      )
  #f
  )
)
  
;funcion la cual comprueba si los elementos dentro de una lista son strings
;entrada una lista de elementos entero string etc
;salida un booleano verificador
;esta funcion permite filtrar y crear una lista de solo strings
(define (lista-con-string lista)
  ;se aplica la condicion null? a la lista para comprobar si se llego al final de estas
  (if (null? lista)
      lista
      ;se pregunta si el elemento de la lista es un string para poder crear un lista con solo strings
      (if (string? (car lista))
          ;se procede a crear una lista de string
          (cons (car lista) (lista-con-string (cdr lista)))
          ;en caso contrario se ignora el elemento de la lista
          (lista-con-string (cdr lista))
      )
  )
)

;funcion la cual compara archivos existentes
;entrada lista 
;funcion la cual compara string por string de una lista
;entrada lista con strings
;salida lista con elementos no repetidos
(define (comparar-lista zonas lista posicion construccion-string)
  ;se pregunta si se llego al final de la lista
  (if (null? lista)                                                                                                                                                       ;    0        1     2      3
      ;si es asi se devuelve construccion-string el cual es un string separado por espacios el cual posee todos los string que no se repiten en la zona segun su posicion '(workplace index local remote)
      construccion-string
      ;se pregunta el elemento con el cual se va a comparar es una lista devido a que la funcion lista esta diseñada para comparar listas de strings
      (if (list? lista)
          ;se verifica si el elemento a comparar es un string si no se ignora
          (if (string? (car lista))
              ;de la misma forma se pregunta si el string de la lista ya se encuentra en una zona de trabajo
              (if (comparacion-informacion zonas (car lista) posicion)
                  ;si no se encuentra se procede a agregar lo a la composicion de strings
                  (comparar-lista zonas (cdr lista) posicion (string-append construccion-string " " (car lista)))
                  ;en caso contrario se ignora
                  (comparar-lista zonas (cdr lista) posicion construccion-string)
              )
          construccion-string
          )
      construccion-string
      )
  )
)

;funcion opuesta a su contraparte esta funcion se encarga de ver su un elemento coincide
;entrada lista entero string
;salida string que coinciden
(define (comparar-list-esta zonas lista posicion construccion-string)
  ;se pregunta si se llego al final de la lista
  (if (null? lista)                                                                                                                                                       ;    0        1     2      3
      ;si es asi se devuelve construccion-string el cual es un string separado por espacios el cual posee todos los string que no se repiten en la zona segun su posicion '(workplace index local remote)
      construccion-string
      ;se pregunta el elemento con el cual se va a comparar es una lista devido a que la funcion lista esta diseñada para comparar listas de strings
      (if (list? lista)
          ;se verifica si el elemento a comparar es un string si no se ignora
          (if (string? (car lista))
              ;de la misma forma se pregunta si el string de la lista ya se encuentra en una zona de trabajo
              (if (encontrar-igual zonas (car lista) posicion)
                  ;si se encuentra se procede a agregar lo a la composicion de strings
                  (comparar-list-esta zonas (cdr lista) posicion (string-append construccion-string " " (car lista)))
                  ;en caso contrario se ignora
                  (comparar-list-esta zonas (cdr lista) posicion construccion-string)
              )
          construccion-string
          )
      construccion-string
      )
  )
)
(define (comparar-lista-esta zonas lista posicion)
  (comparar-list-esta zonas lista posicion "")
)
;se encapzula la funcion para definir el la composicion de strings como un string vacio de forma que si no posee ningun string nuevo se añade un "" el cual no afecta a strings normales
(define (comparar-listas zonas lista posicion)
  (comparar-lista zonas lista posicion "")
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
  ;segun la posicion dada esta funcion ira comprobando si se llego si no se le ira restando a la posicion y pasando al siguiente elemento de la lista
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
                             ;primero se pregunta si el commit entregado es un string
                             (if (and (string? info)  (not(nulo zona 1)))
                                 ;si es se procede a modificar la posicon 2 de la lista "add" usando la funcion eliminar para vaciar el index y se compara la informacion que posee index y local repository
                                 ;para añadir solamente los archivos nuevos a local
                                      (eliminar (modificar-lista zona 2 (string-append (comparar-listas zona (string-split (buscar zona 1) " ") 2) " " info)) 1)
                                      ;si no se le entrego un string a commit este no modificara las zonas de trabajo
                                      zona
                             )
                  
                           )
                                   
              )                            
)

;funcion la cual vacia una posicion de una lista
;entrada una lista
;salida una lista con un elemento nulo
(define (eliminar lista posicion)
  ;se verifica si se llego al final de la lista
  (if (null? lista)
      lista
      ;se procede a reconstruir la lista segun la posicion dada si esta no llego a cero se agregaran elementos de la lista
      (cons
       (if (= 0 posicion)
           ;si se llego a la posicion se procedera a eleminar lo que habia en esa posicion
           '()
           (car lista)
       )
       (eliminar (cdr lista) (- posicion 1))
      )
  )
)
          

;tda modicador de zonas
;entrada lista la posicion a modificar y la info por la cual se modifica la lista
;salida lista modificada nueva zona
(define (modificar-lista lista posicion info)
  ;se procede a verificar si se llego al final de la lista
  (if (null? lista)
    lista
    ;si no se reconstruye la lista con una condicion
    (cons
     ;si se llego a la posicion a modificar dada
     (if (= 0 posicion)
         ;se comprueba que la zona a modificar sea un string para poder añadirle la informacion nueva
         (if (string? (car lista))
             (string-append (car lista) info)
             ;si no se procede a remplazar la zona antigua por el string nuevo
             info 
         )
         ;si no se llega a la posicion a modificar se continua añadiendo elementos pertenecientes a la lista
         (car lista))
     (modificar-lista (cdr lista) (- posicion 1) info))))

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el add añadido
;funcion add
(define add(lambda(info)(lambda(zona)
                          ;se usa la funcion lista-con-string para verificar si la lista que se entrego posee strings
                          (if (not(null? (lista-con-string info)))
                              ;si es asi se procede a modificar la lista segun los elementos dados que no se repitan
                                      (modificar-lista zona 1 (comparar-listas zona (string-split (comparar-lista-esta zona info 0) " ") 1))
                                      ;si no se le entrego una lista de strings no se modifican las zonas
                                      zona
                          )
                  
                        )
                                   
           )
                            
)
                        
            

                                      

;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define pull(lambda(zona)
             (if (not(nulo zona 3)) 
                 ;se modifica la posicion 0 workplace con modificar lista y se procede a extraer la la info "string" de la zona remote y se hace lista de string separando con parentesis para poder usar la funcion comparar listas
                 (modificar-lista zona 0 (comparar-listas zona (string-split (buscar zona 3) " ") 0))
                 zona
              )
                  
            )
)

                                   
           
                            



;entrada la informacion a cambiar y zonas
;salida lista de las zonas de trabajo con el pull añadido
;funcion pull
(define push(lambda(zona)
              (if (not(nulo zona 2))
                  ;se modifica la posicion 3 "remote" con modificar lista y se procede a extraer la la info "string" de la zona local y se hace lista de string separando con parentesis para poder usar la funcion comparar listas
                  (modificar-lista zona 3 (comparar-listas zona (string-split (buscar zona 2) " ") 3))
                  zona
              )
              
            )
)
                                   
           
                            





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
          ;se pregunta si la listas posee strings o lista si no no se acepta el formato
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
;funcion la cual convierte los strings perteneciente a zonas a un formato presentable
;se dividen por zonas
;entrada una zona con strings
;salida un string separado de \n
(define (mostrar zonas arrange-string)
  (if (null? zonas)
      arrange-string
      (if (string? (car zonas))
          ;se usa la variable arrange-string para poder almacenar los cambios del string
          (mostrar (cdr zonas) (string-append  arrange-string "\n" (car zonas)"\n" ))
          ""
      )
      
  )
)
;se procede a encapzular la funcion
(define (mostrar-contenido zonas)
  (mostrar zonas "")
)
;se crea una funcion la cual muestrar el contenido se la zona segun su posicion por cada espacio de trabajo
(define (mostrar-workplace zonas)
  (if (nulo zonas 0)
      (display "\n\nWorkplace:\n\n");como el contenido de las zonas es un string se procede a transformar a lista para poder separar sus elementos y a ordenarlos
      (display (string-append "\n\nWorkplace:\n\n" (mostrar-contenido (string-split (buscar zonas 0) " "))))
  )
)

(define (mostrar-index zonas)
  (if (nulo zonas 1)
      (display "\n\nIndex:\n\n") 
      (display (string-append "\n\nIndex:\n\n" (mostrar-contenido (string-split (buscar zonas 1) " "))))
  )
)

(define (mostrar-local zonas)
  (if (nulo zonas 2)
      (display "\n\nLocal Repository:\n\n")
      (display (string-append "\n\nLocal Repository:\n\n" (mostrar-contenido (string-split (buscar zonas 2) " "))))
  )
)

(define (mostrar-remote zonas)
  (if (nulo zonas 3)
      (display "\n\nRemote Repository\n\n")
      (display (string-append "\n\nRemote Repository:\n\n" (mostrar-contenido (string-split (buscar zonas 3) " "))))
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
               
  
(define l1 '("archivo1 contenido1 archivo2 contenido2" "archivo1 contenido1" "nada" '()))
;se hace uso de la funcion provide para utilizar los tdas en el main
;con la finalidad de que la funcion git proceda a realizar su trabajo con normalidad se importan todos los tda y funciones extras.
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
(provide largo-lista)