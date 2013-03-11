#!/usr/bin/env ruby

# http://projecteuler.net/problem=7

require File.expand_path('./primes.rb', File.dirname(__FILE__))

puts primes.drop(10000).first
