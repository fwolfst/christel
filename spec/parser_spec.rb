require 'spec_helper'

require 'cpl'

describe CPLGrammarParser do
  before do
    @parser = CPLGrammarParser.new
  end

  describe 'creates Patterns from input' do
    it 'parses a dead simple example ["ch"]' do
      pattern = @parser.parse("ch").make_pattern
      expect(pattern).to_not be nil
      expect(pattern.stitches.count).to eql 1
    end

    it 'parses <num stitch> examples ["6 ch"]' do
      pattern = @parser.parse("6 ch").make_pattern
      expect(pattern.stitches.count).to eql 6
    end

    it 'accepts comments' do
      pattern = @parser.parse("# Comment\n6 ch\n#Comment 2").make_pattern
      expect(pattern.stitches.count).to eql 6
    end

    it 'parses "in ring" stuff' do
      pattern = @parser.parse("7 sc in ring").make_pattern
      expect(pattern.stitches.count).to eql 8
      expect(pattern.stitches[0].type).to eql :ring
      expect(pattern.stitches[2].type).to eql :sc
    end
  end
end
