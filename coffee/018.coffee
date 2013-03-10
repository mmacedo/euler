#!/usr/bin/env coffee

# http://projecteuler.net/problem=18

triangle = [
  [                            75 ]
, [                          95, 64 ]
, [                        17, 47, 82 ]
, [                      18, 35, 87, 10 ]
, [                    20,  4, 82, 47, 65 ]
, [                  19,  1, 23, 75,  3, 34 ]
, [                88,  2, 77, 73,  7, 63, 67 ]
, [              99, 65,  4, 28,  6, 16, 70, 92 ]
, [            41, 41, 26, 56, 83, 40, 80, 70, 33 ]
, [          41, 48, 72, 33, 47, 32, 37, 16, 94, 29 ]
, [        53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14 ]
, [      70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57 ]
, [    91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48 ]
, [  63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31 ]
, [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 ]
]

exploreNode = (triangle, node) ->
  if node.row is triangle.length - 1
    []
  else
    [
      {
        row:   node.row + 1
        col:   node.col
        total: node.total + triangle[node.row + 1][node.col]
      }
    , {
        row:   node.row + 1
        col:   node.col + 1
        total: node.total + triangle[node.row + 1][node.col + 1]
      }
    ]

# Brute force
graphTraversal = (triangle, start, callback) ->
  open = [start]
  while open.length > 0
    current = open.pop()
    open.push exploreNode(triangle, current)...
    callback(current)
  return

startNode = row:0, col:0, total:triangle[0][0]
largest = startNode
graphTraversal triangle, startNode, (node) ->
  largest = node if node.row is triangle.length - 1 and node.total > largest.total

console.log largest.total
