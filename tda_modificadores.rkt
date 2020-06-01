#lang racket

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


(provide mostrar-contenido)
(provide eliminar)
(provide modificar-lista)