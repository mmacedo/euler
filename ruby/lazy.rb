module Enumerable
  def map_reduce(initial)
    accumulator = initial
    map do |*values|
      accumulator = yield accumulator, *values
    end
  end

  def flat_map_reduce(initial)
    accumulator = initial
    flat_map do |*values|
      accumulator = yield accumulator, *values
    end
  end
end

class Enumerator::Lazy
  def map_reduce(initial)
    accumulator = initial
    Lazy.new(self) do |yielder, *values|
      accumulator = yield accumulator, *values
      yielder << accumulator
    end
  end

  def flat_map_reduce(initial)
    accumulator = initial
    Lazy.new(self) do |yielder, *values|
      accumulator = yield accumulator, *values
      accumulator.each { |a| yielder << a }
      accumulator
    end
  end
end
