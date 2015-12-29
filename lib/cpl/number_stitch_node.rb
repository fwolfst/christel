module CPLGrammar
  class NumberStitchNode < Treetop::Runtime::SyntaxNode
    def operate_on pattern
      stitch_type = elements[2].text_value.to_s
      elements[0].text_value.to_i.times do |num|
        pattern.add_stitch Christel::Stitch.new(stitch_type)
      end
    end
  end
end
