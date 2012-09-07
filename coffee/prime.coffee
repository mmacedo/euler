exports.isPrime = (n) ->
  current = 2
  while current*current <= n
    return false if n % current is 0
    current += 1
  true