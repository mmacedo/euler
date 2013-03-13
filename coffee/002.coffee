#!/usr/bin/env coffee

# http://projecteuler.net/problem=2

sumEvenFibonacci = (max) ->
  previous = 0
  current  = 1
  sum      = 0
  while current <= max
    sum += current if current % 2 == 0
    [previous, current] = [current, current + previous]
  sum

sum = sumEvenFibonacci(4000000)

console.log sum
