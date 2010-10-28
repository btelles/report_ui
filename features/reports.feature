Feature: Manage reports

  Scenario: Viewing a list of reports
    Given An existing "report" with "name" "Some report"
    And I am on the reports page
    Then I should see "Some report"

#  Scenario: Editing an existing report
#    Given An existing "report" with "name" "Tommy Test"
#    And   with "code" "Person.where('last_name = "tommy"')"
#    And   with "description" "My report's description."
#    And   I am on the reports page
#    When  I press "Tommy Test"
#    Then  I should see "Edit"
#    When  I press "Edit"
#    Then  I should see "Editing Tommy Test"
#    And   I should see "Columns"
#    And   I should see "Filters"
#    And   I should see "Sorts"

  Scenario: Creating reports
    Given I am on the new report page
    Then  I should see "Creating a new report"
    When  I fill in "report_name" with "My new report"
    And   I follow "Edit" within "#columns"
    And   I check "Person_last_name"
    And   I press "Ok"
    Then  the "Person_last_name" checkbox within "#columns_editor" should be checked
    And   I press "Run/Save"
    Then  I should see "You've successfully created a report"

  Scenario: Viewing reports
    Given An existing "report" with "name" "Tommy Test"
    And   with "code" "Person.where('last_name = "tommy"')"
    And   with "description" "My report's description."
    And   An existing "person" with "last_name" "tommy"
    When I go to that report's page
    Then I should see "Tommy Test"
    And  I should see "Last name"
    And  I should see "tommy" within "table"
    And  I should see "My report's description"
