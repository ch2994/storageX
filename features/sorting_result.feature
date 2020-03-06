Feature: sort the result by some column

  As a customer
  when I search some listings
  I may want to see these returned listings sorted by some column


Scenario: I sorted the return by their daily prices

  Given The StorageX has following listings
    | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |
    | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |
    | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 2           |            |            |
    | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 3           |            |            |
  And I am in the "listing index" page
  When I click the "daily_price" column
  Then I need to see the listings indexed by "daily_price"