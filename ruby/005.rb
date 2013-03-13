#!/usr/bin/env ruby

# http://projecteuler.net/problem=5

# Least Common Multiple
def lcm(*numbers)
  numbers = numbers.clone
  result = 1
  divisor = 2
  until numbers.empty?
    while numbers.any? { |n| n % divisor == 0 }
      result *= divisor
      numbers.map! { |n| if n % divisor == 0 then (n / divisor) else n end }
    end

    numbers.delete_if { |n| n == 1 }

    divisor += 1
  end
  result
end

puts lcm(*1..20)
