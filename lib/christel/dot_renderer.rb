require 'ruby-graphviz'

module Christel
  class DotRenderer
    def render(pattern, filename)
      graph = GraphViz.new("G", "type" => "digraph")
      pattern.stitches.each_with_index do |stitch, stitch_index|
        node = graph.add_nodes("#{stitch.type} #{stitch_index}",
                           color:     'red',
                           fillcolor: 'white',
                           style:     'filled')
        node.label = stitch.type
        # for predecessor
        # add_edges(node, .., weight, len, color)
        # for destination
        # add_edges(node, .., weight, len, color)
      end
      graph.output(dot: "#{filename}.dot")
      graph.output(use: 'neato', png: "#{filename}.png")
    end
  end
end
