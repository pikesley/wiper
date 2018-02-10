module Wiper
  class Squeegee
    attr_accessor :grid, :direction

    def initialize
      @grid = [[0] * 45] * 7
      @direction = :east
      yield self if block_given?
      @index = 0
    end

    def wipe
      @grid.map do |row|
        row.reverse! if @direction == :west
        row[@index] = 1 if @index < 45
        row[@index - 1] = 0 if @index > 0
        row.reverse! if @direction == :west
      end
      @index += 1
    end

    def each
      while @index < 45
        wipe
        yield @grid
      end
    end
  end
end

class Array
  def to_dots
    self
  end

  def animtype
    :tween
  end
end
