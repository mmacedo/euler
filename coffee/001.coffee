#!/usr/bin/env coffee

# http://projecteuler.net/problem=1

sumMultiplesOf3And5 = (below) ->
  sum = 0
  for n in [1...below] when n % 3 is 0 or n % 5 is 0
    sum += n
  sum

console.log sumMultiplesOf3And5(10000)
