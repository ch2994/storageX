Feature: Upload Pictures

  Scenario: Verify the upload button exists when creating a listing

    Given I logged in already
    And  I am in the "listing index" page
    When  I click the "Add New Listing" link
    Then I should see "Upload Photos"

