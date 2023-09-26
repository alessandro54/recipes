Feature: Create a new calendar
  As a registered user in the application
  I want to create a new calendar to storage my recipes, or organize my meals

  Background:
    Given I am logged in as 'test@hotmail.com' with password 'test123'
    When I have several recipes on my repository
    And I have my created calendar with title 'Awesome title'


  @javascript
  Scenario: Create a new Calendar
    Given I am on the calendar index page
    When I fill the calendar title input
    Then I click to Add calendar button
    And I should see the new calendar on the list


