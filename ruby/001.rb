#!/usr/bin/env ruby

# http://projecteuler.net/problem=1

def sum_multiples_of_3_and_5_below(limit)
  (1...limit).select { |n| n % 3 == 0 or n % 5 == 0 }.inject(:+)
end

puts sum_multiples_of_3_and_5_below(1000)
