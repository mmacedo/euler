#!/usr/bin/env ruby

# http://projecteuler.net/problem=6

def sum_of_squares(max)
  (1..max).collect {|n| n * n }.inject(:+)
end

def square_of_sums(max)
  (1..max).inject(:+) ** 2
end

difference = square_of_sums(100) - sum_of_squares(100)

puts difference
