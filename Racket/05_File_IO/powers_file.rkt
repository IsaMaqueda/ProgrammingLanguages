#|
    Read a text file and write a different one with the contents processed
    Using more advanced file operations

    Gilberto Echeverria
    31/03/2020
|#

#lang racket

; Read all the lines in a file and store them as a list
(define (lines->list in)
    (let loop
        ([result empty])
        (define line (read-line in))
        (if (eof-object? line)
            result
            ; Each line contains a number, so it must be converted
            (loop (append result (list (string->number line)))))))
            ; If the contents of the file are separated by commas
            ;(begin
                ;(define row (string-split (string-trim line) ","))
                ;(loop (append result (list row)))))))


; Write a line into a file, with the powers of 1, 2 and 3 
;  of the input number 'n'
(define (write-3-powers n out)
    (display n out)
    (display " " out)
    (display (* n n) out)
    (display " " out)
    (displayln (* n n n) out))
        
; Read a file with numbers, and output another file with
;  each of the numbers in the input elevated to the powers 1, 2 and 3
; The parameters are the names of the input and output files
(define (make-powers-file in-file out-file)
    (define data (call-with-input-file in-file lines->list))
    ;(display data)
    ; To be able to use 'data', we define a local function using lambda
    (call-with-output-file out-file #:exists 'truncate
        (lambda (out)
            (let loop
                ([data data])
                (if (empty? data)
                    (displayln "Finished")
                    (begin
                        (write-3-powers (car data) out)
                        (loop (cdr data))))))))
