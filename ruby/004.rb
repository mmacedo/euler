#!/usr/bin/env ruby

# http://projecteuler.net/problem=4

def palindrome?(n)
  size = 1
  size *= 10 while size < n
  size /= 10

  palindrome = true
  while size >= 10
    smaller = n % 10
    larger = smaller * size
    test = n - larger
    palindrome = test >= 0 && test < size
    break unless palindrome
    n = (n - larger) / 10
    size /= 100
  end
  palindrome
end

largest = 0
for i in 999.downto 100
  break if i * i <= largest
  for j in i.downto 100
    product = i * j
    break if product <= largest
    if palindrome? product
      largest = product
    end
  end
end

puts largest