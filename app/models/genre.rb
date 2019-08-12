class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethod
  include Slugifiable::InstanceMethod

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
