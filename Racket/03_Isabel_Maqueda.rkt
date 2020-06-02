#|
Isabel Maqueda Rolon 
A01652906
13/03/2020
|#

#lang racket 
(define (leap? year)
  (if (zero? (modulo year 4))
    (if (zero? ( modulo year 100))
      (if (zero? (modulo year 400))
        #t ; Divisible by 400
        #f) ; Divisible by 100
      #t) ; Divisible by 4
    #f)); Not divisible by 4

(define (next_day date)
    (let* ([day (first date)] ; gets the day
            [month (second date)] ; gets the month
            [year (third date)]); gets the date 
            (add1 day)

            (define lastday 1) ; last day of the month
            
            (if  (or (equal? month 4)(equal? month 6)(equal? month 9)(equal? month 11)) ; checks the last day of the month 
                [lastday 30]
                (if (equal? month 2) ; chekcs if moth is 2
                    (if (leap? year) ; cheks if its a leap year
                        [lastday 29]
                        [lastday 28])
                        #f)
            )

            (if (> day lastday) ; checks if the day is the last one of the month 
                (begin
                    [day 1]
                    (add1 month)

                    (if (> month 12) ; checks if the month is the last one of the year
                        (begin
                            [month 1]
                            (add1 year))
                        (list (day month year)))) ; prints the modified date
                    (list (day month year))); prints the modified date

))



            