#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=2

(require srfi/41)

(define [fibonacci]
  (define [fibgen previous current]
    (stream-cons current (fibgen current (+ previous current))))
  (fibgen 0 1))

(define [sum-even-fibonacci high]
  (stream-fold
   +
   0
   (stream-take-while
    (lambda (n) (<= n high))
    (stream-filter
     even?
     (fibonacci)))))

(sum-even-fibonacci (* 1000 (* 1000 4)))
