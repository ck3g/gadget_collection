require 'spec_helper'

describe GadgetsController do

  let!(:user) { create :user_example_com}
  let!(:iphone) { create :gadget, name: 'iPhone', user: user }

  before { sign_in user }

  describe 'GET #new' do
    before { get :new }
    it { should respond_with :success }
    it { should render_template :new }
  end

  describe 'POST #create' do
    context 'with valid attrbutes' do
      subject { post :create, gadget: attributes_for(:gadget) }

      it { should redirect_to gadgets_path }
      it 'creates new gadget' do
        expect { subject }.to change(user.gadgets, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, gadget: attributes_for(:invalid_gadget) }
      it { should render_template :new }
      it 'dont creates gadget' do
        expect { subject }.to_not change { user.gadgets.count }
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: iphone.id }
    it { should render_template :edit }
    it { should respond_with :success }
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      subject { patch :update, id: iphone, gadget: { name: 'iPad' } }
      it { should redirect_to gadgets_path }
      it "changes gadget's name" do
        expect {
          subject
          iphone.reload
        }.to change(iphone, :name).to 'iPad'
      end
    end

    context 'with invalid attributes' do
      subject { patch :update, id: iphone, gadget: { name: '' } }
      it { should render_template :edit }
      it 'dont updates gadget' do
        expect {
          subject
          iphone.reload
        }.to_not change(iphone, :name)
      end
    end
  end
end
