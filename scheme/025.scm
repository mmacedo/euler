#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=25

(define [fibonacci]
  (define [fibgen previous current]
    (stream-cons current (fibgen current (+ previous current))))
  (fibgen 0 1))

(define [stream-drop-while pred s]
  (if (pred (stream-first s))
      (stream-drop-while pred (stream-rest s))
      s))

(define [** n power]
  (define [iter times acc]
    (if (zero? times)
        acc
        (iter (sub1 times) (* acc n))))
  (iter power 1))

(define [stream-with-index s]
  (define [iter s index]
    (if (stream-empty? s)
        empty-stream
        (stream-cons
         (cons index (stream-first s))
         (iter (stream-rest s) (add1 index)))))
  (iter s 0))

(define [fibonacci-with-more-than-n-digits n]
  (let ([value (** 10 (sub1 n))])
    (stream-first
     (stream-drop-while
      (lambda (pair) (< (cdr pair) value))
      (stream-with-index (fibonacci))))))

(let ([result (fibonacci-with-more-than-n-digits 1000)])
  (add1 (car result)))
