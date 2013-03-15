#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=10

(require "primes.ss")

(define [sum-primes below]
  (foldl
   +
   0
   (filter
    prime?
    (range 2 below))))

(sum-primes (* 1000 (* 1000 2)))
