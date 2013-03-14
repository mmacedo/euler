#!/usr/bin/env coffee

# http://projecteuler.net/problem=10

{isPrime} = require './primes'

sumPrimes = (below) ->
  sum = 0
  for n in [2...below] when isPrime(n)
    sum += n
  sum

sum = sumPrimes(2000000)

console.log sum
