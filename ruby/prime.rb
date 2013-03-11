def prime?(n)
  if 1 == n
    false
  elsif (2..3) === n
    true
  elsif n % 2 == 0
    false
  else
    factor = 3
    while n % factor != 0 and (factor * factor) < n
      factor = factor + 2
    end
    n % factor > 0
  end
end

def primes(from: 1, to: Float::INFINITY)
  enumerator = if to > from then from.upto(to) else from.downto(to) end
  enumerator.lazy.select { |n| prime? n }
end
