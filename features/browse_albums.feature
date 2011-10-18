Feature: List Albums
In order to see the albums collection information
As a system user
I want to be able to list the albums.


  Scenario: User navigates the root path
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |
      | Vs       | Pearl Jam | 1993 |
      | Vitalogy | Pearl Jam | 1994 |
      | No Code  | Pearl Jam | 1996 |

     When I go to the albums path
     Then I should see "Ten"
      And I should see "Vs"
      And I should see "Vitalogy"
      And I should see "No Code"


  Scenario: User can access the album creation page from albums index
    Given I go to the albums path
     When I click "New Album"
     Then I should be on the "new album" page

  Scenario: User can edit and destroy albums from the albums index
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |
      | Vs       | Pearl Jam | 1993 |
    
     When I go to the albums path
     Then I should see "Edit" 2 times
      And I should see "Destroy" 2 times
