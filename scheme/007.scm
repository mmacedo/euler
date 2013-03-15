#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=7

(require "primes.ss")

(define [nth-prime n]
  (define [iter index number]
    (cond
      [(= n index)
       (sub1 number)]
      [(prime? number)
       (iter (add1 index) (add1 number))]
      [else
       (iter index (add1 number))]))
  (iter 0 1))

(nth-prime 10001)
