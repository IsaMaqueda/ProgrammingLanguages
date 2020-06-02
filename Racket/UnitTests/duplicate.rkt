#|
    Function to duplicate all elements in a list

    Gilberto Echeverria
    17/03/2020
|#

#lang racket

(define (duplicate data)
    (if (empty? data)
        empty
        (append
            (list (car data) (car data))
            (duplicate (cdr data)))))
