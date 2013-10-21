require 'spec_helper'

describe Picture do
  it 'has a valid factory' do
    expect(create :picture).to be_valid
  end

  describe '.associations' do
    it { should belong_to :gadget }
  end
end
