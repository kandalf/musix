require 'spec_helper'

describe Album do
  before do
    Album.destroy_all
    Artist.destroy_all
  end

  it "should have a name and artist to be valid" do
    artist = Artist.create(:name => "Pearl Jam")
    album = Album.new

    album.should_not be_valid

    album.artist = artist
    album.should_not be_valid

    album.name = "Riot Act"
    album.should be_valid
  end

  it "should belong to artist" do
    album = Album.new
    album.should respond_to :artist
  end
  
  it "should be unique per artist" do
    artist = Artist.create(:name => "Pearl Jam")
    Album.create(:name => "Ten", :artist_id => artist.id, :year => "1990")
    album = Album.new(:name => "Ten", :artist_id => artist.id)
    album.should_not be_valid

    album.name = "Yield"
    album.should be_valid

    artist = Artist.create(:name => "Stone Temple Pilots")
    album.name = "Ten"
    album.artist =  artist
    album.should be_valid
  end

end
