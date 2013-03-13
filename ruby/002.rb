#!/usr/bin/env ruby

# http://projecteuler.net/problem=2

require File.expand_path('./units.rb', File.dirname(__FILE__))
require File.expand_path('./fibonacci.rb', File.dirname(__FILE__))

def sum_even_fibonacci(to)
  fibonacci.take_while { |n| n <= to }.select(&:even?).reduce(:+)
end

sum = sum_even_fibonacci(4.millions)

puts sum
