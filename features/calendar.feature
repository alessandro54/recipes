Feature: Calendar
  As a user
  I want to log in to the app
  So that I can access to the application

  Background:
    Given the following user credentials:
      | email         | password |
      | test@test.com | test123  |
    And I have access to the app

  Scenario: Main calendar visualization
    Given I am logged in
    When I visit the calendar index page
    Then I should see my main calendar


