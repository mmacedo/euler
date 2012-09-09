#!/usr/bin/env coffee

# http://projecteuler.net/problem=17

readUnit = (n) ->
  switch n
    when 1 then 'one'
    when 2 then 'two'
    when 3 then 'three'
    when 4 then 'four'
    when 5 then 'five'
    when 6 then 'six'
    when 7 then 'seven'
    when 8 then 'eight'
    when 9 then 'nine'
    else ''

readDozen = (n, unit) ->
  (switch n
    when 1
      switch unit
        when 1 then 'eleven'
        when 2 then 'twelve'
        when 3 then 'thirteen'
        when 4 then 'fourteen'
        when 5 then 'fifteen'
        when 6 then 'sixteen'
        when 7 then 'seventeen'
        when 8 then 'eighteen'
        when 9 then 'nineteen'
        else 'ten'
    when 2 then "twenty-#{readUnit unit}"
    when 3 then "thirty-#{readUnit unit}"
    when 4 then "forty-#{readUnit unit}"
    when 5 then "fifty-#{readUnit unit}"
    when 6 then "sixty-#{readUnit unit}"
    when 7 then "seventy-#{readUnit unit}"
    when 8 then "eighty-#{readUnit unit}"
    when 9 then "ninety-#{readUnit unit}"
    else readUnit unit).replace(/-$/,'')

readHundred = (n) ->
  if n is 0
    ''
  else
    "#{readUnit n} hundred"

readThousandGroup = (groupIndex) ->
  switch groupIndex
    when 0 then ''
    when 1 then ' thousand'
    else ' thousand' + (' thousands' for j in [1...groupIndex]).join('')

readNumber = (n) ->
  digits = n.toString().split('').reverse().map (digit) -> parseInt(digit, 10)
  groups =
    for i in [0...digits.length] by 3
      group = digits[i...i+3]
      groupIndex = Math.floor(i/3)
      hundred = if group.length is 3 then group[2] else 0
      dozen   = if group.length >= 2 then group[1] else 0
      unit    = group[0]
      separator = if hundred > 0 and (dozen > 0 or unit > 0) then ' and ' else ''
      thousand = if hundred > 0 or dozen > 0 or unit > 0 then readThousandGroup(groupIndex) else ''

      readHundred(hundred) + separator + readDozen(dozen, unit) + thousand

  groups.reverse().reduce (sum, group) ->
    if sum is ''
      group
    else if group is ''
      sum
    else
      "#{sum} and #{group}"

sum = 0
sum += readNumber(n).replace(/[^a-z]/g,'').length for n in [1..1000]

console.log sum