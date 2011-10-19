Feature: List Albums
In order to maintain my music collection
As a system user
I want to be able create an album.


  Scenario: User creates an album by poviding all the required information
    Given there's no albums
     When I go to the new "album" page
      And I fill in "artist" with "Pearl Jam"
      And I fill in "name" with "Binaural"
      And I fill in "year" with "2000"
      And I click "Create Album"
     Then I should see "Album created successfuly"
      And I should be on the "albums" page
      And there should be 1 album

  Scenario: User does not provide all the required info
    Given there's no albums
     When I go to the new "album" page
      And I fill in "artist" with "Soundgarden"
      And I click "Create Album"
     Then I should see "The album cannot be saved"
      And I should see "Name can't be blank"
