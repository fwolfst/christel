require 'spec_helper'

require 'cpl'

describe CPLGrammarParser do
  before do
    @parser = CPLGrammarParser.new
  end

  describe 'creates Patterns from input' do
    it 'parses a dead simple example' do
      pattern = @parser.parse("ch").make_pattern
      expect(pattern).to_not be nil
      expect(pattern.stitches.count).to be 1
    end

    it 'parses <num stitch> examples' do
      pattern = @parser.parse("6 ch").make_pattern
      expect(pattern.stitches.count).to be 6
    end

    it 'parses accepts comments' do
      pattern = @parser.parse("# Comment\n6ch\n#Comment 2").make_pattern
      expect(pattern.stitches.count).to be 6
    end
  end
end
