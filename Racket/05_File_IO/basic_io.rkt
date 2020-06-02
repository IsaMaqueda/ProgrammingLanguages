#|
    Simple functions to read and write from files

    Gilberto Echeverria
    31/03/2020
|#

#lang racket

; Write 10 lines of numbers into a file
; The single argument is an output port
(define (print-lines out)
    (let loop
        ([n 1])
        (if (> n 10)
            (display "Finished")
            (begin
                (displayln n out)
                (loop (add1 n))))))

; Read several lines from a file
; The single argument is an input port
(define (multi-read in)
    (define line (read-line in))
    (if (eof-object? line)
        (display "Finished reading")
        (begin
            (displayln line)
            (multi-read in))))

#|
; Open a file to read, the function returns an output port
(define out (open-output-file "test.txt" #:exists 'truncate))
;(display "Text that goes in the file" out)
; Call a function to print several lines to the file
(print-lines out)
(close-output-port out)

(define in (open-input-file "test.txt"))
;(display (read-line in))
(multi-read in)
(close-input-port in)
|#

; High level functions that open and close the file
; A function is called to do all necessary operations on the file
(call-with-output-file "test.txt" #:exists 'truncate
    print-lines)

(call-with-input-file "test.txt" multi-read)
