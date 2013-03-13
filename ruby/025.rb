#!/usr/bin/env ruby

# http://projecteuler.net/problem=25

require File.expand_path('./fibonacci.rb', File.dirname(__FILE__))

def more_than_n_digits(seq, length)
  value = 10 ** (length - 1)
  seq.drop_while { |n| n < value }
end

first_index = more_than_n_digits(fibonacci.each_with_index, 1000).first[1] + 1

puts first_index
