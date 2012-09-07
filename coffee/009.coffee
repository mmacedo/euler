#!/usr/bin/env coffee

# http://projecteuler.net/problem=9

findPythagoreanTripletFor = (n) ->
  for a in [1..(n-2)]
    sum = 0
    b = a
    while sum < n
      b += 1
      c = Math.sqrt(a*a + b*b)
      sum = a + b + c
      return a * b * c if sum is n
  NaN

product = findPythagoreanTripletFor 1000

console.log product