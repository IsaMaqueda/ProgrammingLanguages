#|
    Creation of multiple threads using a generator function
    Use semaphores to control access to shared resources

    Gilberto Echeverria
    21/04/2020
|#

#lang racket

; Create a thread and give it a name
(define (make-thread name test-sem)
    (thread (lambda ()
        ; The funciton receives messages until it gets the atom 'end
        (let loop
            ; Print n messages
            ([n 0])
            ; Actions in the loop
            (if (= n 100)
                (printf "Thread ~a finishing\n" name)
                (begin
                    ; This should be the race condition
                    ; All threads trying to print at the same time
                    (semaphore-wait test-sem)
                        (printf "Thread ~a got number ~a\n" name n)
                    (semaphore-post test-sem)
                    (loop (add1 n))))))))

(define (main number)
    (displayln "MAIN THREAD START")
    (define test-sem (make-semaphore 1))
    ; Create several threads in one go, storing them in a list
    (define threads (map
                        (lambda (num) (make-thread num test-sem))
                        (range number)))
    ; Wait until the threads finith their execution before continuing with the main thread
    (for-each thread-wait threads)
    (displayln "MAIN THREAD FINISH"))
