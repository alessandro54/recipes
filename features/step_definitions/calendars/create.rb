# frozen_string_literal: true

Given(/^I am on the calendar index page$/) do
  visit calendars_path
  expect(page).to have_current_path('/calendars')
end

When(/^I fill the calendar title input$/) do
  fill_in 'calendar_title', with: 'My new calendar'
end

Then(/^I click to Add calendar button$/) do
  click_button 'Add calendar'
end

And(/^I should see the new calendar on the list$/) do
  expect(page).to have_text('My new calendar')
end
