#!/usr/bin/env coffee

# http://projecteuler.net/problem=16

# Gets an array of digits (least significant digit first)
times2 = (arr) ->
  addToTheLeft = 0
  len = arr.length - 1
  for i in [0..len]
    value = arr[i] * 2 + addToTheLeft
    arr[i] = value % 10
    addToTheLeft = Math.floor(value / 10)
  while addToTheLeft > 0
    arr.push addToTheLeft % 10
    addToTheLeft = Math.floor(addToTheLeft / 10)
  arr

number = [1]
times2(number) for i in [1..1000]

sumOfDigits = number.reduce ((sum, x) -> sum + x), 0

console.log sumOfDigits