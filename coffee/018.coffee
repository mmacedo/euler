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

exploreNode = (node) ->
  if node.row is triangle.length - 1
    []
  else
    [
      {
        row: node.row + 1
        col: node.col
        val: node.val + triangle[node.row + 1][node.col]
      }
    , {
        row: node.row + 1
        col: node.col + 1
        val: node.val + triangle[node.row + 1][node.col + 1]
      }
    ]

selectNode = (nodes) ->
  nodes.pop()

graphTraversal = (start, callback) ->
  explored = [start]
  while explored.length > 0
    current = selectNode(explored)
    explored.push exploreNode(current)...
    break if callback(current) is true

largest = 0
startNode = row:0, col:0, val:triangle[0][0]
graphTraversal startNode, (node) ->
  largest = node.val if node.row is triangle.length - 1 and node.val > largest
  false

console.log largest