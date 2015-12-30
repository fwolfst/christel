module Christel
  class Pattern
    attr_accessor :name
    attr_accessor :stitches
    attr_accessor :direction
    attr_accessor :destination # Next stitch to stitch into

    def initialize(name)
      @name        = name
      @stitches    = []
      @direction   = :forward
      @destination = nil
    end

    def count_stitches
      @stitches.count
    end

    def add_stitch(stitch)
      if last_stitch = stitches.last
        stitch.predecessor = last_stitch
      end
      if @destination && stitch.type != :ch
        stitch.into(@destination)
        advance_destination
      end
      @stitches << stitch
    end

    def next_destination_stitch
      @destination
    end

    def in_ring(&block)
      add_stitch(Christel::Stitch.new :ring)
      @destination = stitches[0]
      yield self
      # To be able to 'finish off'
      @destination = stitches[1]
    end

    private

    def advance_destination
      return if @destination && stitches[0] && stitches[0].type == :ring
    end
  end
end
