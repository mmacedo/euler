{sumDivisors, problem23} = require '../023'

describe 'sum all numbers that arent sum of any two abundant numbers', () ->

  describe 'sumDivisors', () ->

    it 'should fail with zero', () ->
      expect(() -> sumDivisors(0)).toThrow()

    it 'should fail with a negative number', () ->
      expect(() -> sumDivisors(-1)).toThrow()
      expect(() -> sumDivisors(-10)).toThrow()

    it 'should return 1 for numbers up to 3', () ->
      expect(sumDivisors(1)).toBe(1)
      expect(sumDivisors(2)).toBe(1)
      expect(sumDivisors(3)).toBe(1)

    it 'should return 1 for prime numbers', () ->
      expect(sumDivisors(5)).toBe(1)
      expect(sumDivisors(7)).toBe(1)
      expect(sumDivisors(29)).toBe(1)

    it 'should return the same number for perfect number', () ->
      expect(sumDivisors(1)).toBe(1)
      expect(sumDivisors(6)).toBe(6)
      expect(sumDivisors(28)).toBe(28)

    it 'should return smaller value for an deficient number', () ->
      expect(sumDivisors(10)).toBe(8)
      expect(sumDivisors(25)).toBe(6)

    it 'should return larger value for an abundant number', () ->
      expect(sumDivisors(12)).toBe(16)
      expect(sumDivisors(30)).toBe(42)

describe 'problem23', () ->
  first = 12 + 12
  second = 12 + 18
  add = (previous, current) -> previous + current

  it 'should return all when max smaller than first number', () ->
    sum = [1...first].reduce(add, 0)
    expect(problem23(first - 1)).toBe(sum)

  it 'should return all but first when max is equal to the first', () ->
    sum = [1...first].reduce(add, 0)
    expect(problem23(first)).toBe(sum)

  it 'should return all but first when max is equal to the second', () ->
    sum = [1...second].reduce(add, 0) - first
    expect(problem23(second)).toBe(sum)