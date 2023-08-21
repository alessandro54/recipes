Feature: Assign a recipe to a day inside the Calendar
  As a registered user with calendars
  I want to assign a recipe to my calendar through the calendar interface

  Background:
    Given I am logged in as 'test@hotmail.com' with password 'test123'
    When I have several recipes on my repository
    And I have my created calendar with title 'Awesome title'

  @javascript
  Scenario: Assign recipe to a Calendar day
    Given I am on the calendar page
    When I click on an empty calendar day
    Then I should see the recipe list
    When I select a recipe from the list
    Then I should see the recipe details displayed
    And I select the 'Assign' button
    Then the recipe should be assigned to the calendar day

