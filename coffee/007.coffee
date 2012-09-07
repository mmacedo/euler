#!/usr/bin/env coffee

# http://projecteuler.net/problem=7

{isPrime} = require './prime'

i = 1
n = 2
while i < 10001
  n += 1
  i += 1 if isPrime n

console.log n