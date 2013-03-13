#!/usr/bin/env ruby

# http://projecteuler.net/problem=4

def palindrome?(chars)
  smaller = 0
  larger  = chars.length - 1
  while larger > smaller
    return false if chars[larger] != chars[smaller]
    smaller += 1
    larger  -= 1
  end
  true
end

def largest_product_palindrome(factors)
  factors.to_a.combination(2)
    .map { |f1, f2| f1 * f2 }
    .select { |product| palindrome?(product.to_s) }
    .max
end

largest = largest_product_palindrome(100..999)

puts largest
