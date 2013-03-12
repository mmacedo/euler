#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=10

(define [prime? n]
  (define [smallest-divisor n]
    (define [iter i]
      (cond
        [(> (sqr i) n) n]
        [(zero? (remainder n i)) i]
        [else (iter (add1 i))]))
    (iter 2))
  (= n (smallest-divisor n)))


(define [sum-primes a b]
  (define [iter i acc]
    (cond
      [(> i b) acc]
      [(prime? i) (iter (add1 i) (+ i acc))]
      [else (iter (add1 i) acc)]))
  (iter a 0))

(sum-primes 2 (sub1 (* 1000 (* 1000 2))))
