{countChange} = require('../count-change')

time = (f) ->
  start = new Date()
  f()
  new Date() - start

describe 'countChange', () ->

  CHF = [5, 10, 20, 50, 100, 200, 500]
  unsorted_CHF = [500, 5, 50, 100, 20, 200, 10]
  BRL = [1, 5, 10, 25, 50, 100]

  it 'should get right with small values', () ->
    expect(countChange 4, [1, 2]).toEqual(3)

  it 'should get right with a sorted list of coins', () ->
    expect(countChange 300, CHF).toEqual(1022)

  it 'should get right with a unsorted list of coins', () ->
    expect(countChange 300, unsorted_CHF).toEqual(1022)

  it 'should get zero without a small enough coin', () ->
    expect(countChange 301, CHF).toEqual(0)

  it 'should execute fast with big values', () ->
    start = new Date()

    finishedCounting = false

    setTimeout () ->
      expect(countChange 600, BRL).toEqual(215138)
      finishedCounting = true
    , 0

    waitsFor (() -> finishedCounting)

    runs () ->
      elapsed = new Date() - start
      expect(elapsed).toBeLessThan(50)