#!/ruby/env ruby

# http://projecteuler.net/problem=12

def count_divisors(n)
  (2..(Math.sqrt(n).floor)).count {|divisor| n % divisor == 0 } * 2 + 2
end

x = 500

i = 1
triangle = 1
while count_divisors(triangle) <= x
  i += 1
  triangle += i
end

puts triangle
