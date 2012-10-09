#!/usr/bin/env coffee

concat = (args...) ->
  result = []
  for ls in args when ls.length > 0
    result.push ls...
  result

quicksort = (arr) ->
  arr = [].slice.apply(arr, [])
  return arr if arr.length in [0, 1]
  pivot = arr.splice(Math.ceil(arr.length / 2), 1)[0]
  less = (x for x in arr when x <= pivot)
  greater = (x for x in arr when x > pivot)

  concat quicksort(less), [pivot], quicksort(greater)

exports.quicksort = quicksort