require 'spec_helper'

describe UsersController do
  describe 'GET :new' do
    before(:each) do
      get :new
    end

    it { should assign_to(:user) }
    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe 'POST :create' do
    before(:each) do
      @user = stub_model(User)
      stub(User).new { @user }
    end

    context 'with valid attributes' do
      before(:each) do
        mock(@user).save { true }
        post :create, :user => {}
      end

      it { should assign_to(:user) }
      it { should redirect_to(user_path(@user)) }
    end

    context 'with invalid attributes' do
      before(:each) do
        mock(@user).save { false }
        post :create, :user => {}
      end

      it { should assign_to(:user) }
      it { should render_template(:new) }
    end
  end

  describe 'GET :show' do
    before(:each) do
      @user = stub_model(User)
      stub(User).find('37') { @user }
      get :show, :id => '37'
    end

    it { should assign_to(:user) }
    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
end
