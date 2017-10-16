@121 @time-travel
Feature: Link to broadcast details page on every broadcast card
  As a user who is currently choosing which broadcsts to support
  I would like to see a detailed view when I click on a certain button on the card
  In order to focus on the information of that broadcast

  Background:
    Given I am logged in
    And the current date is "2017-08-01"
    And we have these broadcasts in our database:
      | Title                | Medium | Station   | Created at | Updated at | Description                                                    |
      | Medienmagazin        | Radio  | radioeins | 2017-07-27 | 2017-08-01 | Welche Zukunft hat die ARD? Antworten gibt's im Medienmagazin. |

  Scenario: Click on details button to get to broadcast details page
    Given I visit the find broadcasts page
    And I click on the magnifier symbol next to "Medienmagazin"
    Then I see only this broadcast and nothing else, in order to stay focused
    And I can see even more details:
      | createdAt      | 7/27/2017 |
      | updatedAt | 8/1/2017  |

  Scenario: Navigating back and forth brings me back to the last page of "Find broadcasts"
    Given there are 10 other broadcasts, with a title lexicographically before 'Medienmagazin'
    And I visit the find broadcasts page
    And I click on the button to order broadcasts in ascending order
    When I click on "Next"
    And I click on the magnifier symbol next to "Medienmagazin"
    Then I see only this broadcast and nothing else, in order to stay focused
    But if I click on the close icon
    Then I see the broadcast "Medienmagazin" among 5 other broadcasts again
