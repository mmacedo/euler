#!/usr/bin/env ruby

# http://projecteuler.net/problem=25

def fiboUntil
  n = 1
  last = 0
  fibo = 1
  until yield(fibo, n)
    fibo, last = fibo + last, fibo
    n += 1
  end
  n
end

def problem25 digits
  raise ArgumentError.new(":digits should be greater than zero") unless digits > 0
  fiboUntil { |x| x.to_s.length == digits }
end

puts problem25(1000)