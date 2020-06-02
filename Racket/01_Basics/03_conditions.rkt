#|
    Testing the conditionals in Racket

    Gilberto Echeverria
    03/03/2020
|#

#lang racket

(define (compare a b)
    (if (< a b)
        ; true
        (printf "~a is smaller" a)
        ; false
        (begin  ; Use the begin instruction to group multiple actions where there should only be one
            (printf "~a is larger" a)
            (printf " or ~a is equal" a))))

(define (average a b c)
    (/ (+ a b c) 3))

(define (evaluate-grade a b c)
    (if (>= (average a b c) 70)
        ; true
        (printf "Pass")
        ; false
        (printf "Fail")))

; Determining if a year is leap
; Using nested if's
(define (leap? year)
    (if (zero? (modulo year 4))
        (if (zero? (modulo year 100))
            (if (zero? (modulo year 400))
                #t  ; Divisible by 400
                #f) ; Divisible by 100
            #t) ; Divisible by 4
        #f))    ; Not divisible by 4

; A single if with logical operators
(define (is-leap? year)
    (if (and
            (zero? (modulo year 4))
            (or
                (not (zero? (modulo year 100)))
                (zero? (modulo year 400))))
        #t
        #f))


; How to create a list from a series of items
(define (create-list a b)
    (list a b))
    ;(list (+ a b) (- a b)))

; Function to find the largest of 3 numbers
(define (largest-of-3 n1 n2 n3)
    (if (>= n1 n2)
        (if (>= n1 n3)
            n1
            n3)
        (if (>= n2 n3)
            n2
            n3)))

; Function to demonstrate the use of 'case'
(define (opera operation a b)
    (case operation
        [("suma" "add") (+ a b)]
        [("resta" "subtract") (- a b)]
        [("multiplica" "multiply") (* a b)]
        [("divide") (/ a b)]
        [else (begin
                (display "INVALID OPERATION\n")
                0)]))

(define (f x)
    (cond
        [(< x -1) (+ x 2)]
        [(and (<= -1 x) (< x 0)) 1]
        [(>= x 0) (+ (- (* x x)) 1)]))

(define (quadratic a b c)
    (if (zero? a)
        ; true
        (list (- (/ c b)))
        ; false
        (let*
            ([d (- (* b b) (* 4 a c))]
             [2a (* a 2)]
             [root-d (sqrt d)])
            (list (/ (+ (- b) root-d) 2a) (/ (- (- b) root-d) 2a)))))
