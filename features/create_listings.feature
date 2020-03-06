Feature: Create Listing

Scenario: Create listing before log in

  Given I am in the "listing index" page
  And I click the "Add New Listing" link
  Then I should see "Please sign in before posting a new listing, thanks."


Scenario: Create listing after log in

  Given I logged in already
  And  I am in the "listing index" page
  When  I click the "Add New Listing" link
  Then I should see "Create New Listing"

Scenario: Verify created list

  Given I logged in already
  And  I am in the "listing index" page
  When  I click the "Add New Listing" link
  And I create a valid listing
  Then I should see "New listing added successfully!"