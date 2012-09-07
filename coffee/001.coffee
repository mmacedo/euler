#!/usr/bin/env coffee

# http://projecteuler.net/problem=1

console.log [1...1000].filter((n) -> n%3 is 0 or n%5 is 0).reduce(((sum,n) -> sum+n), 0)