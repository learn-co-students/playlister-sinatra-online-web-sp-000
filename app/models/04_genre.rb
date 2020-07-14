class Genre < ActiveRecord::Base
  extend Slugs::ClassMethod
  include Slugs::InstanceMethod
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
