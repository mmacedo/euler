#!/usr/bin/coffee

# http://projecteuler.net/problem=23

memoize = (f) ->
  f.hash = []
  (p) -> f.hash[p] or= f(p)

sumDivisors = memoize (n) ->
  throw "Argument to sumDivisors must be positive" unless n > 0
  if n < 4
    1
  else
    sqrt = Math.floor(Math.sqrt(n))
    sum = 1
    for divisor in [2..sqrt] when n % divisor is 0
      sum += divisor
      sum += (n / divisor) if (n / divisor) != divisor
    sum

problem23 = (max = 28123) ->
  arentAbundantsSum = [0..max]
  for i in [1..(Math.floor max / 2)] when sumDivisors(i) > i
    for j in [i..(max - i)] when sumDivisors(j) > j
      arentAbundantsSum[i+j] = 0

  sum = 0
  sum += i for i in arentAbundantsSum
  sum

exports.sumDivisors = sumDivisors
exports.problem23 = problem23