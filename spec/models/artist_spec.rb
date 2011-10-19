require 'spec_helper'

describe Artist do
  before do
    Artist.destroy_all
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
end
