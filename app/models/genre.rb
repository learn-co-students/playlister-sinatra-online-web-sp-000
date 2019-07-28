class Genre < ActiveRecord::Base
  extend Concerns::Slugable
  include Concerns::Slugable
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
