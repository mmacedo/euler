#!/usr/bin/env coffee

# http://projecteuler.net/problem=2

previous = 1
current = 1
sum = 0
while current <= 4000000
  [previous, current] = [current, current + previous]
  sum += current if current % 2 == 0

console.log sum