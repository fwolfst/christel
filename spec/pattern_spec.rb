require 'spec_helper'

describe Christel::Pattern do
  before do
    @pattern = Christel::Pattern.new("Chaos Crochet")
  end

  it 'has a name' do
    expect(@pattern.name).to eql("Chaos Crochet")
  end

  describe 'count_stitches' do
    it 'counts stitches' do
      expect(@pattern.count_stitches).to eql(0)
    end
  end

  describe 'add_stitch' do
    it 'increases number of total stitches' do
      @pattern.add_stitch Christel::Stitch.new(:ch)
      expect(@pattern.count_stitches).to eql(1)
    end
  end
end
