#!/usr/bin/env coffee

# http://projecteuler.net/problem=5

isEvenlyDivisibleBy1to20 = (n) ->
  return false for divisor in [1..20] when n % divisor isnt 0
  true

n = 20
n += 1 until isEvenlyDivisibleBy1to20 n

console.log n