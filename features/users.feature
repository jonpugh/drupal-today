@api
Feature:

  Scenario: Most recently logged-in users appear in a block.
    Given users:
    | name     | mail               | status | login      | created     |
    | Alex     | alex@drupal.org    | 1      | 1633900000 | 1633900000 |
    | Blake    | blake@drupal.org   | 1      | 1633800000 | 1633800000 |
    | Charlie  | charlie@drupal.org | 1      | 1633700000 | 1633700000 |
    | Drew     | drew@drupal.org    | 1      | 1633600000 | 1633600000 |
    | Ezra     | ezra@drupal.org    | 1      | 1633500000 | 1633500000 |
    | Frances  | frances@drupal.org | 1      | 1633400000 | 1633400000 |

    When I am logged in as "Alex"
    And I am on the homepage

    # Confirm latest 5 users show.
    Then I should see "Alex"
    Then I should see "Blake"
    Then I should see "Charlie"
    Then I should see "Drew"
    Then I should see "Ezra"

    # Confirm 6th oldest users does not show.
    And I should not see "Frances"

    # Confirm user profiles are not clickable.
    And I should see the link "Alex"
    And I should not see the link "Blake"
    And I should not see the link "Charlie"
