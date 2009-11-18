require 'spec_helper'

describe UserObserver do
  enable_observers :user_observer

  it "should raise an error when a user record is saved" do
    lambda { User.create!(:email => 'user_observer_test@example.com', :password => 'monkey') }.should raise_error(UserObserverCalledError)
  end
end