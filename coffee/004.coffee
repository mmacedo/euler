#!/usr/bin/env coffee

# http://projecteuler.net/problem=4

palindrome = (s) ->
  len = s.length
  half = Math.floor(len / 2)
  for i in [1..half]
    return false if s[i - 1] isnt s[len - i]
  true

largest = 0
for n1 in [999..100] by -1
  for n2 in [999..100] by -1
    product = n1 * n2
    largest = product if product > largest and palindrome(product.toString())

console.log largest