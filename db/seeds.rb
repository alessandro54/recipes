# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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

user2.follow(calendar: user1.calendar)

recipe1 = Recipe.create(
  title: 'Chicken with rice',
  description: 'Lorem ipsum',
  steps: ['Fry the chicken', 'Then put the rice'],
  ingredients: ['1 Chicken', '1 kg of rice'],
  author: user1
)

recipe2 = Recipe.create(
  title: 'Chips and fish',
  description: 'Lorem ipsum',
  steps: ['Fry the chips', 'Then put the fish'],
  ingredients: ['1 Fish', '1 kg of chips'],
  author: user1
)

Day.create(
  when: Date.today + 1,
  recipe: recipe1,
  calendar: user1.calendar
)

Day.create!(
  when: Date.today + 2,
  recipe: recipe2,
  calendar: user1.calendar
)
