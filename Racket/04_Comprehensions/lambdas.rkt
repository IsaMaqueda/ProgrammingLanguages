#|
    Examples of using lambda functions

    Gilberto Echeverria
    27/03/2020
|#

#lang racket


(define (get-perimeters circles)
    ;(map (λ (r) (* pi r 2)) circles))
    (map (lambda (r) (* pi r 2)) circles))

#|
(define (next-day date)
    (if (equal? (car date) ((lambda (m) (
                              (case m
                                [(1 3 5 8 10 12) 31]
                                [(4 7 9 11) 30]
                                [(2) (if (year? y) 29 28)] )) (cadr date))))
        #t
        #f))
 |#   
