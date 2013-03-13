#!/usr/bin/env coffee

# http://projecteuler.net/problem=5

# Least Common Multiple
lcm = (numbers...) ->
  result = 1
  divisor = 2
  until numbers.length is 0
    # while at least one number is a multiple of divisor
    while numbers.some((n) -> n % divisor is 0)
      # multiply the result by divisor
      result *= divisor
      # divide all multiples of divisor by divisor
      numbers = numbers.map (n) -> if n % divisor is 0 then n / divisor else n

    # remove 1's
    numbers = numbers.filter (n) -> n isnt 1
    divisor += 1
  result

console.log lcm([1..20]...)
