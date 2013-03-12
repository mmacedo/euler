#!/usr/bin/env ruby

# http://projecteuler.net/problem=31

def count_ways_of_making_change(money, coins)
  table = [1] + ([0] * money)

  coins.select { |coin| coin < money }.each do |coin|
    (coin..money).each { |j| table[j] += table[j - coin] }
  end

  table[money]
end

puts count_ways_of_making_change(200, [1, 2, 5, 10, 20, 50, 100, 200])
