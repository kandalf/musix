class Album < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => { :scope => :artist_id }
  validates :artist_id, :presence => true

  belongs_to :artist
end
