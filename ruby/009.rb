#!/usr/bin/env ruby

# http://projecteuler.net/problem=9

def pythagorean_triplet(sum)
  (1...sum).each do |c1|
    (c1.succ...sum).each do |c2|
      h =  (sum - c1 - c2)
      # return triplet if h is really the hypotenuse
      return [c1, c2, h] if (h * h) == (c1 * c1 + c2 * c2)
    end
  end
end

product = pythagorean_triplet(1000).reduce(:*)

puts product
