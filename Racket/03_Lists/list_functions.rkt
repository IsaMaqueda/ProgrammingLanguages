#|
    Basic functions on lists
    Recreation of the existing functions in Racket

    Gilberto Echeverria
    13/03/2020
|#

#lang racket

;;; Regular recursion
;(define (len lst)
;    (if (empty? lst)
;        0
;        (+ 1 (len (cdr lst)))))

;;; Tail recursion
;(define (len lst)
;    (len-tail lst 0))
;
;(define (len-tail lst count)
;    (if (empty? lst)
;        count
;        (len-tail (cdr lst) (+ count 1))))

;;; Using an internal (private) function
;(define (len lst)
;    ; Local function for tail recursion
;    (define (len-tail lst count)
;        (if (empty? lst)
;            count
;            (len-tail (cdr lst) (+ count 1))))
;    ; Call the internal function
;    (len-tail lst 0))

;;; Using an internal variable space
(define (len lst)
    (let loop   ; A named variable declaration space
        ([lst lst]
         [count 0])
        (if (empty? lst)
            count
            (loop (cdr lst) (+ count 1)))))
