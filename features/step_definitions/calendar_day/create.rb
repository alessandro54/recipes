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
  click_button 'empty-day-1'
end

Then('I should see the recipe list') do
  @recipes = @user.recipes
  @recipes.each do |recipe|
    expect(page).to have_text(recipe.title)
  end
  screenshot_and_open_image

end

When('I select a recipe from the list') do
  within '#recipes' do
    click_link @recipes.first.id
  end
end

Then('I should see the recipe details displayed') do
  screenshot_and_open_image
end
