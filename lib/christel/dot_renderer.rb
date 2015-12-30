require 'ruby-graphviz'

module Christel
  class DotRenderer
    @@weights = { slst: 0.8, sc: 1}

    def node_color(stitch)
      'black'
    end

    def yarn_color()
      'black'
    end

    def connect_color()
      'red'
    end

    def render(pattern, filename)
      graph = GraphViz.new("G", "type" => "digraph", "label" => pattern.name)
      # Look up Christel::Stitch -> Graphiz::Node
      stitch_map = {}
      pattern.stitches.each_with_index do |stitch, stitch_index|
        node = graph.add_nodes("#{stitch.type} #{stitch_index}",
                           color:     node_color(stitch),
                           fillcolor: 'white',
                           style:     'filled')
        node.label = stitch.type
        stitch_map[stitch] = node
        # for predecessor
        if predecessor = stitch_map[stitch.predecessor]
          graph.add_edges(predecessor, node,
                          color: yarn_color,
                          len: 1,
                          weight: 7)
        end
        # for destination
        if destination = stitch_map[stitch.destination]
          graph.add_edges(node, destination,
                          color: connect_color,
                          len: @@weights[stitch.type],
                          weight: 1)
        end
      end
      graph.output(dot: "#{filename}.dot")
      graph.output(use: 'neato', png: "#{filename}.png")
    end
  end
end
