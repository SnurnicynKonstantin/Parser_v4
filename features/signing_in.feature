Feature: Signing in

  Scenario: Successful signin
    Given a user visits the signin page
    And the user has an account
    When the user submits valid signin information
    Then he should see his profile page
    And he should see a signout link

  Scenario: Successful signout
    Given the user has an account
    And sign in
    When the user signout
    Then he should see main page

  Scenario: Successful signout
    Given the user has an account
    And sign in
    When the user signout
    Then he should see main page
