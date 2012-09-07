#!/usr/bin/env coffee

# http://projecteuler.net/problem=14

nextCollatz = (n) ->
  if n % 2 is 0
    n / 2
  else
    3 * n + 1

collatzLength = (n) ->
  next = n
  len = 1
  until next is 1
    len += 1
    next = nextCollatz next
  len

largest = 1
largest_size = 1
for n in [2...1000000]
  len = collatzLength n
  if len > largest_size
    largest = n
    largest_size = len

console.log largest