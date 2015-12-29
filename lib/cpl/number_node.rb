module CPLGrammar
  class NumberNode < Treetop::Runtime::SyntaxNode
    def eval
      text_value.to_i
    end
  end
end

