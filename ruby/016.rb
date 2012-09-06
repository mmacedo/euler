#!/usr/bin/env ruby

# http://projecteuler.net/problem=16

def sum_digits(n)
  n.to_s.chars.map {|c| c.to_i }.inject :+
end

puts sum_digits(2 ** 1000)
