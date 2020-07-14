class Artist < ActiveRecord::Base
  extend Slugs::ClassMethod
  include Slugs::InstanceMethod
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: :songs
end
