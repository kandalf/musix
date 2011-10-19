require 'spec_helper'

describe Artist do
  before do
    Artist.destroy_all
    Album.destroy_all
  end

  it "should have a name to be valid" do
    artist = Artist.new
    artist.should_not be_valid

    artist.name = 'Stone Temple Pilots'
    artist.should be_valid
  end

  it "should have a unique name to be valid" do
    Artist.create(:name => "Pearl Jam")
    artist = Artist.new(:name => "Pearl Jam")
    artist.should_not be_valid

    artist.name = 'Stone Temple Pilots'
    artist.should be_valid
  end

  it "should have albums" do
    artist = Artist.new
    artist.should respond_to :albums
  end

  it "should destroy albums when destroyed" do
    artist = Artist.create(:name => "Stone Temple Pilots")
    Album.count.should == 0

    artist.albums.create(:name => "Core", :year => "1992")
    artist.albums.create(:name => "Purple", :year => "1994")

    artist.destroy
    Album.count.should == 0
  end
end
