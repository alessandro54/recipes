# frozen_string_literal: true

Given('I am logged in as {string} with password {string}') do |email, password|
  @user = FactoryBot.create(:user, email:, password:)

  visit login_path

  fill_in 'Email', with: email
  fill_in 'Password', with: password

  click_on 'Sign in'

  expect(page).to have_text('Logged in successfully.')
end
