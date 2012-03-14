#!/ruby/env ruby

# http://projecteuler.net/problem=17

def read_unit(n)
  case n
  when 1
    "one"
  when 2
    "two"
  when 3
    "three"
  when 4
    "four"
  when 5
    "five"
  when 6
    "six"
  when 7
    "seven"
  when 8
    "eight"
  when 9
    "nine"
  else
    ""
  end
end

def read_dozen(dozen, unit)
  case dozen
  when 1
    case unit
    when 1
      "eleven"
    when 2
      "twelve"
    when 3
      "thirteen"
    when 4
      "fourteen"
    when 5
      "fifteen"
    when 6
      "sixteen"
    when 7
      "seventeen"
    when 8
      "eighteen"
    when 9
      "nineteen"
    else
      "ten"
    end
  when 2
    "twenty-#{read_unit unit}"
  when 3
    "thirty-#{read_unit unit}"
  when 4
    "forty-#{read_unit unit}"
  when 5
    "fifty-#{read_unit unit}"
  when 6
    "sixty-#{read_unit unit}"
  when 7
    "seventy-#{read_unit unit}"
  when 8
    "eighty-#{read_unit unit}"
  when 9
    "ninety-#{read_unit unit}"
  else
    read_unit unit
  end.gsub /-$/, ""
end

def read_hundred(n)
  if n == 0
    ""
  else
    "#{read_unit n} hundred"
  end
end

def read_thousand_group(i)
  case i
  when 0
    ""
  when 1
    " thousand"
  else
    " thousand" + (" thousands" * (i - 1))
  end
end

def read_number(n)
  s = n.to_s
  groups = s.chars.to_a.reverse.each_slice(3).to_a.map {|group| group.map{|c| c.to_i} }
  groups = groups.each_with_index.map do |group,i|
    hundred = group[2] || 0
    dozen = group[1] || 0
    unit = group[0]
    separator = if hundred > 0 && (dozen > 0 || unit > 0) then " and " else "" end
    thousand = if group.inject(:+) > 0 then read_thousand_group(i) else "" end

    read_hundred(hundred) + separator + read_dozen(dozen, unit) + thousand
  end.reverse
  groups.reduce do |sum,group|
    if sum.empty?
      group
    elsif ! group.empty?
      sum + " and " + group
    else
      sum
    end
  end
end

puts (1..1000).map {|n| read_number(n).gsub(/[^a-z]/,"").length }.reduce :+
