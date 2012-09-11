#!/usr/bin/env ruby

# http://projecteuler.net/problem=3

require File.expand_path('./prime.rb', File.dirname(__FILE__))

number = 600851475143
factor = 3
while number > 1
  prime_until(factor) {|prime| factor=prime if number % prime == 0 }
  number = number / factor
end

puts factor