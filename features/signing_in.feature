Feature: Signing in

  Scenario: Successful signin
    Given a user visits the signin page
    And the user has an account
    When the user submits valid signin information
    Then he should see his profile page
    And he should see a signout link
    When the user signout
    Then he should see main page
