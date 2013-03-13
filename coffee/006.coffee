#!/usr/bin/env coffee

# http://projecteuler.net/problem=6

add = (a, b) -> a + b

sumOfSquares = (max) ->
  squares = (n*n for n in [1..max])
  squares.reduce(add, 0)

squareOfSums = (max) ->
  sums = [1..max].reduce(add, 0)
  Math.pow(sums, 2)

difference = squareOfSums(100) - sumOfSquares(100)

console.log difference
