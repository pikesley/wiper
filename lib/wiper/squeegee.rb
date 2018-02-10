module Wiper
  class Squeegee
    attr_accessor :grid, :direction

    def initialize
      @grid = [[0] * 45] * 7
      @direction = :east
      yield self if block_given?
      @index = 0
      @index = 44 if @direction == :west
    end

    def wipe
      case @direction
      when :east
        @grid.map do |row|
          row[@index] = 1 if @index < 45
          row[@index - 1] = 0 if @index > 0
        end
        @index += 1

      when :west
        @grid.map do |row|
          row[@index] = 1 if @index >= 0
          row[@index + 1] = 0 if @index < 44
        end
        @index -= 1
      end
    end

    def has_more?
      case @direction
      when :east
        @index < 45
      when :west
        @index >= 0
      end
    end

    def each
      while has_more?
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
