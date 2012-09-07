#!/usr/bin/env ruby

# http://projecteuler.net/problem=7

require File.expand_path('./prime.rb', File.dirname(__FILE__))

def nth_prime(n)
  i = 0
  prime = prime_until(2) do |dummy|
    i = i + 1
    i == n
  end
end

puts nth_prime(10001)
