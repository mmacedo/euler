{euler} = require './euler'
{sumDiagonals} = require '../028'

describe 'sumDiagonals', () ->

  it 'should fail with a spiral of size less than one', () ->
    expect(() -> sumDiagonals(0)).toThrow()
    expect(() -> sumDiagonals(-2)).toThrow()
    expect(() -> sumDiagonals(-10)).toThrow()

  it 'should fail with a spiral of even size', () ->
    expect(() -> sumDiagonals(2)).toThrow()
    expect(() -> sumDiagonals(10)).toThrow()

  it 'should return correct value for size 1', () ->
    expect(sumDiagonals(1)).toBe(1)

  it 'should return correct value for size 3', () ->
    expect(sumDiagonals(3)).toBe(25)

  it 'should return correct value for size 5', () ->
    expect(sumDiagonals(5)).toBe(101)

  euler () ->
    sumDiagonals(1001)

  return