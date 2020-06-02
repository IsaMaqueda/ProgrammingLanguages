#|
    Creation of multiple threads using a generator function
    Sending messages to the threads from the main thread

    Gilberto Echeverria
    17/04/2020
|#

#lang racket

; Create a thread and give it a name
(define (make-thread name)
    (thread (lambda ()
        ; The funciton receives messages until it gets the atom 'end
        (let loop
            ; No arguments in the loop
            ()
            ; Actions in the loop
            ; Get a message
            (define msg (thread-receive))
            (sleep (random 2))
            ; Determine what to do depending on the type of the message
            (cond
                [(equal? msg 'end)
                    (printf "Thread ~a finishing\n" name)]
                [(number? msg)
                    (printf "Thread ~a got number ~a\n" name msg)
                    (loop)]
                [(string? msg)
                    (printf "Thread ~a got string '~a'\n" name msg)
                    (loop)])))))

(define (main number)
    (displayln "MAIN THREAD START")
    ; List of messages to send to the threads
    (define data '("hello" 1 2 3 56 "bye" 'end))
    ; Create several threads in one go, storing them in a list
    (define threads (map make-thread (range number)))
    ; Send each item in the data to each thread
    (for ([item data])
        (for ([thread threads])
            (thread-send thread item)))
    ; Wait until the threads finith their execution before continuing with the main thread
    (for-each thread-wait threads)
    (displayln "MAIN THREAD FINISH"))
