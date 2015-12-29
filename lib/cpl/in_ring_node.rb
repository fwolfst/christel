module CPLGrammar
  class InRingNode < Treetop::Runtime::SyntaxNode
    def operate_on pattern
      puts elements.inspect
      pattern.add_stitch(Christel::Stitch.new(:ring))
      pattern.ring_mode = true
      number.eval.times do |x|
        pattern.add_stitch(stitch_type.create_stitch pattern)
      end
      pattern.ring_mode = false
    end
  end
end
