Then /^I should see that there is an error on "([^\"]*)"$/ do |field|
  response.should have_selector('#errorExplanation') do |div|
    div.should have_selector('li') do |li|
      li.should contain(field)
    end
  end
end