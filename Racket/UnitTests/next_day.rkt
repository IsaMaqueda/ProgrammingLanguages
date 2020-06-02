#|
Functions to obtain the next day in the calendar

Start by calling (next-day '(DD MM YYYY))

Gilberto Echeverria
01/09/2019
|#

#lang racket

; Predicate to determine if a year has 366 days
(define (leap? year)
    ; Test for numbers divisible by 4 but not by 100, or also divisible by 400
    (if (and
            (= (remainder year 4) 0)
            (or
                (not (= (remainder year 100) 0))
                (= (remainder year 400) 0)))
        #t
        #f))

; Obtain the number of days in a month
(define (month-days month year)
    (case month
        [(1 3 5 7 8 10 12) 31]
        [(4 6 9 11) 30]
        ; February depends on wheter the year is leap
        [(2) (if (leap? year) 29 28)]))

; Compute the next day from a valid given date as a list
(define (next-day date)
    (let
        ; Extract the components of the date and store in local variables
        (   [day (car date)]
            [month (cadr date)]
            [year (caddr date)])
        ; Test for the last day in the month
        (if (= day (month-days month year))
            ; Check if the month is december
            (if (= month 12)
                (list 1 1 (+ year 1))
                (list 1 (+ month 1) year))
            ; Just add one to the day
            (list (+ day 1) month year))))
