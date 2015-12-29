module CPLGrammar
  class StitchTypeNode < Treetop::Runtime::SyntaxNode
    def create_stitch pattern
      return Christel::Stitch.new(text_value.to_sym)
    end
  end
end
