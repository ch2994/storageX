Feature: filter listings

  As a customer
  when I look for suitable storage
  I want to be able to get some listings according to my filters


Scenario: filter by valid zip code

  Given I logged in already
  And The StorageX has the following customers
    | id | username  | password_digest | first_name | last_name | email | phone | created_at | updated_at |
    | 1  | niuyinmei | e1e6984d48ce6c0cd7473c487e6fe33d | Niuyin | Mei | jeff_mei@outlook.com  | 365-187-1798 | 2020-02-02 | 2020-03-02 |
  And The StorageX has following listings
    | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |  lat       | lon       |
    | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |  40.73802  | -73.9883  |
    | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 1           |            |            |  40.6991   | -73.99441 |
    | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 1           |            |            |  40.77701  | -73.98061 |
  And I am in the "listing index" page
  When I search listings with valid zip code - "10025"
  Then I should see 2 records


Scenario: filter by invalid zip code

  Given The StorageX has the following customers
    | id | username  | password_digest | first_name | last_name | email | phone | created_at | updated_at |
    | 1  | niuyinmei | e1e6984d48ce6c0cd7473c487e6fe33d | Niuyin | Mei | jeff_mei@outlook.com  | 365-187-1798 | 2020-02-02 | 2020-03-02 |
  And The StorageX has following listings
    | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |  lat       | lon       |
    | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |  40.73802  | -73.9883  |
    | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 1           |            |            |  40.6991   | -73.99441 |
    | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 1           |            |            |  40.77701  | -73.98061 |
  And I am in the "listing index" page
  When I search listings with invalid zip code - "10001"
  Then I should see 0 records
