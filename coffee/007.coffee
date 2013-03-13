#!/usr/bin/env coffee

# http://projecteuler.net/problem=7

{isPrime} = require './primes'

nthPrime = (n) ->
  index = 1
  number = 2
  while index < 10001
    number += 1
    index += 1 if isPrime number
  number

console.log nthPrime(10001)
