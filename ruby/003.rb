#!/usr/bin/env ruby

# http://projecteuler.net/problem=3

require File.expand_path('./primes.rb', File.dirname(__FILE__))

def largest_prime_factor(number)
  root = Math.sqrt(number).to_i
  primes(from: root, to: 2).find { |prime| number % prime == 0 }
end

factor = largest_prime_factor(600851475143)

puts factor
