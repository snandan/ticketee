Feature: Seed Data
  In order to fill the database with the basics
  As a system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seen task
    And I am signed in as "admin@ticketee.com"
    Then I should see "Ticketee Beta"
