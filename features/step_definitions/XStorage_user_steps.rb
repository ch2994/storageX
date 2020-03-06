Then(/^I should see some "([^"]*)" listings$/) do |arg|
  pending
end

Given(/^The StorageX has following listings$/) do |table|
  table.rows().each do |listing|
    # table is a table.hashes.keys # => [:name, :address, :city, :state, :zipcode, :daily_price, :size, :customer_id, :created_at, :updated_at]
    Listing.create(:name => listing[0], :address => listing[1], :city => listing[2], :state => listing[3], :zipcode => listing[4],
                   :daily_price => listing[5], :size => listing[6], :customer_id => listing[7])
  end
end

Given(/^I am in the "([^"]*)" page$/) do |arg|
  if arg == 'listing index'
    visit "/listings"
  end
end

When(/^I search listings with invalid zip code \- "([^"]*)"$/) do |zipcode|
  # pending
  fill_in('condition[zipcode]', :with => zipcode)
  click_button('Filter')
end

When(/^I search listings with valid zip code \- "([^"]*)"$/) do |zipcode|
  fill_in('condition[zipcode]', :with => zipcode)
  click_button('Filter')
end


Then(/^I should see (\d+) records$/) do |number_of_rows|
  actual_number = page.all('#listing_table tr').size
  actual_number == (number_of_rows + 1)
end

When(/^I click the "([^"]*)" column$/) do |col|
  if Listing::sym2name.include?col
    click_link(Listing::sym2name[col.to_sym])
  else
    "Error: Listing Index page don't have the column that supports sorting."
  end
end

Then(/^I need to see the listings indexed by "([^"]*)"$/) do |col|
  pending
end