require 'ruby-graphviz'

module Christel
  class DotRenderer
    def render(pattern, filename)
      graph = GraphViz.new("G", "type" => "digraph", "label" => pattern.name)
      # Look up Christel::Stitch -> Graphiz::Node
      stitch_map = {}
      pattern.stitches.each_with_index do |stitch, stitch_index|
        node = graph.add_nodes("#{stitch.type} #{stitch_index}",
                           color:     'red',
                           fillcolor: 'white',
                           style:     'filled')
        node.label = stitch.type
        stitch_map[stitch] = node
        # for predecessor
        if predecessor = stitch_map[stitch.predecessor]
          # weight len color
          graph.add_edges(node, predecessor)
        end
        # for destination
        if destination = stitch_map[stitch.destination]
          graph.add_edges(node, destination)
                        #, .., weight, len, color)
        end
      end
      graph.output(dot: "#{filename}.dot")
      graph.output(use: 'neato', png: "#{filename}.png")
    end
  end
end
