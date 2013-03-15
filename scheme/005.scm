#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=5

(require srfi/26)

(define [any? pred s]
  (cond
    [(null? s) #f]
    [(pred (car s)) #t]
    [else (any? pred (cdr s))]))

; Least Common Multiple
(define [lcm numbers]

  (define [divisible? a b]
    (zero? (remainder a b)))

  (define [divide-if-divisible-by factor]
    (lambda [x]
      (if (zero? (remainder x factor))
          (/ x factor)
          x)))

  (define [iter numbers factor result]
    (cond
      [(null? numbers) result]
      [(any? (cut divisible? <> factor) numbers)
       (iter
        (filter (cut > <> 1)
                (map (divide-if-divisible-by factor)
                     numbers))
        factor
        (* result factor))]
      [else (iter numbers (add1 factor) result)]))

  (iter numbers 2 1))

(lcm (range 1 21))
