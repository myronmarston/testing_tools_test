require 'spec_helper'

describe User do
  def valid_attributes
    {
      :email => User.maximum(:email).try(:next) || 'user@example.com',
      :password => 'monkey'
    }
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "should create a new instance given valid attributes" do
    User.create!(valid_attributes)
  end

  it "should set the last_save_type to create when first saved" do
    @user = User.create!(valid_attributes)
    @user.last_save_type.should == 'create'
  end

  it "should set the last_save_type to update when saved again" do
    @user = User.create!(valid_attributes)
    @user.name = 'Bob'
    @user.save!
    @user.last_save_type.should == 'update'
  end

  context 'when a user record exists' do
    include UseRealDB

    before(:each) do
      @existing_user = User.create!(valid_attributes)
    end

    it { should validate_uniqueness_of(:email) }
  end
end
