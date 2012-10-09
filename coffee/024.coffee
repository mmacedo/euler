#!/usr/bin/env coffee

# http://projecteuler.net/problem=24

factorial = (n) ->
  if n in [0, 1]
    1
  else
    n * factorial(n - 1)

# Lexicographic permutations
nthPermutation = (n, chars) ->
  if n is 1
    return chars.join('')
  else
    chars = chars.slice()
    permutationsWithChar = factorial (chars.length - 1)
    for c, i in chars
      nextCharStart = permutationsWithChar * (i + 1) + 1
      if nextCharStart > n
        chars.splice(i, 1)
        return c + nthPermutation(n - permutationsWithChar * i, chars)
  null

numbers = (i.toString() for i in [0..9])
console.log nthPermutation(1000*1000, numbers)