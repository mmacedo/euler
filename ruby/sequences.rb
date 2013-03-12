module Enumerable
  # map with an accumulator
  def map_inject(initial)
    accumulator = initial
    map do |*values|
      accumulator = yield accumulator, *values
    end
  end

  # flat_map with an accumulator
  def flat_map_inject(initial)
    accumulator = initial
    flat_map do |*values|
      accumulator = yield accumulator, *values
    end
  end
end

class Enumerator::Lazy
  # lazy map with an accumulator
  def map_inject(initial)
    accumulator = initial
    Lazy.new(self) do |yielder, *values|
      accumulator = yield accumulator, *values
      yielder << accumulator
    end
  end

  # lazy flat_map with an accumulator
  def flat_map_inject(initial)
    accumulator = initial
    Lazy.new(self) do |yielder, *values|
      accumulator = yield accumulator, *values
      accumulator.each { |a| yielder << a }
      accumulator
    end
  end
end

class Object
  # Generate a lazy sequence until block returns nil
  def unfold
    Enumerator.new do |y|
      result = yield self
      until result.nil?
        y << result
        result = yield result
      end
    end.lazy
  end
end

class Integer
  def and_beyond
    upto(FLOAT::INFINITY).lazy
  end
end
