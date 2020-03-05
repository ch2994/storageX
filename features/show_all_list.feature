Feature: show the list of all available storage

  As a customer
  when I open the main page
  I want to see some storage listings

Scenario: I access to the main page

  Given The StorageX has following listings
  | storage_id | address                | zipcode | daily_price | email                   |
  | sx001      | 535 West 116TH ST      | 10025   | 30.5        | StorageX@columbia.edu   |
  | sx002      | 207 West 109TH ST      | 10025   | 20.5        | deo_zzh@qq.com          |
  | sx003      | 330 West 58TH ST       | 10019   | 25.5        | ch2994@columbia.edu     |
  And I am in the "listing index" page
  Then I should see 3 records




