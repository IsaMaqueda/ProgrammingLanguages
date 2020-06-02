#|
    Isabel Maqueda Rolon 
    A01652906
    06/02/2020
|#

#lang racket

(define (quadratic a b c) ; defines the function
    (if (= a 0)
        (begin
            (list (- (/ c b)))
        ); if A = 0, 
        (begin; starts the else 
        (list ( / (+ (- 0 b) ( sqrt (- (expt b 2) (* 4 a c)))) (* 2 a))) ; formula for quadratoc ecuation
        (list ( / (- (- 0 b) ( sqrt (- (expt b 2) (* 4 a c)))) (* 2 a))); formula for cuadratic ecuation
        )
    ))
