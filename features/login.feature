Feature: log in

  As a customer
  when I enter the correct credentials
  I want to be able to login

  Scenario: log in with correct credentials
    Given I create a valid account
    When I am on the "log in" page
    And I enter the correct credential
    Then I should see "Logged in!"

  Scenario: log in with incorrect credentials
    Given I create a valid account
    When I am on the "log in" page
    And I enter the incorrect credential
    Then I should see "Email or password is invalid"