# frozen_string_literal: true

Given('I have calendars title {string} and {string}') do |title1, title2|
  @user.calendars << @calendar1 = FactoryBot.create(:calendar, title: title1)
  @user.calendars << @calendar2 = FactoryBot.create(:calendar, title: title2)

  expect(@user.calendars.length).to eq 2
end

When('I go to the list of calendars') do
  visit calendars_path

  expect(page).to have_current_path('/calendars')
end

Then('I should see {string} and {string} titles') do |title1, title2|
  expect(page).to have_content(title1)
  expect(page).to have_content(title2)
end
