Feature: Manage account
  In order to effectively use the site
  a user
  wants to be able to signup and manage his account.

  Scenario: Register new user without errors
    Given I am on the new user page
    When I fill in "Email" with "new-cucumber-user-1@example.com"
    And I fill in "Password" with "password 1"
    And I press "Sign Up"
    Then I should see "Your user has been created.  Check your email for an activation message"

  Scenario: Register new user with errors
    Given I am on the new user page
    When I fill in "Email" with ""
    And I fill in "Password" with "password 1"
    And I press "Sign Up"
    Then I should see that there is an error on "Email"

  Scenario: Update login settings without errors
    Given I have already signed up
    And I am on the edit user page
    When I fill in "Email" with "edited-cucumber-user-1@example.com"
    And I fill in "Password" with "password 2"
    And I press "Save"
    Then I should see "Your settings have been successfully updated"

  Scenario: Update login settings with errors
    Given I have already signed up
    And I am on the edit user page
    When I fill in "Email" with ""
    And I fill in "Password" with "password 2"
    And I press "Save"
    Then I should see that there is an error on "Email"
