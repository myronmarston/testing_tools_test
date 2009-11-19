shared_examples_for "a template that renders the users/form partial" do
  before(:each) do
    assigns[:user] ||= stub_model(User)
  end

  it "should render the users/_form partial" do
    stub.proxy(template).render.with_any_args.any_number_of_times
    mock(template).render(hash_including(:partial => 'form'))
    render
  end
end