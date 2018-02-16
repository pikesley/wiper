module Wiper
  class Squeegee
    attr_accessor :grid, :direction, :curtain, :limit

    def initialize
      @grid = [[0] * 45] * 7
      @direction = :east
      @curtain = false
      @index = 0
      @limit = 45

      yield self if block_given?
    end

    def direction= dir
      @direction = dir
      @limit = 7 if [:north, :south].include? dir
    end

    def wipe
      if @index <= @limit
        @grid.transpose! if [:north, :south].include? @direction
        @grid.map do |row|
          row.reverse! if [:north, :west].include? @direction
          row[@index] = 1 if @index < row.length
          unless curtain
            row[@index - 1] = 0 if @index > 0
          end
          row.reverse! if [:north, :west].include? @direction
        end
        @grid.transpose! if [:north, :south].include? @direction

        @index += 1
      end
    end

    def each
      while @index < @limit
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

  def transpose!
    a = self.transpose
    self.map! { |i| i = nil }.compact!
    a.map { |i| self.push i }
  end
end
