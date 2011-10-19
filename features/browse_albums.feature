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
    Given I am on the albums page
     When I click "New Album"
     Then I should be on the new "album" page

  Scenario: User can edit and destroy albums from the albums index
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |
    
     When I go to the albums path
     Then I should see "Edit"
      And I should see "Destroy"


  Scenario: User edits an album from the albums index
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |

      And I am on the albums page
     When I click "Edit"
      And I fill in "name" with "Riot Act"
      And I fill in "year" with "2002"
      And I click "Update Album"
     Then I should be on the "albums" page
      And I should see "Album updated successfuly"
      And I should see "Riot Act"
      And I should not see "Ten"

  Scenario: User fails to edit an album from the albums index
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |

      And I am on the albums page
     When I click "Edit"
      And I fill in "name" with ""
      And I fill in "year" with "2002"
      And I click "Update Album"
     Then I should see "The album cannot be updated"
      And I should see "Name can't be blank"


  Scenario: User destroys an album from the albums index
    Given the following albums exist
      | name     | artist    | year |
      | Ten      | Pearl Jam | 1990 |

      And I am on the albums page
     When I click "Destroy"
     Then I should see "Album was destroyed"
      And I should not see "Ten"
      And there should be 0 albums
      And I should be on the "albums" page
