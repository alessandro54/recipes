# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

user1 = User.create(
  first_name: 'Alessandro',
  last_name: 'Chumpitaz',
  email: 'par_214@hotmail.com',
  password: 'test123',
  username: 'sanity'
)

user2 = User.create(
  first_name: 'Gabriela',
  last_name: 'Calvo',
  email: 'abigabrielac@hotmail.com',
  password: 'test123',
  username: 'abigabrielac'
)

user3 = User.create(
  first_name: 'Michael',
  last_name: 'Campos',
  email: 'michael@gmail.com',
  password: 'test123',
  username: 'crazyman'
)

calendar1 = Calendar.create(
  title: 'Calendar for oriental food'
)
calendar2 = Calendar.create(
  title: 'Personal Calendar'
)
calendar3 = Calendar.create(
  title: 'Calendar for party'
)

user1.calendars << calendar1
user2.calendars << calendar1

user1.calendars << calendar2

user1.calendars << calendar3

user1.update(main_calendar: calendar1)

user3.follow(calendar: calendar1)
user3.follow(calendar: calendar3)

recipes = create_list(:recipe, 30, author: user1)

(Date.today.beginning_of_month..Date.today.end_of_month - 21).each do |date|
  create(:day, when: date, calendar: calendar1, recipe: recipes.sample)
end
