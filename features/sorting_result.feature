Feature: sort the result by some column

  As a customer
  when I search some listings
  I may want to see these returned listings sorted by some column


Scenario: I sorted the return by their daily prices
  Given The StorageX has the following customers
    | id | username  | password_digest | first_name | last_name | email | phone | created_at | updated_at |
    | 1  | niuyinmei | e1e6984d48ce6c0cd7473c487e6fe33d | Niuyin | Mei | jeff_mei@outlook.com  | 365-187-1798 | 2020-02-02 | 2020-03-02 |
  And The StorageX has following listings
    | name | address           | city     | state | zipcode | daily_price | size | customer_id | created_at | updated_at |  lat       | lon       |
    | S1   | 535 West 116TH ST | New York | NY    | 10025   | 30.5        | 100  | 1           |            |            |  40.73802  | -73.9883  |
    | S2   | 207 West 109TH ST | New York | NY    | 10025   | 20.5        | 200  | 1           |            |            |  40.6991   | -73.99441 |
    | S3   | 330 West 58TH ST  | New York | NY    | 10019   | 25.5        | 300  | 1           |            |            |  40.77701  | -73.98061 |
  And I am in the "listing index" page
  When I click the "daily_price" column
#  Then I need to see the listings indexed by "daily_price"