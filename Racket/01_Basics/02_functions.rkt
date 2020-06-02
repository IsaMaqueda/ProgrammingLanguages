#|
    Defining a few functions

    Gilberto Echeverria
    28/02/2020
|#

#lang racket

; No arguments required here
(define (get-pi)
    (* 4 (atan 1)))

(define (F->C temp)
    (* (- temp 32) 5/9))

(define (C->F temp)
    (+ (* temp 9/5) 32))

; Functions to get the area of a triangle
; s = (a + b + c) / 2
; area = sqrt( s (s-a) (s-b) (s-c) )
(define (get-s a b c)
    (/ (+ a b c) 2))

(define (area a b c)
    (sqrt (* (get-s a b c)
             (- (get-s a b c) a)
             (- (get-s a b c) b)
             (- (get-s a b c) c))))
