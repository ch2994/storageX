Feature: sort the result by some column

  As a customer
  when I search some listings
  I may want to see these returned listings sorted by some column


Scenario: I sorted the return by their daily prices

  Given The StorageX has following listings
    | storage_id | address                | zipcode | daily_price | email                   |
    | sx001      | 535 West 116TH ST      | 10025   | 30.5        | StorageX@columbia.edu   |
    | sx002      | 207 West 109TH ST      | 10025   | 20.5        | deo_zzh@qq.com          |
    | sx003      | 330 West 58TH ST       | 10019   | 25.5        | ch2994@columbia.edu     |
  And I am in the "listing index" page
  When I click the "daily_price" column
  Then I need to see the listings indexed by "daily_price"