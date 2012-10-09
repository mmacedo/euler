#!/usr/bin/env coffee

# http://projecteuler.net/problem=15

countChange = (money, coins) ->
  if money < 0 or coins.length is 0
    0
  else if money is 0
    1
  else
    countChange(money - coins[0], coins) + countChange(money, coins[1..])

console.log countChange 200, [1, 2, 5, 10, 20, 50, 100, 200]