require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context 'when guest' do
    subject { Ability.new nil }
    it { should_not be_able_to :all, Gadget }
  end

  context 'when user' do
    let!(:user) { create :user }
    let!(:own_gadget) { create :gadget, user: user }
    let!(:ally_gadget) { create :gadget }

    subject { Ability.new user }

    it { should be_able_to :create, Gadget }
    it { should be_able_to :index, Gadget }
    it { should be_able_to :manage, own_gadget }
    it { should_not be_able_to :manage, ally_gadget }
  end
end
