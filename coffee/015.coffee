#!/usr/bin/env coffee

# http://projecteuler.net/problem=15

memoize2 = (f) ->
  f.hash = []
  (p1, p2) ->
    (f.hash[p1] or= [])
    f.hash[p1][p2] or= f(p1, p2)

pascal = memoize2 (col, row) =>
  if (row <= 1 or col is 0 or col is row)
    1
  else
    pascal(col - 1, row - 1) + pascal(col, row - 1)

countRoutes =
  (n) -> pascal(n, n * 2)

console.log countRoutes 20