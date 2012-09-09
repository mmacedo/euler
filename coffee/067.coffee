#!/usr/bin/env coffee

# http://projecteuler.net/problem=18

# Load graph
triangle = require('fs').readFileSync('./data/triangle.txt').toString().split(/\n/g).map (s) ->
  s.split(' ').map (val) -> parseInt(val, 10)

# Get largest value
max2 = (a,b) -> Math.max(a,b)
largestValue = triangle.map((row) -> row.reduce(max2, 0)).reduce(max2, 0)

# Invert the problem to a shortest path problem
for row in triangle
  for colIndex in [0...row.length]
    row[colIndex] = largestValue - row[colIndex]

exploreNode = (node) ->
  if node.row is triangle.length - 1
    []
  else
    [
      {
        row: node.row + 1
        col: node.col
        val: triangle[node.row + 1][node.col]
        total: node.total + triangle[node.row + 1][node.col]
        prop: "#{node.row + 1}.#{node.col}"
      }
    , {
        row: node.row + 1
        col: node.col + 1
        val: triangle[node.row + 1][node.col + 1]
        total: node.total + triangle[node.row + 1][node.col + 1]
        prop: "#{node.row + 1}.#{node.col + 1}"
      }
    ]

bestNode = (nodes) ->
  best = null
  for node in nodes
    best = node if best is null or node.total < best.total
  best

isGoal = (explored, node) ->
  node.row is triangle.length - 1

closeNode = (open, closed, node) ->
  for i in [0...open.length]
    if open[i].row is node.row and open[i].col is node.col
      open.splice(i, 1)
      break
  closed[node.prop] = node unless closed[node.prop]? and closed[node.prop].total < node.total
  return

openNodes = (open, closed, nodes) ->
  for node in nodes
    unless closed[node.prop]?.total < node.total
      open.push node
  return

# Best First Search
graphTraversal = (start) ->
  open = [ start ]
  closed = {}
  while open.length > 0
    current = bestNode(open)
    return current if isGoal(open, current) is true
    closeNode open, closed, current
    openNodes open, closed, exploreNode(current)
  null

startNode = row:0, col:0, val:triangle[0][0], total:triangle[0][0], prop:'0.0'
result = graphTraversal startNode

# Revert the inversion of the graph
total = (largestValue * triangle.length) - result.total

console.log total