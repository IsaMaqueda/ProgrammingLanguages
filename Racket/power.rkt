#|
Using recusrion to make power
|#

#lang racket

(define (power a b)
    (if (not (zero? b))
        (* a (power a (- b 1)))
        1
    )
)


; Factorial of a number with Recursion
(define (! a)
    (if (not (eq? 1 a))
    (* a (! (- a 1)))
    1
    )

)

(define (fibo n)
    (if (or (eq? 1 n) (zero? n))
    n
    (+ (fibo(sub1 n)) (fibo(- n 2)))
    )

)