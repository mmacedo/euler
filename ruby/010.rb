#!/usr/bin/env ruby

# http://projecteuler.net/problem=10

require File.expand_path('./primes.rb', File.dirname(__FILE__))
require File.expand_path('./units.rb', File.dirname(__FILE__))

sum = primes(to: 2.millions.pred).reduce(:+)

puts sum
