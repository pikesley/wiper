module Wiper
  class Squeegee
    attr_reader :grid
    attr_accessor :direction, :curtain

    def initialize
      @grid = [[0] * 45] * 7
      @direction = :east
      @curtain = false
      yield self if block_given?
      @index = 0
    end

    def grid= data
      @grid = PhatGrid.new data
    end

    def wipe
      @grid.map do |row|
        row.reverse! if @direction == :west
        row[@index] = 1 if @index < 45
        unless curtain
          row[@index - 1] = 0 if @index > 0
        end
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

  class PhatGrid < Array
    def initialize data
      7.times do |index|
        self[index] = data[index]
      end
    end

    def to_dots
      self
    end

    def animtype
      :tween
    end
  end
end
