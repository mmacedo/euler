#!/usr/bin/env ruby

# http://projecteuler.net/problem=9

sum = 0
a = 0
begin
  a += 1

  b = 0
  begin
    b += 1

    c = Math.sqrt(a*a + b*b)
    sum = a + b + c
  end while sum < 1000
end until sum == 1000

puts a * b * Integer(c)