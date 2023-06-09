# frozen_string_literal: true

Given('the following user exists:') do |table|
  attributes = table.hashes.first
  FactoryBot.create(:user, :with_main_calendar, **attributes)
end

And('I am on the login page') do
  visit login_path
  expect(page).to have_current_path('/login')
end

When('I fill in the following:') do |table|
  table.hashes.each do |row|
    fill_in 'Email', with: row['Email']
    fill_in 'Password', with: row['Password']
  end
end

And('I click on the {string} button') do |button_text|
  click_button button_text
end

Then('I should be logged in') do
  expect(page).to have_content('Logged in succesfully.')
end
