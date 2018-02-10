module Wiper
  class Squeegee
    attr_accessor :grid

    def initialize
      @grid = [[0] * 45] * 7
      yield self if block_given?
      @index = 0
    end

    def wipe
      @grid.map do |row|
        row[@index] = 1
        row[@index - 1] = 0 if @index > 0
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
