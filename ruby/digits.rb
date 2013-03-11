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
