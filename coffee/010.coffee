#!/usr/bin/env coffee

# http://projecteuler.net/problem=10

{isPrime} = require './prime'

sum = 0
for n in [1...2000000]
  sum += n if isPrime n

console.log sum