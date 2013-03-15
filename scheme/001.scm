#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=1

(define [sum-multiples-of-3-and-5-below high]
  (foldl
   +
   0
   (filter
     (lambda [x] (or (zero? (remainder x 3))
                     (zero? (remainder x 5))))
     (range 1 high))))


(sum-multiples-of-3-and-5-below 1000)
