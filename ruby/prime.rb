def prime?(n)
  if n == 1
    true
  elsif n == 2
    true
  elsif n == 3
    true
  elsif n % 2 == 0
    false
  else
    factor = 3
    while factor < (n / factor) && n % factor > 0
      factor = factor + 2
    end
    n % factor > 0
  end
end

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
      end until prime? n
    end
    n
  end
end