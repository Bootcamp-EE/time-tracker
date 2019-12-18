Feature: HomePage

  Scenario: I should see a hello world message on the home page
    Given I open the home page
    Then I MUST see a message "Hello, world!"
