module CPLGrammar
  class PatternNode < Treetop::Runtime::SyntaxNode
    def make_pattern
      pattern = Christel::Pattern.new("unnamed")
      elements.each do |element|
        element.operate_on pattern if element.respond_to?(:operate_on)
      end
      return pattern
    end
  end
end
