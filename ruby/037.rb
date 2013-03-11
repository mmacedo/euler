#!/usr/bin/env ruby

# http://projecteuler.net/problem=37

require File.expand_path('./digits.rb', File.dirname(__FILE__))
require File.expand_path('./primes.rb', File.dirname(__FILE__))

def truncate(n)
  d = digits(n)
  length = d.count
  (1...d.count).flat_map do |i|
    [
      # left to right
      d.slice(i, length - i).reduce { |sum, digit| (sum * 10) + digit },
      # right to left
      d.slice(0, length - i).reduce { |sum, digit| (sum * 10) + digit }
    ]
  end
end

truncatable = primes(from: 10).select { |p| truncate(p).all? { |n| prime? n } }.take(11)

puts truncatable.reduce :+
