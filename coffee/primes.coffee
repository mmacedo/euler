exports.isPrime = (n) ->
  return false if n is 1 or n % 2 is 0
  return true  if n is 2
  divisor = 3
  while divisor*divisor <= n
    return false if n % divisor is 0
    divisor += 2
  true
