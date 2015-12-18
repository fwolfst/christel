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

    def next_destination_stitch
      nil
    end
  end
end
