require 'spec_helper'

describe Christel::Pattern do
  before do
    @pattern = Christel::Pattern.new("Chaos Crochet")
  end

  it 'has a name' do
    expect(@pattern.name).to eql("Chaos Crochet")
  end

  describe '#count_stitches' do
    it 'counts stitches' do
      expect(@pattern.count_stitches).to eql(0)
    end
  end

  describe '#add_stitch' do
    it 'increases number of total stitches' do
      @pattern.add_stitch Christel::Stitch.new(:ch)
      expect(@pattern.count_stitches).to eql(1)
    end

    it 'adds stitch at end, for @stitches.last' do
      stitch = Christel::Stitch.new(:ch)
      @pattern.add_stitch stitch
      expect(@pattern.stitches.last).to eql stitch
    end

    it 'sets predecessors' do
      stitch = Christel::Stitch.new(:ch)
      @pattern.add_stitch stitch
      stitch2 = Christel::Stitch.new(:ch)
      @pattern.add_stitch stitch2
      expect(@pattern.stitches.last.predecessor).to eql stitch
    end
  end

  describe '#next_destination_stitch' do
    it 'is nil for empty pattern' do
      expect(@pattern.next_destination_stitch).to be nil
    end
  end
end
