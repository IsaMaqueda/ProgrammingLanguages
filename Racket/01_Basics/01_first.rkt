#|
    This is a multi line comment
    As usual, it should describe what this program does,
    and who created it

    Gilberto Echeverria
    25/02/2020
|#

; This is a single line comment

; Load the basic set of functions for Racket
#lang racket

; A simple operation
(+ 6 2 8)

; A bit more complex
(/ (+ 7 4) (- 9 3 1))

; Evaluating the value of pi
(equal? (* (atan 1) 4) pi)
