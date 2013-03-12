#!/usr/bin/env ruby

# http://projecteuler.net/problem=10

require File.expand_path('./primes.rb', File.dirname(__FILE__))
require File.expand_path('./units.rb', File.dirname(__FILE__))

def sum_primes(n)
  primes(to: n).reduce(:+)
end

sum = sum_primes(2.millions.pred)

puts sum
