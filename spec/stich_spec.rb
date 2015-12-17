require 'spec_helper'

describe Christel::Stitch do
  it 'initializes with a type' do
    expect(Christel::Stitch.new(:ch)).not_to be nil
  end
end
