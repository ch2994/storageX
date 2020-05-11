Feature: Create Booking

  Scenario: Check if user is able to book after log in

    Given I logged in already
    And  I am in the "listing index" page
    And I create a valid listing
#    When  I click the "More Details" link
#    Then I should see "Book"

  Scenario: Verify created list

    Given I logged in already
    And  I am in the "listing index" page
    When  I click the "Add New Listing" link
    And I create a valid listing
    Then I should see "New listing added successfully!"