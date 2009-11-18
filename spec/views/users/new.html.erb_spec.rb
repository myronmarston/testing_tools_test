require 'spec_helper'

describe "/users/new" do
  it_should_behave_like "a template that renders the users/form partial"
end