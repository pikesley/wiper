module Wiper
  module Patterns
    class Accelerator
      attr_accessor :interval, :grid, :multiplier
      attr_reader :squeegee

      def initialize
        @direction = :east
        @interval = 1
        @multiplier = 0.9
        @grid = [[0] * 45] * 7

        yield self if block_given?

        @squeegee = Squeegee.new do |s|
          s.grid = @grid
          s.direction = @direction
        end
      end

      def each
        @squeegee.each do |frame|
          frame.interval = @interval
          yield frame
          @interval = @interval * @multiplier
        end
      end
    end
  end
end

class Array
  attr_accessor :interval
end
