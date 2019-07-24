class Song < ActiveRecord::Base
  extend Concerns::Slugable
  include Concerns::Slugable
  belongs_to :artist #need a foreign key(artist_id)
  has_many :song_genres
  has_many :genres, through: :song_genres
end
