Feature: Login
  As a user
  I want to log in to the app
  So that I can access to the application

  Background:
    Given the following user exists:
      | email         | password |
      | test@test.com | test123  |
    And I am on the login page

  Scenario: Successful login
    When I fill in the following:
      | Email         | Password |
      | test@test.com | test123  |
    And I click on the 'Sign in' button
    Then I should be logged in
