#lang racket

(provide prime?)

(define [prime? n]
  (define [iter divisor]
    (cond
      [(> (sqr divisor) n) #t]
      [(zero? (remainder n divisor)) #f]
      [else (iter (+ 2 divisor))]))
  (cond
    [(= n 1) #f]
    [(= n 2) #t]
    [(zero? (remainder n 2)) #f]
    [else (iter 3)]))
