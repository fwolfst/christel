module CPLGrammar
  class InstructionsNode < Treetop::Runtime::SyntaxNode
    def operate_on pattern
      # StitchCreationNodes

      elements.each do |element|
        pattern.add_stitch element.create_stitch(pattern) if element.respond_to?(:create_stitch)
        element.operate_on(pattern) if element.respond_to?(:operate_on)
      end
    end
  end
end
