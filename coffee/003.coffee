#!/usr/bin/env coffee

# http://projecteuler.net/problem=3

isPrime = (n) ->
  current = 2
  while current*current <= n
    return false if n % current is 0
    current += 1
  true

number = 600851475143
divisor = 1
divisor += 1 until number % divisor is 0 and isPrime(number/divisor)

console.log number / divisor