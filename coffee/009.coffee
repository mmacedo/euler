#!/usr/bin/env coffee

# http://projecteuler.net/problem=9

pythagoreanTriplet = (sum) ->
  for c1 in [1...sum]
    for c2 in [c1...sum]
      h = sum - c1 - c2
      # return triplet if h is really the hypotenuse
      return [c1, c2, h] if (h * h) == (c1 * c1 + c2 * c2)

multiply = (a, b) -> a * b

product = pythagoreanTriplet(1000).reduce(multiply, 1)

console.log product
