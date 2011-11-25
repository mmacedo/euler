#!/ruby/env ruby

def prime_until(from = 1)
  if from <= 1 and yield 1
    1
  elsif from <= 2 and yield 2
    2
  else
    n = 3
    while from > n or ! yield n
      begin
        n = n + 2

        factor = 3
        while factor <= (n / 3) and n % factor > 0
          factor = factor + 2
        end
        is_prime = n % factor > 0
      end until is_prime
    end
    n
  end
end
