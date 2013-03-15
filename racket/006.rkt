#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=6

(define [sum-of-squares max]
  (foldl
   +
   0
   (map
    sqr
    (range 1 (add1 max)))))

(define [square-of-sums max]
  (sqr
   (foldl
    +
    0
    (range 1 (add1 max)))))

(- (square-of-sums 100) (sum-of-squares 100))
