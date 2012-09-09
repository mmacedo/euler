#!/usr/bin/env ruby

# http://projecteuler.net/problem=18

triangle = []
triangle[ 0] = [                            75 ]
triangle[ 1] = [                          95, 64 ]
triangle[ 2] = [                        17, 47, 82 ]
triangle[ 3] = [                      18, 35, 87, 10 ]
triangle[ 4] = [                    20,  4, 82, 47, 65 ]
triangle[ 5] = [                  19,  1, 23, 75,  3, 34 ]
triangle[ 6] = [                88,  2, 77, 73,  7, 63, 67 ]
triangle[ 7] = [              99, 65,  4, 28,  6, 16, 70, 92 ]
triangle[ 8] = [            41, 41, 26, 56, 83, 40, 80, 70, 33 ]
triangle[ 9] = [          41, 48, 72, 33, 47, 32, 37, 16, 94, 29 ]
triangle[10] = [        53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14 ]
triangle[11] = [      70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57 ]
triangle[12] = [    91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48 ]
triangle[13] = [  63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31 ]
triangle[14] = [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 ]

def exploreNode triangle, node
  result = []
  if node[:row] != triangle.length - 1 then
    row = node[:row] + 1
    col = node[:col]
    val = triangle[row][col]
    result.push row:row, col:col, val:val, total:node[:total]+val

    col = node[:col] + 1
    val = triangle[row][col]
    result.push row:row, col:col, val:val, total:node[:total]+val
  end
  result
end

def selectNode nodes
  nodes.pop()
end

def graphTraversal triangle, start
  explored = [start]
  until explored.empty? do
    current = selectNode(explored)
    explored.push *exploreNode(triangle, current)
    yield(current)
  end
end

startNode = { row:0, col:0, total:triangle[0][0] }
largest = startNode
graphTraversal triangle, startNode do |node|
  largest = node if node[:row] == triangle.length - 1 and node[:total] > largest[:total]
end
puts largest[:total]