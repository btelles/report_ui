Feature: Manage reports

  Scenario: Viewing a list of reports
    Given An existing "report" with "name" "Some report"
    And I am on the reports page
    Then I should see "Some report"

 # Scenario: Creating reports
 #   Given I am on the new report page
 #   Then  I should see "Creating a new report"
 #   When  I fill in "name" with "My new report"
 #   And   I press "edit" within "columns"
 #   And   I press "submit"
 #   Then  I should see "You've successfully created a report"

  Scenario: Viewing reports
    Given An existing "report" with "name" "Tommy Test"
    And   with "code" "Person.where('last_name = "tommy"')"
    And   An existing "person" with "last_name" "tommy"
    When I go to that report's page
    Then I should see "Tommy Test"
    And  I should see "tommy" within "table"
