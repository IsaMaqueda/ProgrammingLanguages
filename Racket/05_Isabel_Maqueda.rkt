#|
    05 More Recursion
    Homework using Recursion

    Isabel Maqueda Rolon
    A01652906
|#


#lang racket
;A function that receives as arguments an int and a list. It will shift elements from the front of the list to the back if the number is positive. If the number is negative, it moves an item from the back of the list to the front.

;(define (rotate-list time lst) 
; Recieves an int and a list
;    (let loop
;        ([times (cond 
;        ;the number of times given that the function is going to run
        
    ;       [(zero? times) 0] ; if the number of times given is 0
    ;       [(empty? lst) 0] ; if the list is empty, the function will run 0 times
    ;        
    ;       [(positive? times) ] 
    ;       [(negative? times)  (+ ())]
   ;     )]
  ;      [result lst])
        
 ;       )


;)
;A function called deep-reverse that receives as argument a list, which can contain nested lists inside. It will invert the contents of a list. If an element of a list is also a list, that too will be inverted.
(define (deep-reverse lst)
    (let loop
        ([lst lst]
        [result empty])
        
            (if (empty? lst)
                result ; if the list is empty, it returns an empty list
                (loop
                    (cdr lst) ; grabs the last element of the list

                        (if (list? (car lst)) ; checks if element is a list
                            (append (list (deep-reverse (car lst))) result) ; if element is list, calls the function again 
                            (append (list (car lst)) result)))))) ; if element is not a list, it just adds the element and adds it to results 



;A function called decimal->binary that receives as argument a single positive integer. It will return a list of 1's and 0's with the binary representation of the decimal input.
(define (decimal->binary num)
    (let loop
        ([num num]
        [result empty])
        
        (if (zero? num) ; if number is zero, the list remains empty
            result
            (loop ; runs loop if number is other that 0

                (quotient num 2)

                (if (zero? (modulo num 2)) ; checks the result of the division by 2
                    (append (list 0) result) ; if result is 0, then adds a 0 to the result
                    (append (list 1) result)) )))) ; if result is 1, then adds a 1 to the result
