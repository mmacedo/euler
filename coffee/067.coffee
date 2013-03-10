#!/usr/bin/env coffee

# http://projecteuler.net/problem=67

# Load graph
file_name = require('path').join(__dirname, 'data/triangle.txt')
file = require('fs').readFileSync(file_name).toString()
triangle = file.split(/\n/g).splice(0, 100).map (s) ->
  s.split(' ').map (val) -> parseInt(val, 10)

# Get largest value
max2 = (a,b) -> Math.max(a,b)
largestValue = triangle.map((row) -> row.reduce(max2, 0)).reduce(max2, 0)

# Invert the problem to a shortest path problem
for row in triangle
  for value, colIndex in row
    row[colIndex] = largestValue - value

# Add extra row to be goal node
triangle.push [0]

nodeKey = (node) -> "#{node.row}.#{node.col}"

exploreNode = (node) ->
  if node.row is triangle.length - 2
    [
      {
        row: node.row + 1
        col: 0
        total: node.total
      }
    ]
  else
    [
      {
        row: node.row + 1
        col: node.col
        total: node.total + triangle[node.row + 1][node.col]
      }
    , {
        row: node.row + 1
        col: node.col + 1
        total: node.total + triangle[node.row + 1][node.col + 1]
      }
    ]

bestNode = (nodes) ->
  best = null
  for node in nodes
    best = node if best is null or node.total < best.total
  best

isGoal = (explored, node) ->
  # Is extra row
  node.row is triangle.length - 1

closeNode = (open, closed, node) ->
  # Remove from open
  for openNode, i in open
    if openNode.row is node.row and openNode.col is node.col
      open.splice(i, 1)
      break
  # Add to closed
  key = nodeKey(node)
  closed[key] = node.total unless closed[key]? and closed[key] <= node.total
  return

openNodes = (open, closed, nodes) ->
  # Add children nodes to open
  for node in nodes
    key = nodeKey(node)
    open.push(node) unless closed[key]? and closed[key] <= node.total
  return

# Best-First Search
graphTraversal = (start) ->
  open = [ start ]
  closed = {}
  while open.length > 0
    current = bestNode(open)
    return current if isGoal(open, current) is true
    closeNode open, closed, current
    openNodes open, closed, exploreNode(current)
  null

startNode = row:0, col:0, total:triangle[0][0]
result = graphTraversal startNode

# Revert the inversion of the graph
total = (largestValue * (triangle.length - 1)) - result.total

console.log total
