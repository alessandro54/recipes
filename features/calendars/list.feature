Feature: Visualize calendar list
  As a registered user with calendars
  I want to manage my calendars

  Background:
    Given I am logged in as 'test@hotmail.com' with password 'test123'

  Scenario: Calendar List
    Given I have calendars title 'Test test' and 'Test2 test2'
    When I go to the list of calendars
    Then I should see 'Test test' and 'Test2 test2' titles
