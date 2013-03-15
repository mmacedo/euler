#!/usr/bin/env ruby

# http://projecteuler.net/problem=3

require File.expand_path('./primes.rb', File.dirname(__FILE__))

def largest_prime_factor(number)
  other_factor = 2
  until number % other_factor == 0 and prime?(number / other_factor)
    other_factor += 1
  end
  number / other_factor
end

factor = largest_prime_factor(600851475143)

puts factor
