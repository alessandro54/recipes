# frozen_string_literal: true

When('I have several recipes on my repository') do
  FactoryBot.create_list(:recipe, 2, author: @user)
  expect(@user.recipes.count).to eq 2
end

And('I have my created calendar with title {string}') do |title|
  @calendar = FactoryBot.create(:calendar, title:, owners: [@user])
end

Given('I am on the calendar page') do
  visit calendar_path(@calendar)
  expect(page).to have_current_path("/calendars/#{@calendar.id}")
end

When('I click on an empty calendar day') do
  @date = Date.today.beginning_of_month

  click_button "empty-day-#{@date.day}"
end

Then('I should see the recipe list') do
  @recipes = @user.recipes
  @recipes.each do |recipe|
    expect(page).to have_text(recipe.title)
  end
end

When('I select a recipe from the list') do
  @clicked = @recipes.first
  within '#recipes' do
    click_link @clicked.id
  end
end

Then('I should see the recipe details displayed') do
  within '#recipe-details' do
    expect(page).to have_text(@clicked.title)
    expect(page).to have_text(@clicked.description)
  end
end

And('I select the {string} button') do |button|
  click_button button
end

Then('the recipe should be assigned to the calendar day') do
  expect(page).to have_text @clicked.title
end
