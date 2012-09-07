#!/usr/bin/env coffee

# http://projecteuler.net/problem=12

countDivisors = (n) ->
  count = 0
  divisor = 0
  while divisor * divisor < n
    divisor += 1
    if n % divisor is 0
      count += 1
      count += 1 if n / divisor isnt divisor
  count

i = 1
triangle = 1
while countDivisors(triangle) <= 500
  i += 1
  triangle += i

console.log triangle