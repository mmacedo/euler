#!/usr/bin/env ruby

# http://projecteuler.net/problem=10

require './prime.rb'
require './units.rb'

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
