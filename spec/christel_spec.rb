require 'spec_helper'

describe Christel do
  it 'has a version number' do
    expect(Christel::VERSION).not_to be nil
  end

  it 'defines a Pattern' do
    expect(Christel::Pattern).not_to be nil
  end
end
