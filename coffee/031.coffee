#!/usr/bin/env coffee

# http://projecteuler.net/problem=31

countWaysOfMakingChange = (money, coins) ->
  table = [1]
  table.push 0 for i in [1..money]

  for coin in coins when coin < money
    for j in [coin..money]
      table[j] += table[j - coin]

  table[money]

console.log countWaysOfMakingChange(200, [1, 2, 5, 10, 20, 50, 100, 200])
