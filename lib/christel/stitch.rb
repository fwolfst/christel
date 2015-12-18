module Christel
  class Stitch
    attr_accessor :type
    attr_accessor :predecessor
    attr_accessor :destination
    attr_accessor :stitched_by

    def initialize(type, predecessor: nil, destination: nil)
      @type        = type
      @predecessor = predecessor
      @destination = destination
      @stitched_by = []
    end
  end
end
