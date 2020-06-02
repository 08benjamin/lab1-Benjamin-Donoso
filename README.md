# lab1-Benjamin-Donoso 19.780.146-8

instrucciones de uso:

bienvenido para que usted pueda usar este código sin problemas le recomiendo que tome en consideración la sintaxis siguiente.
Usted va a usar o está usando una representación del sistema de git que identifica y almacena los cambios de código, en esta representación solo se entregara unos “archivo-prueba.rkt” en el formato texto.

Para hacer uso de esta representación usted debe escribir las funciones en consola de la siguiente manera.
(((git función) información) zonas)

Las funciones que usted tiene a disposición son “push”, “pull”, “add”, “commit”, “zonas-string”, “git”
Push moverá todo lo nuevo que posee en workplace a index con la siguiente representación que rige este código “zonas : (workplace index local remote)”
(((git push)” origin master”) zonas)

Usted pudiera tener su zona (“archivos” ‘() “archivo3” “proyecto”)
Debería mover todo lo nuevo de la primera segunda a la tercera

Pull moverá todo lo nuevo que posee en remote a workplace con la siguiente representación que rige este código.
(((git pull)” origin master”) zonas)
Debería mover todo lo nuevo de la cuarta a la primera

add moverá todo lo nuevo que posee en index a local con la siguiente representación que rige este código.
(((git add) ‘(“archivo1” “archivo2” “archivo1000”)) zonas)  
O también puede usar
(((git add) (list “archivo1” “archivo2” “archivo1000”)) zonas)
Debería mover todo lo nuevo de la primera a la segunda

commit moverá todo lo nuevo que posee en remote a workplace y añadera un comentario al final del string con la siguiente representación que rige este código.
(((git commit)” tercer commit”) zonas)

La última función le mostrara a usted el contenido de cada zona
(zonas->string zona)

Imagine que esta es su zona: (“archivos” ‘() “archivo3” “proyecto”)
Le mostrara:

Workplace:
Archivos
Index:

Local repository:
Archivo3
Remote Repository:
proyecto
