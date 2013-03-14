def prime?(n)
  return false if 1 == n or n.even?
  return true  if 2 == n
  divisor = 3
  while (divisor * divisor) <= n
    return false if n % divisor == 0
    divisor += 2
  end
  true
end

def primes(from: 1, to: Float::INFINITY)
  enumerator = if to > from then from.upto(to) else from.downto(to) end
  enumerator.lazy.select { |n| prime? n }
end
