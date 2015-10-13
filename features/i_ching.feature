Feature: Starting the app
  As a user starting the app
  I want the app in the correct state
  So I can use it

  Scenario: Main screen
    Given I start the app
    Then the screen should match "hexagram table screen"

  Scenario: Hexagram screen
    Given I start the app
    When I touch "The Creative"
    Then the screen should match "hexagram screen for The Creative"

  Scenario: Navigation bar - navigating back
    Given I start the app
    When I touch "The Creative"
    And I touch "IChing"
    Then the screen should match "hexagram table screen"

  Scenario: Navigation bar - a different hexagram
    Given I start the app
    When I touch "The Creative"
    And I touch "IChing"
    And I touch "The Receptive"
    Then the screen should match "hexagram screen for The Receptive"
