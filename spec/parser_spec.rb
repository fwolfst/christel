require 'spec_helper'

require 'cpl'

describe CPLGrammarParser do
  before do
    @parser = CPLGrammarParser.new
  end

  describe 'creates Patterns from input' do
    it 'parses a dead simple example' do
      pattern = @parser.parse("ch")
      expect(pattern).to_not be nil
    end
  end
end
