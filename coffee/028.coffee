#!/usr/bin/env coffee

# http://projecteuler.net/problem=28

sumDiagonals = (size) ->
  throw "Size must be greater than zero" unless size > 0
  throw "Size must be odd" unless size % 2 is 1
  sum = 1
  if size > 1
    startAt = 2
    for i in [3..size] by 2
      startAt = startAt + ((i - 2) * 4 - 4)
      p1 = startAt + (i - 2)
      p2 = p1 + (i - 1)
      p3 = p2 + (i - 1)
      p4 = p3 + (i - 1)
      sum += p1 + p2 + p3 + p4
  sum

exports.sumDiagonals = sumDiagonals