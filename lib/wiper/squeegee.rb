module Wiper
  class Squeegee
    attr_accessor :starter

    def initialize
      @starter = [[0] * 45] * 7

      yield self if block_given?
    end
  end
end
