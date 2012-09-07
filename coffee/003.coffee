#!/usr/bin/env coffee

# http://projecteuler.net/problem=3

{isPrime} = require './prime'

number = 600851475143
divisor = 1
divisor += 1 until number % divisor is 0 and isPrime(number/divisor)

console.log number / divisor