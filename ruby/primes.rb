def prime?(n)
  return false if 1 == n
  # test 2 first to start with 3
  return true  if 2 == n
  return false if n.even?
  # start with 3 to skip evens
  divisor = 3
  while (divisor * divisor) <= n
    return false if n % divisor == 0
    # skip evens to go twice as fast
    divisor += 2
  end
  true
end

def primes(from: 2, to: Float::INFINITY)
  enumerator = if to > from then from.upto(to) else from.downto(to) end
  enumerator.lazy.select { |n| prime? n }
end
