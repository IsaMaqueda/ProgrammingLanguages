#|
    Final Proyect 

    Isabel Maqueda A01652906

    16/6/2020
|#

#lang racket

; Create a channel to communicate the threads
(define data-channel (make-channel))
(define output-channel (make-channel))
(define file-channel (make-channel))

;Global variable of list 
(define column '())

; function to write the output file

(define printer
    (thread (lambda ()
        ; open the output file
        (call-with-output-file "" #:exists 'truncate
            (lambda (out)
                (let loop
                    ;no arguments
                    ()
                    ;iteration action
                    (define msg (channel-get output-channel))
                    (cond 
                        ;exit the function when reciving the message end
                        [(equal msg 'end) (printf "Printer thread finishing\n")]
                        ;write the data on the channel to the file and repeat
                        [else (display msg out) (loop)])))))))


;Function that recieves the threads of the thread-maker to use the data 
(define (list-maker name)
    (thread (lambda ()
        (let loop
            ;no arguments
            ()
            ;iteration actions 
            (define line (channel-get file-channel))
            (cond
                ;exits the function when reciving the message end
                [(equal? line 'end)(printf "Thread ~a finishin\n" name)]
                ;write the data on the channel to the file and repeat

                [else 
                    (append line column)
                    (loop)])))))



;Function to create worker threads
(define (thread-maker name)
    (thread (lambda ()
        (let loop
            ;no arguments
            ()
            ;iteration actions 
            (define line (channel-get data-channel))
            (cond
                ;exits the function when reciving the message end
                [(equal? line 'end)(printf "Thread ~a finishin\n" name)]
                ;write the data on the channel to the file and repeat

                [else 
                    (define data (string-split (string-trim line) ","))
                    ;send new string composed of the place name and average
                    (channel-put file-channel (last data)); here we send the last 
                    (loop)])))))



(define (main n-threads input-file)
    (call-with-input-file input-file 
        (lambda (in)
            ;read the header
            (read-line in)
            ;write the header in the output file
            (channel-put output-channel "HEADER")
            ;create the threads
            (define threads (map thread-maker (range n-threads)))
            ;iterate over the file
            (let loop
                ;no arguments
                ()
                ;iteration actions 
                (define line (read-line in))
                    (if (eof-object? line)
                        (printf "EOF reached\n")
                        ;split the line into a list and send it into threads
                        (begin
                            (channel-put data-channel line)
                            (loop))))

            ;send the end message to each thread
            (for ([i n-threads]) (channel-put data-channel 'end))
            ;wait for threads to finish
            (for-each thread-wait threads)))

    ;let the file thread finish
    (channel-put file-channel 'end)

    (printf "DONE\n"))
