Feature: filter listings

  As a customer
  when I look for suitable storage
  I want to be able to get some listings according to my filters

Scenario: filter by valid zip code

  Given The StorageX has following listings
  | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |
  | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |
  | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 2           |            |            |
  | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 3           |            |            |
  And I am in the "listing index" page
  When I search listings with valid zip code - "10025"
  Then I should see 2 records


Scenario: filter by invalid zip code

  Given The StorageX has following listings
  | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |
  | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |
  | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 2           |            |            |
  | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 3           |            |            |
  And I am in the "listing index" page
  When I search listings with invalid zip code - "10001"
  Then I should see 0 records
