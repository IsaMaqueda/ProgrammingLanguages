#|
    Creation of multiple threads using a generator function

    Gilberto Echeverria
    17/04/2020
|#

#lang racket

; Create a thread and give it a name
(define (make-thread name)
    (thread (lambda ()
        ; The funciton prints 10 messages before finishing
        (let loop
            ([n 1]
             [wait-secs (random 2)])
            (if (> n 10)
                (printf "Thread ~a Finished\n" name)
                (begin
                    (printf "~a Message #~a, waiting ~a\n" name n wait-secs)
                    (sleep wait-secs)
                    (loop (add1 n) (random 2))))))))

(define (main number)
    (displayln "MAIN THREAD START")
    ; Create several threads in one go, storing them in a list
    (define threads (map make-thread (range number)))
    ; Wait until the threads finith their execution before continuing with the main thread
    (for-each thread-wait threads)
    (displayln "MAIN THREAD FINISH"))
