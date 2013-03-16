#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=9

(define [pythagorean-triplet sum]
  (define [iter c1 c2]
    (cond
      [(>= c1 sum)
       (raise "There is no pythagorean triplet with that sum.")]
      [(>= c2 sum)
       (iter (add1 c1) (+ c1 2))]
      [else
       (let ([h (- sum c1 c2)])
         (if (= (sqr h) (+ (sqr c1) (sqr c2)))
             (values c1 c2 h)
             (iter c1 (add1 c2))))]))
  (iter 1 2))

(let-values ([(a b c) (pythagorean-triplet 1000)])
  (* a b c))

