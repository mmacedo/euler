#!/usr/bin/env ruby

# http://projecteuler.net/problem=26

require File.expand_path('./digits.rb', File.dirname(__FILE__))

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
