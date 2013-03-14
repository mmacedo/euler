#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=2

(define [fibonacci]
  (define [fibgen previous current]
    (stream-cons current (fibgen current (+ previous current))))
  (fibgen 0 1))

(define [stream-take-while pred s]
  (let ([first (stream-first s)])
    (if (pred first)
        (stream-cons
         first
         (stream-take-while pred (stream-rest s)))
        empty-stream)))

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
