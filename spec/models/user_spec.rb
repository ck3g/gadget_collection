require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  describe '.associations' do
    it { should have_many(:gadgets).dependent :destroy }
  end
end
