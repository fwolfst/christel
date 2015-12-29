module CPLGrammar
  class InRingNode < Treetop::Runtime::SyntaxNode
    def operate_on pattern
      pattern.in_ring do |p|
        number.eval.times do |x|
          p.add_stitch(stitch_type.create_stitch pattern)
        end
      end
    end
  end
end
