module Christel
  class Pattern
    attr_accessor :name
    attr_accessor :stitches

    def initialize(name)
      @name = name
      @stitches = []
    end

    def count_stitches
      @stitches.count
    end

    def add_stitch(stitch)
      @stitches << stitch
    end
  end
end
