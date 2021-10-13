@api
Feature:

  Scenario: Most recently logged-in users appear in a block.
    Given users:
    | name     | mail               | status | login     |
    | Alex     | alex@drupal.org    | 1      | 1634900000 |
    | Blake    | blake@drupal.org   | 1      | 1633800000 |
    | Charlie  | charlie@drupal.org | 1      | 1634700000 |
    | Drew     | drew@drupal.org    | 1      | 1634600000 |
    | Ezra     | ezra@drupal.org    | 1      | 1634500000 |
    | Frances  | frances@drupal.org | 1      | 1634400000 |

    And I am on the homepage
    Then show last response

    # Confirm latest 5 users show.
    Then I should see "Alex"
    Then I should see "Blake"
    Then I should see "Charlie"
    Then I should see "Drew"
    Then I should see "Ezra"

    # Confirm 6th oldest users does not show.
    And I should not see "Frances"

    # Confirm user profiles are not clickable.
    And I should not see the link "Alex"
