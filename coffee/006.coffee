#!/usr/bin/env coffee

# http://projecteuler.net/problem=6

sum = (sum, n) -> sum + n

sumOfSquares = (n*n for n in [1..100]).reduce sum, 0

squareOfSums = Math.pow [1..100].reduce(sum, 0), 2

difference = squareOfSums - sumOfSquares

console.log difference