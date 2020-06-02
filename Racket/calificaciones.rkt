#| Funcion que recibe 3 calificaciones y te dice "aprobado" o "reprobado " si el promedio es >70
isabel Maqueda Rolon 
|#
#lang racket
;
(define (promedio a b c)
    (define v (+ a b c))
    (if (> v 70)
    ; true
    (printf "aprobado")
    ; false
    (printf "reprobado")
    )

)