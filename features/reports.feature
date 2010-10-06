Feature: Manage reports

  Scenario: Creating reports
    Given I am on the new report page
    Then I should see "Creating a new report"

  Scenario: Viewing reports
    Given An existing report with "name" "Tommy Test"
    When I go to that report's page
    Then I should see "Tommy Test"
