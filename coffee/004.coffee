#!/usr/bin/env coffee

# http://projecteuler.net/problem=4

isPalindrome = (s) ->
  len = s.length
  half = Math.floor(len / 2)
  for i in [1..half]
    return false if s[i - 1] isnt s[len - i]
  true

largest_product_palindrome = (min_factor, max_factor) ->
  largest = null
  for f1 in [min_factor..max_factor]
    for f2 in [f1...max_factor]
      product = f1 * f2
      largest = product if product > largest and isPalindrome(product.toString())
  largest

largest = largest_product_palindrome(100, 999)

console.log largest
