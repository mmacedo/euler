#!/ruby/env ruby

# http://projecteuler.net/problem=5

def lcm(n)
  n = n.clone
  ret = 1
  while n.length > 0
    divisor = 2
    divisor += 1 while n[0] > 1 && n[0] % divisor > 0

    (n.length-1).downto(0) do |i|
      n[i] /= divisor if n[i] % divisor == 0
      n.delete_at i if n[i] == 1
    end

    ret *= divisor
  end

  ret
end

puts lcm (1..20).to_a
