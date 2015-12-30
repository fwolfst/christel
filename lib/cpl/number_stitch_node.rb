module CPLGrammar
  class NumberStitchNode < Treetop::Runtime::SyntaxNode
    def operate_on pattern
      elements[0].text_value.to_i.times do |num|
        pattern.add_stitch(stitch_type.create_stitch pattern)
      end
    end
  end
end
