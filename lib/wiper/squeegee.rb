module Wiper
  class Squeegee
    attr_reader :grid
    attr_accessor :direction, :curtain

    def initialize
      @grid = PhatGrid.new [[0] * 45] * 7
      @direction = :east
      @curtain = false
      yield self if block_given?
      @index = 0
      @limit = 45
      @limit = 7 if [:north, :south].include? @direction
    end

    def grid= data
      @grid = PhatGrid.new data
    end

    def wipe
      @grid = PhatGrid.new(@grid.transpose) if [:north, :south].include? @direction
      @grid.map do |row|
        row.reverse! if [:north, :west].include? @direction
        row[@index] = 1 if @index < row.length
        unless curtain
          row[@index - 1] = 0 if @index > 0
        end
        row.reverse! if [:north, :west].include? @direction
      end
      @grid = PhatGrid.new(@grid.transpose) if [:north, :south].include? @direction

      @index += 1
    end

    def each
      while @index < @limit
        wipe
        yield @grid
      end
    end
  end

  class PhatGrid < Array
    def initialize data
      data.length.times do |index|
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
