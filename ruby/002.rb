#!/usr/bin/env ruby

# http://projecteuler.net/problem=2

require File.expand_path('./units.rb', File.dirname(__FILE__))

result = 0
last = 0
current = 1
while current <= 4.millions do
  result = result + current if current.even?
  temp = last
  last = current
  current = current + temp
end

puts result
