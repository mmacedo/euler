#!/usr/bin/env ruby

# http://projecteuler.net/problem=7

require File.expand_path('./primes.rb', File.dirname(__FILE__))

def nth_prime(n)
  primes.drop(n.pred).first
end

puts nth_prime(10001)
