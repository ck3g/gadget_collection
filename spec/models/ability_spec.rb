require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context 'when guest' do
    subject { Ability.new nil }
    it { should_not be_able_to :all, Gadget }
  end

  context 'when user' do
    let!(:user) { create :user }

    subject { Ability.new user }

    it { should be_able_to :create, Gadget }
    it { should be_able_to :index, Gadget }
  end
end
