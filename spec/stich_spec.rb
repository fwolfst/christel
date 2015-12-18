require 'spec_helper'

describe Christel::Stitch do
  it 'initializes with a type' do
    expect(Christel::Stitch.new(:ch)).not_to be nil
  end

  describe '#type' do
    it 'stores a type' do
      expect(Christel::Stitch.new(:ch).type).to eql :ch
    end
  end

  describe '#predecessor' do
    it 'defaults to no predecessor' do
      expect(Christel::Stitch.new(:st).predecessor).to be nil
    end

    it 'can be initialized with predecessor' do
      predecessor = Christel::Stitch.new(:ch)
      expect(Christel::Stitch.new(:st,
               predecessor: predecessor).predecessor).to eql (predecessor)
    end
  end

  describe '#destination' do
    it 'stitches *into* other stitch' do
      destination = Christel::Stitch.new(:ch)
      expect(Christel::Stitch.new(
         :st, destination: destination).destination).to eql destination
    end
  end

  describe '#stitched_by' do
    it 'stores list of stitches that have this stitch as destination' do
      expect(Christel::Stitch.new(:st).stitched_by).to eql []
    end
  end
end
