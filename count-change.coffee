#!/usr/bin/env coffee

count1 = (money, coins) ->
  # Tree recursion
  if money < 0 or coins.length is 0
    0
  else if money is 0
    1
  else
    count1(money - coins[0], coins) + count1(money, coins[1..])

count2 = (money, coins) ->
  # Tabulation

  # initialize
  table = [1]
  table[i] = 0 for i in [1..money]

  # table
  for coin, i in coins
    for j in [coin..money] when money >= coin
      table[j] += table[j - coin]

  table[money]

exports.countChange = count2