#!/usr/bin/env ruby

# http://projecteuler.net/problem=26

def digits(n)
  n.abs.to_s.split(//).map { |s| s.to_i }
end

def manual_division(num, den, max_precision = 0)
  if (num < 0) ^ (den < 0)
    # If one of them is negative, yield a negative sign
    yield nil, "-", nil
  end

  # Convert to positive
  num, den = num.abs, den.abs

  # Digits before the decimal point
  remainder = digits(num).reduce(0) do |rem, digit|
    rem = (rem * 10) + digit
    if rem >= den
      yield false, rem / den, rem % den
      rem % den
    else
      rem
    end
  end

  if remainder == 0
    # There is no number after decimal place
    return
  else
    # If the result is less than 1, yields a zero before decimal place
    if num < den
      yield false, 0, num
    end

    # Tell decimal place came
    yield nil, ".", nil
  end

  precision = 0
  # Digits after the decimal point
  until remainder == 0 or (max_precision > 0 and precision == max_precision)
    remainder *= 10
    precision += 1
    yield true, remainder / den, remainder % den
    remainder = remainder % den
  end
end

def recurring_cycle(num, den)
  # Can not divide by zero
  raise ArgumentError.new "Denominator can not be zero!" if den == 0

  decimal = []
  manual_division(num, den) do |is_decimal, digit, remainder|
    # We care only about decimal places
    next unless is_decimal

    # Find a repeating pair of digit and remainder
    index = decimal.find_index { |p| p[0] == digit and p[1] == remainder }

    # Found recurring cycle
    unless index.nil?
      return decimal.drop(index).reduce(0) { |number, pair| (number * 10) + pair[0] }
    end

    decimal.push([digit, remainder])
  end

  # If gets here, then it is not recurring
  0
end

def largest_unit_recurring_cycle(range_of_denominators)
  range_of_denominators.max_by { |n| recurring_cycle(1, n) }
end

# puts largest_unit_recurring_cycle(2...1000)
