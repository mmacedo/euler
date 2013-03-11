#!/usr/bin/env ruby

# http://projecteuler.net/problem=35

require File.expand_path('./digits.rb', File.dirname(__FILE__))
require File.expand_path('./primes.rb', File.dirname(__FILE__))
require File.expand_path('./units.rb', File.dirname(__FILE__))

def rotate(n)
  d = digits(n)
  d.count.times.map do |i|
    d.rotate(i).reduce { |sum, digit| (sum * 10) + digit }
  end
end

def circulars(to)
  circular = {}
  primes(to:to).select do |prime|
    unless circular.has_key? prime
      rotations = rotate(prime).to_a
      is_circular = rotations.all? { |n| prime? n }
      rotations.each { |n| circular[n] = is_circular }
    end
    circular[prime]
  end
end

puts circulars(1.million.pred).count
