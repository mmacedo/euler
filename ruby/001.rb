#!/usr/bin/env ruby

# http://projecteuler.net/problem=1

puts (1...1000).select {|n| n%3==0 or n%5==0 }.inject :+
