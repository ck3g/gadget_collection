require 'spec_helper'

describe Gadget do
  it 'has a valid factory' do
    expect(create :gadget).to be_valid
  end

  describe '.associations' do
    it { should belong_to :user }
    it { should have_many(:pictures).dependent :destroy }
  end

  describe '.validations' do
    context 'when valid' do
      subject { create :gadget }
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    end
  end
end
