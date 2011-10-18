require 'spec_helper'

describe Album do
  before do
    Album.destroy_all
  end

  it "should have a name and artist to be valid" do
    album = Album.new
    album.should_not be_valid

    album.artist = "Pearl Jam"
    album.should_not be_valid

    album.name = "Riot Act"
    album.should be_valid
  end
  
  it "should be unique per artist" do
    Album.create(:name => "Ten", :artist => "Pearl Jam", :year => "1990")
    album = Album.new(:name => "Ten", :artist => "Pearl Jam")
    album.should_not be_valid

    album.name = "Yield"
    album.should be_valid

    album.name = "Ten"
    album.artist = "Stone Temple Pilots"
    album.should be_valid
  end
end
