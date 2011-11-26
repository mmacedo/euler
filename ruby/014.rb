#!/ruby/env ruby

# http://projecteuler.net/problem=14

require './units.rb'

def get_next(n)
  if n % 2 == 0
    n / 2
  else
    n * 3 + 1
  end
end

def get_chain_size(n)
  ret = 1
  until n == 1
    n = get_next n
    ret += 1
  end
  ret
end

largest = 1
largest_size = 1
for start in 2..(1.millions)
  size = get_chain_size start
  if size > largest_size
    largest = start
    largest_size = size
  end
end

puts largest
