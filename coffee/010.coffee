#!/usr/bin/env coffee

# http://projecteuler.net/problem=10

{isPrime} = require './primes'

sumPrimes = (n) ->
  sum = 0
  for n in [1...n]
    sum += n if isPrime n
  sum

sum = sumPrimes(2000000)

console.log sum
