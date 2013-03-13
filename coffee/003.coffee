#!/usr/bin/env coffee

# http://projecteuler.net/problem=3

{isPrime} = require './primes'

largestPrimeFactor = (number) ->
  other_factor = 2
  until number % other_factor is 0 and isPrime(number / other_factor)
    other_factor += 1
  number / other_factor

console.log largestPrimeFactor(600851475143)
