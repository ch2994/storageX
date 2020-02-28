Given(/^I am on the home page$/) do
  pending
end

Then(/^I should see some "([^"]*)" listings$/) do |arg|
  pending
end

Given(/^The StorageX has following listings$/) do |table|
  table.rows().each do |listing|
  # table is a table.hashes.keys # => [:storage_id, :address, :zipcode, :daily_price, :email]
    Listing.create(:storage_id => listing[0], :address => listing[1], :zipcode => listing[2], :daily_price => listing[3], :email => listing[4])
  end
end

When(/^I am in the "([^"]*)" page$/) do |arg|
  if arg == 'home'
    visit "/index"
  end
end

And(/^I search listings with valid zip code \- "([^"]*)"$/) do |arg|
  fill_in("zipcode", :with => arg)
  click_button('Filter')
end


Then(/^I should see (\d+) records$/) do |arg|
  pending
end