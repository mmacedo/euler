{quicksort} = require('../quicksort')

describe 'quicksort', () ->

  describe 'passing a sorted array', () ->

    it 'should just return an empty array', () ->
      expect(quicksort []).toEqual([])

    it 'should just return the array with one item', () ->
      expect(quicksort [1]).toEqual([1])

    it 'should return the array sorted with two items', () ->
      expect(quicksort [1, 2]).toEqual([1, 2])

    it 'should return the array sorted with several items', () ->
      sorted = [1, 2, 5, 10, 20, 50, 100, 200]
      expect(quicksort sorted).toEqual(sorted.slice())

  describe 'passing an unsorted array', () ->

    it 'should return the array sorted with two items', () ->
      expect(quicksort [2, 1]).toEqual([1, 2])

    it 'should return the array sorted with several items', () ->
      shuffled = [5, 1, 100, 20, 50, 2, 200, 10]
      sorted = [1, 2, 5, 10, 20, 50, 100, 200]
      expect(quicksort shuffled).toEqual(sorted)