#!/usr/bin/env ruby

# http://projecteuler.net/problem=15

def countPaths(x, y, gridSize)
  if x == gridSize and y == gridSize
    1
  else
    paths = 0
    if x < gridSize
      paths += countPaths(x + 1, y, gridSize)
    end
    if y < gridSize
      paths += countPaths(x, y + 1, gridSize)
    end
    paths
  end
end

puts countPaths(0, 0, 12)