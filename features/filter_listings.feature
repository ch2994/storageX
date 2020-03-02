Feature: filter listings

  As a customer
  when I look for suitable storage
  I want to be able to get some listings according to my filters

Scenario: filter by valid zip code

  Given The StorageX has following listings
  | storage_id | address                | zipcode | daily_price | email                   |
  | sx001      | 535 West 116TH ST      | 10025   | 30.5        | StorageX@columbia.edu   |
  | sx002      | 207 West 109TH ST      | 10025   | 20.5        | deo_zzh@qq.com          |
  | sx003      | 330 West 58TH ST       | 10019   | 25.5        | ch2994@columbia.edu     |
  And I am in the "home" page
  When I search listings with valid zip code - "10025"
  Then I should see 2 records


Scenario: filter by invalid zip code

  Given The StorageX has following listings
    | storage_id | address                | zipcode | daily_price | email                   |
    | sx001      | 535 West 116TH ST      | 10025   | 30.5        | StorageX@columbia.edu   |
    | sx002      | 207 West 109TH ST      | 10025   | 20.5        | deo_zzh@qq.com          |
    | sx003      | 330 West 58TH ST       | 10019   | 25.5        | ch2994@columbia.edu     |
  And I am in the "home" page
  When I search listings with invalid zip code - "10001"
  Then I should see 0 records
