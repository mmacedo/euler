#!/usr/bin/env ruby

# http://projecteuler.net/problem=3

require File.expand_path('./prime.rb', File.dirname(__FILE__))

number = 600851475143
root   = Math.sqrt(number).to_i
factor = primes(from: root, to: 1).find { |prime| number % prime == 0 }

puts factor
