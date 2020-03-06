Feature: show the list of all available storage

  As a customer
  when I open the main page
  I want to see some storage listings

Scenario: I access to the main page

  Given The StorageX has following listings
  | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |
  | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |
  | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 2           |            |            |
  | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 3           |            |            |
  And I am in the "listing index" page
  Then I should see 3 records




