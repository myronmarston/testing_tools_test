require 'spec_helper'

describe "/users/_form" do
  before(:each) do
    assigns[:user] = stub_model(User)
  end

  context 'when the user is a new record' do
    before(:each) do
      assigns[:user].as_new_record
    end

    it "should render a form to create a new record" do
      render 
      response.should have_tag("form",
        :method => "post",
        :action => users_path(assigns(:user)) ) do |form|
          form.should have_tag("input", :type => "submit")
      end
    end
  end

  context 'when the user is an existing record' do
    it "should render a form to update an existing record" do
      render 
      response.should have_tag("form",
        :method => "put",
        :action => users_path(assigns(:user)) ) do |form|
          form.should have_tag("input", :type => "submit")
      end
    end
  end
end
