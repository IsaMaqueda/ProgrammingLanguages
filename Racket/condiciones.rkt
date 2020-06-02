#|
Testing the conditions in Racket

|#
#lang racket

(define (compare a b)
     (if (< a b)
       ; true
       (printf  "~a is smaller" a)
       ; false
       (begin 
       	    (printf "~a is larger  " a)
      	    (printf "or ~a is equal" a))))

(define (average a b c)
(/ (+ a b c) 3))

(define (evaluate-grade a b c)
  (if (<= (average a b c) 70)
    (printf "Pass")
    (printf "Fail"))
)

(define (leap? year)
  (if (zero? (modulo year 4))
    (if (zero? ( modulo year 100))
      (if (zero? (modulo year 400))
        #t ; Divisible by 400
        #f) ; Divisible by 100
      #t) ; Divisible by 4
    #f)); Not divisible by 4

