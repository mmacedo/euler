#!/usr/bin/env ruby

# http://projecteuler.net/problem=50

require File.expand_path('./lazy.rb', File.dirname(__FILE__))
require File.expand_path('./primes.rb', File.dirname(__FILE__))
require File.expand_path('./units.rb', File.dirname(__FILE__))

def primes_sum_of_consecutive_primes(to)
  primes(to:to).flat_map_reduce([]) do |sums, prime|
    # add current prime number to existing sums
    sums = sums.map { |sum| [ sum[0].succ, sum[1] + prime ] }
    # filter sums that exceeded the target
    sums = sums.select {|sum| sum[0] > 1 and sum[1] < to }
    # return sums and start new sum from current prime
    sums.to_a << [1, prime]
  end.select do |sum|
    # filter final sums that are not a prime number
    prime? sum[1]
  end
end

puts primes_sum_of_consecutive_primes(1.million.pred).max_by { |sum| sum[0] }[1]
