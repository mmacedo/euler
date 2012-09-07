#!/usr/bin/env ruby

# http://projecteuler.net/problem=10

require File.expand_path('./prime.rb', File.dirname(__FILE__))
require File.expand_path('./units.rb', File.dirname(__FILE__))

sum = 0
prime_until(2) do |prime|
  if prime >= 2.millions
    true
  else
    sum += prime
    false
  end
end

puts sum
