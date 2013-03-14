#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=10

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

(define [enumerate-interval low high]
  (define [iter low acc]
    (if (> low high)
        acc
        (iter (add1 low)
              (cons low acc))))
  (reverse (iter low '())))

(define [sum-primes a b]
  (foldl
   +
   0
   (filter
    prime?
    (enumerate-interval a b))))

(sum-primes 2 (sub1 (* 1000 (* 1000 2))))
