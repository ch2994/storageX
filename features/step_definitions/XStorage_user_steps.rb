Then(/^I should see some "([^"]*)" listings$/) do |arg|
  pending
end

Given(/^The StorageX has following listings$/) do |table|
  table.rows().each do |listing|
    # table is a table.hashes.keys # => [:name, :address, :city, :state, :zipcode, :daily_price, :size, :customer_id, :created_at, :updated_at]
    Listing.create(:name => listing[0], :address => listing[1], :city => listing[2], :state => listing[3], :zipcode => listing[4],
                   :daily_price => listing[5], :size => listing[6], :customer_id => listing[7], :lat => listing[10], :lon => listing[11])
  end
end

Given(/^I am in the "([^"]*)" page$/) do |arg|
  if arg == 'listing index'
    visit "/listings"
  end
end

Given(/^I search listings with invalid zip code \- "([^"]*)"$/) do |zipcode|
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

When("I press {string} link") do |string|
  click_link('sign up')
end

Then("I should see {string}") do |string|
  if page.respond_to? :should
    page.should have_content(string)
  else
    assert page.has_content? string
  end
end


When(/^I am on the "([^"]*)" page$/) do |arg|
  if arg == 'sign up'
    click_link('sign up')
  elsif arg == 'log in'
    visit '/login'
  end
end

And(/^I create a valid account$/) do
  visit '/signup'
  fill_in 'Username', with: 'ChengTest123'
  fill_in 'Password', with: '123'
  fill_in 'First name', with: 'Cheng'
  fill_in 'Last name', with: 'Huang'
  fill_in 'Email', with: 'huangchengmars@gmail.com'
  fill_in 'Phone', with: '7173398709'
  click_button 'Save'
end

And(/^I create two customer accounts$/) do
  visit '/signup'
  fill_in 'Username', with: 'ChengTest123'
  fill_in 'Password', with: '123'
  fill_in 'First name', with: 'Cheng'
  fill_in 'Last name', with: 'Huang'
  fill_in 'Email', with: '123@gmail.com'
  fill_in 'Phone', with: '7173398709'
  click_button 'Save'

  visit '/signup'
  fill_in 'Username', with: 'ChengTest123'
  fill_in 'Password', with: '213'
  fill_in 'First name', with: 'Cheng'
  fill_in 'Last name', with: 'Huang'
  fill_in 'Email', with: '123@gmail.com'
  fill_in 'Phone', with: '7173398709'
  click_button 'Save'
end


Given(/^The StorageX has the following customers$/) do |table|
  # table is a table.hashes.keys # => [:username, :password_digest, :first_name, :last_name, :email, :phone, :created_at, :updated_at]
  table.rows().each do |listing|
    Customer.create(table.hashes)
  end
end

And(/^I enter the correct credential$/) do
  visit '/login'
  fill_in 'Email', with: 'huangchengmars@gmail.com'
  fill_in 'Password', with: '123'
  click_button 'Login'
end

And(/^I enter the incorrect credential$/) do
  fill_in 'Email', with: 'invalid_email'
  fill_in 'Password', with: 'invalid_passcode'
  click_button 'Login'
end

When(/^I click the "([^"]*)" link$/) do |arg|
  if arg == 'Add New Listing'
    click_button('Add New Listing')
  end
end

Given(/^I logged in already$/) do
  visit '/signup'
  fill_in 'Username', with: 'ChengTest123'
  fill_in 'Password', with: '123'
  fill_in 'First name', with: 'Cheng'
  fill_in 'Last name', with: 'Huang'
  fill_in 'Email', with: 'huangchengmars@gmail.com'
  fill_in 'Phone', with: '7173398709'
  click_button 'Save'

  visit '/login'
  fill_in 'Email', with: 'huangchengmars@gmail.com'
  fill_in 'Password', with: '123'
  click_button 'Login'
end

And(/^I create a valid listing$/) do
  visit '/listings/new'
  fill_in 'listing[name]', with: 'TestListing'
  fill_in 'listing[zipcode]', with: '10019'
  fill_in 'listing[daily_price]', with: '100'
  fill_in 'listing[address]', with: '330 West 58th Street'
  fill_in 'listing[city]', with: 'New York'
  fill_in 'listing[state]', with: 'NY'
  fill_in 'listing[size]', with: '200'
  click_button 'Save'
end