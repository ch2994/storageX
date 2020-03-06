Feature: sign up

  As a customer
  when I enter the correct credentials
  I want to be able to login

Scenario: access the signup page

  Given I am in the "listing index" page
  When I press "Sign up" link
  Then I should see "New customer"


Scenario: create a new customer

  Given I am in the "listing index" page
  When I am on the "sign up" page
  And I create a valid account
  Then I should see "Customer was successfully created."


