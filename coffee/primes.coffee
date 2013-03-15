exports.isPrime = (n) ->
  return false if n is 1
  return true  if n is 2
  return false if n % 2 is 0
  divisor = 3
  while divisor*divisor <= n
    return false if n % divisor is 0
    divisor += 2
  true
