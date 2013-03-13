require File.expand_path('./sequences.rb', File.dirname(__FILE__))

def fibonacci
  [0, 1].unfold do |previous, current|
    [ current, previous + current ]
  end.map(&:first)
end
