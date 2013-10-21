require 'spec_helper'

describe GadgetsController do

  let!(:user) { create :user_example_com}

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
end
