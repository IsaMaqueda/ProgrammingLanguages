#|
    Series of examples #4
    Advanced loops in Racket

    Gilberto Echeverria
    03/04/2020
|#

#lang racket

#|
(define (multi-list item n)
    (let loop
        ([n n]
         [result empty])
        (if (zero? n)
            result
            (loop (sub1 n) (cons item result)))))

(define (replicate data times)
    (let loop
        ([data data]
         [result empty])
        (if (empty? data)
            result
            (loop
                (cdr data)
                (append result (multi-list (car data) times))))))
|#

(define (replicate data times)
    (let loop
        ([data data]
         [result empty])
        (if (empty? data)
            result
            (loop
                (cdr data)
                (append
                     result
                     (let loop2
                        ([n times]
                         [result2 empty])
                        (if (zero? n)
                            result2
                            (loop2
                                 (sub1 n)
                                 (cons (car data) result2)))))))))

(define (expand data)
    (let loop
        ([data data]
         [times 1]
         [result empty])
        (if (empty? data)
            result
            (loop
                (cdr data)
                (add1 times)
                (append
                     result
                     (let loop2
                        ([n times]
                         [result2 empty])
                        (if (zero? n)
                            result2
                            (loop2
                                 (sub1 n)
                                 (cons (car data) result2)))))))))


(define (insert item data)
    (let loop
        ([data data]
         [result empty])
        (cond
            [(empty? data) 
                (append result (list item))]
            [(> item (car data))
                (loop (cdr data) (append result (list (car data))))]
            ;[else
            [(<= item (car data))
                (append result (list item) data)])))
